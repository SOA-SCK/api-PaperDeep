# frozen_string_literal: true

require_relative 'papers'
require_relative 'publications'
require_relative 'trees'

module PaperDeep
  module Repository
    # Finds the right repository for an entity object or class
    module For
      ENTITY_REPOSITORY = {
        Entity::Publication => Publications,
        Entity::Paper       => Papers,
        Entity::Tree        => Trees
      }.freeze

      def self.klass(entity_klass)
        ENTITY_REPOSITORY[entity_klass]
      end

      def self.entity(entity_object)
        ENTITY_REPOSITORY[entity_object.class]
      end
    end
  end
end
