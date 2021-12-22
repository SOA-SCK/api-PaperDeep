# frozen_string_literal: true

require_relative '../init'

require 'figaro'
require 'shoryuken'

# Shoryuken worker class to clone repos in parallel
class CitationTreeWorker
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
  shoryuken_options queue: config.TREE_QUEUE_URL, auto_delete: true

  def perform(_sqs_msg, request)
    request = JSON.parse(request)
    root_paper = PaperDeep::Repository::For.klass(PaperDeep::Entity::Paper).find_eid(request['eid'])
    if root_paper.nil?
        return { result: false, error: 'Having trouble getting publication from database' }.to_json
    end
    # response.cache_control public: true, max_age: 300
    scopus = PaperDeep::PaperMapper.new(CitationTreeWorker.config.api_key)
    tree = PaperDeep::Service::CreateCitationTree.new(scopus, root_paper.content)
    tree.create
    tree_hash = tree.return_tree
    tree_hash.to_json
    puts tree_hash.to_json
  rescue StandardError
    puts 'CITATION TREE CREATION FAIL'
  end
end