# frozen_string_literal: true

module PaperDeep
  module Repository
    # Repository for Members
    class Trees
      def self.find_eid(eid)
        rebuild_entity Database::TreeOrm.first(eid: eid)
      end

      def self.all
        Database::TreeOrm.all.map { |db_project| rebuild_entity(db_project) }
      end

      def self.rebuild_entity(db_record)
        return nil unless db_record

        Entity::Tree.new(
          eid: db_record.eid,
          data: db_record.data
        )
      end

      def self.db_find_or_create(entity)
        Database::TreeOrm.find_or_create(entity.content)
      end
    end
  end
end
