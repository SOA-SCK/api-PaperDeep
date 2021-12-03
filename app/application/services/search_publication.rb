# frozen_string_literal: true

require 'dry/transaction'

module PaperDeep
  module Service
    # Transaction to store project from Github API to database
    class SearchPublication
      include Dry::Transaction

      step :find_publication
      step :store_publication

      private

      def find_publication(input)
        input[:publication] = publication_from_scopus(input)
        Success(input)
      rescue StandardError => e
        Failure(Response::ApiResult.new(status: :not_found, message: e.to_s))
      end

      def store_publication(input)
        input[:storage] = input[:publication].map do |publication|
          Repository::For.entity(publication).db_find_or_create(publication)
        end
        Success(Response::ApiResult.new(status: :created, message: input))
      rescue StandardError => e
        puts e.backtrace.join("\n")
        Failure(Response::ApiResult.new(status: :internal_error,
                                        message: 'Having trouble accessing the database publication'))
      end

      # following are support methods that other services could use

      def publication_from_scopus(input)
        scopus = PaperDeep::PublicationMapper.new(App.config.api_key)
        puts
        scopus.search(input['pid'])
        scopus.parse
      rescue StandardError
        raise 'Having trouble searching publication'
      end
    end
  end
end
