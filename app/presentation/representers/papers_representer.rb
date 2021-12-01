# frozen_string_literal: true

require 'roar/decorator'
require 'roar/json'

require_relative 'paper_representer'

module PaperDeep
  module Representer
    # Represents list of projects for API output
    class PaperList < Roar::Decorator
      include Roar::JSON
      include Roar::Hypermedia
      include Roar::Decorator::HypermediaConsumer
      
      property :keyword
      collection :paper, extend: Representer::Paper, class: OpenStruct
    end
  end
end