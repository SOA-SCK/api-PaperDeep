# frozen_string_literal: false

require 'dry-types'
require 'dry-struct'

module PaperDeep
  module Entity
    # Domain entity for team members
    class Tree < Dry::Struct
      include Dry.Types
      attribute :eid, Strict::String
      attribute :data, Strict::String

      def content
        {
          eid: eid,
          data: data
        }
      end
    end
  end
end
