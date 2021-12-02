# frozen_string_literal: true

require 'dry/transaction'

module PaperDeep
  module Service
    # Transaction to store project from Github API to database
    class AddPaper
      include Dry::Transaction

      step :find_paper
      step :store_paper

      private

      # Expects input["keyword"] or input["eid"]
      def find_paper(input)
        input[:paper] = paper_from_scopus(input)
        Success(input)
      rescue StandardError => e
        Failure(Response::ApiResult.new(status: :not_found, message: e.to_s))
      end

      def store_paper(input)
        input[:storage] = input[:paper].map do |paper|
          Repository::For.entity(paper).db_find_or_create(paper)
        end
        Success(Response::ApiResult.new(status: :created, message: input))
      rescue StandardError => e
        puts e.backtrace.join("\n")
        Failure(Response::ApiResult.new(status: :internal_error, message: 'Having trouble accessing the database'))
      end

      # following are support methods that other services could use

      def paper_from_scopus(input)
        scopus = PaperDeep::PaperMapper.new(App.config.api_key)
        scopus.search(input["keyword"])[0] if input["eid"].nil?
        scopus.search(input["eid"])[0] if input["keyword"].nil?
        scopus.parse
      rescue StandardError
        raise 'Having trouble searching papers'
      end
    end
  end
end
