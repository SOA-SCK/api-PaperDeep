# frozen_string_literal: true

require 'http'
require 'faye'
require 'eventmachine'

module TreeBuild
  # Publishes progress as percent to Faye endpoint
  class ProgressPublisher
    def initialize(config, channel_id)
      @config = config
      @channel_id = channel_id
    end

    def publish(message)
      print "Progress: #{message} "
      print "[post: #{@config.API_HOST}/faye] "
      HTTP.headers(content_type: 'application/json')
        .post(
          "#{@config.API_HOST}/faye",
          body: message_body(message)
        )
        .then { |result| puts "(#{result.status})" }
      # EM.run {
      #   client = Faye::Client.new("#{@config.API_HOST}/faye")
      #   client.publish("/"+@channel_id.to_s, 'text' => message_body(message))
      # }
      puts message_body(message)
    rescue Exception => e
      puts e.to_s
      puts '(Faye server not found - progress not sent)'
    end

    private

    def message_body(message)
      { data: message, channel: "/#{@channel_id}" }.to_json
    end
  end
end
