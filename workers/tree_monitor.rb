# frozen_string_literal: true

module TreeBuild
  # Infrastructure to clone while yielding progress
  module BuildMonitor
    BUILD_PROGRESS = {
      'STARTED'                   => 15,
      'Searching'                 => 30,
      'Searching_children'        => 40,
      'Searching_children_layer1' => 50,
      'Searching_children_layer2' => 60,
      'Building'                  => 80,
      'Storing'                   => 90,
      'Checking'                  => 95,
      'FINISHED'                  => 100
    }.freeze

    def self.starting_percent
      BUILD_PROGRESS['STARTED'].to_s
    end

    def self.finished_percent
      BUILD_PROGRESS['FINISHED'].to_s
    end

    def self.searching_percent
      BUILD_PROGRESS['Searching'].to_s
    end

    def self.searching_children
      BUILD_PROGRESS['Searching_children'].to_s
    end

    def self.searching_children_layer(height)
      BUILD_PROGRESS["Searching_children_layer#{height}"].to_s
    end

    def self.building_percent
      BUILD_PROGRESS['Building'].to_s
    end

    def self.storing_percent
      BUILD_PROGRESS['Storing'].to_s
    end

    def self.checking_percent
      BUILD_PROGRESS['Checking'].to_s
    end
  end
end
