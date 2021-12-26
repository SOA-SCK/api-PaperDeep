# frozen_string_literal: true

require_relative '../init'
require_relative 'tree_monitor'
require_relative 'job_reporter'

require 'figaro'
require 'shoryuken'

# Shoryuken worker class to clone repos in parallel
module TreeBuild
  class Worker
    # Environment variables setup
    Figaro.application = Figaro::Application.new(
      environment: ENV['RACK_ENV'] || 'development',
      path: File.expand_path('config/secrets.yml')
    )
    Figaro.load
    def self.config() = Figaro.env

    Shoryuken.sqs_client = Aws::SQS::Client.new(
      access_key_id: config.AWS_ACCESS_KEY_ID,
      secret_access_key: config.AWS_SECRET_ACCESS_KEY,
      region: config.AWS_REGION
    )

    include Shoryuken::Worker
    Shoryuken.sqs_client_receive_message_opts = { wait_time_seconds: 20 }
    shoryuken_options queue: config.TREE_QUEUE_URL, auto_delete: true

    def perform(_sqs_msg, request)
      request = JSON.parse(request)
      job = JobReporter.new(request, Worker.config)
      job.report(BuildMonitor.starting_percent)
      root_paper = PaperDeep::Repository::For.klass(PaperDeep::Entity::Paper).find_eid(request['eid'])
      if root_paper.nil?
          return { result: false, error: 'Having trouble getting publication from database' }.to_json
      end
      # response.cache_control public: true, max_age: 300
      scopus = PaperDeep::PaperMapper.new(Worker.config.api_key)
      tree = PaperDeep::Service::CreateCitationTree.new(scopus, root_paper.content)
      job.report(BuildMonitor.searching_percent)

      tree.create
      job.report(BuildMonitor.building_percent)

      # Keep sending finished status to any latecoming subscribers
      job.report_each_second(5) { BuildMonitor.finished_percent }
    rescue StandardError => e
      puts e.to_s
      # worker should crash fail early - only catch errors we expect!
      puts 'CITATION TREE CREATION FAIL'
    end
  end
end