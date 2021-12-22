# frozen_string_literal: true

require 'sequel'

module PaperDeep
  module Database
    # Object-Relational Mapper for Members
    class TreeOrm < Sequel::Model(:trees)
      plugin :timestamps, update_on_create: true

      def self.find_or_create(tree)
        first(eid: tree[:eid]) || create(tree)
      end
    end
  end
end
