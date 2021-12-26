# frozen_string_literal: true

require_relative 'progress_publisher'

module TreeBuild
  # Reports job progress to client
  class JobReporter
    attr_accessor :request

    def initialize(request, config)
      @request = request
      @publisher = ProgressPublisher.new(config, request["request_id"])
    end

    def report(msg)
      @publisher.publish msg
    end

    def report_each_second(seconds, &operation)
      seconds.times do
        sleep(1)
        report(operation.call)
      end
    end
  end
end