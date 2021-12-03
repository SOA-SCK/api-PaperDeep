# frozen_string_literal: true

require 'roda'
require 'slim'
require 'rack/cors'
require 'json'

module PaperDeep
  # Web App
  class App < Roda
    # use Rack::Cors, debug: true, logger: Logger.new($stdout) do
    #   allowed_methods = %i[get post put delete options head]
    #   allow do
    #     origins 'localhost:3000'
    #     resource '*', headers: :any, methods: allowed_methods, credentials: true
    #   end
    # end

    plugin :halt

    route do |routing|
      #   For Apis
      routing.on 'api/v1' do 
        routing.on 'search' do
          routing.is do
            # POST /search/
            routing.post do
              params = JSON.parse(routing.body.read)
              result = PaperDeep::Service::AddPaper.new.call(params)

              if result.failure?
                failed = Representer::HttpResponse.new(result.failure)
                routing.halt failed.http_status_code, failed.to_json
              end

              http_response = Representer::HttpResponse.new(result.value!)
              response.status = http_response.http_status_code

              paper_list = Representer::Papers.new(result.value!.message["keyword"],result.value!.message[:paper])
              return Representer::PaperList.new(paper_list).to_json
            end
          end
        end
        routing.on 'citationtree' do
          routing.is do
            # GET /search/citationtree
            routing.get do
              root_paper = session[:paper].first
              scopus = PaperDeep::PaperMapper.new(App.config.api_key)

              tree = PaperDeep::Service::CreateCitationTree.new(scopus, root_paper)
              tree.create
              tree_hash = tree.return_tree

              tree_hash.to_json
            end
          end
        end
        routing.on 'publication' do
          routing.is do
            # POST /search/publication
            routing.post do
              params = JSON.parse(routing.body.read)
              result = PaperDeep::Service::SearchPublication.new.call(params)

              if result.failure?
                flash[:error] = result.failure
                return { result: false, error: flash[:error] }.to_json
              end

              if result.value![:publication].empty?
                return { result: false, error: 'Publication search result is nil' }.to_json
              end

              (result.value![:publication].map(&:content).to_json)
            end
          end
        end
        ######################################
        routing.on 'db' do
          routing.is do
            # GET /db/

            routing.get do
              paper = Repository::For.klass(Entity::Paper).all
              paper.map(&:content).to_json
            end
          rescue StandardError
            flash[:error] = 'Having trouble getting papers from database'
            return { result: false, error: flash[:error] }.to_json
          end
          routing.on 'eid' do
            routing.is do
              # POST /db/eid
              routing.post do
                session.clear
                session[:paper] ||= []
                params = JSON.parse(routing.body.read)

                paper = PaperDeep::Repository::For.klass(PaperDeep::Entity::Paper).find_eid(params['eid'])
                return { result: false, error: 'Having trouble getting publication from database' }.to_json if paper.nil?

                session[:paper].insert(0, paper.content)
                paper.content.to_json
              end
            end
          end
        end
      end
      #########################################
    end
  end
end
