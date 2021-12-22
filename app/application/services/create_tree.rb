# frozen_string_literal: true

# require_relative '../../init'
# require_relative '../../config/environment'
require 'json'
require 'concurrent'

# PaperDeep Module
module PaperDeep
  # Utilities Module to add feature
  module Service
    # create citation tree class
    class CreateCitationTree
      def initialize(gateway, root_paper)
        @root_paper = root_paper
        @gateway = gateway # PaperMapper instance
        @content = {}
      end

      def create
        @tree_content = {
          content: { NodeName: @root_paper[:title], link: @root_paper[:paper_link], eid: @root_paper[:eid] },
          next: []
        }
        # concurrent
        node_content(@tree_content)
        create_tree_concurrent(@tree_content, 1)
        # without concurrent
        # create_tree(@tree_content, 0)

        # store tree content to db
        puts 'start storing'
        store_tree
        nil
      end

      def store_tree
        # store tree content to db
        tree_entity = PaperDeep::Entity::Tree.new(eid:@root_paper[:eid],data: @tree_content.to_json)
        puts tree_entity
        Repository::For.entity(tree_entity).db_find_or_create(tree_entity)
      rescue StandardError => e
        puts "Error storing tree: #{e}"
      end

      def node_content(subtree)
        @gateway.search(subtree[:content][:eid])
        parsed = @gateway.parse.first(3)

        subtree[:next] = (0..2).map do |index|
          { content:
            { NodeName: parsed[index][:title], link: parsed[index][:paper_link], eid: parsed[index][:eid] },
            next: [] }
        end
      end

      def create_tree(subtree, height)
        return [] if height == 3

        node_content(subtree)

        next_step = height + 1
        subtree_struct = subtree[:next]

        create_tree(subtree_struct[0], next_step)
        create_tree(subtree_struct[1], next_step)
        create_tree(subtree_struct[2], next_step)
      end

      def create_tree_concurrent(subtree, height)
        return [] if height == 3

        subtree[:next].map do |node|
          Concurrent::Promise.execute { node_content(node) }
        end.map(&:value)
        # puts subtree
        next_step = height + 1
        subtree_struct = subtree[:next]
        (0..2).map do |num|
          create_tree_concurrent(subtree_struct[num], next_step)
        end
      end

      def return_tree
        @tree_content
      end
    end
  end
end
