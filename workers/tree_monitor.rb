# frozen_string_literal: true

module TreeBuild
    # Infrastructure to clone while yielding progress
    module BuildMonitor
      BUILD_PROGRESS = {
        'STARTED'   => 15,
        'Searching'   => 30,
        'Searching children'    => 70,
        'Building' => 85,
        'Storing' => 95,
        'Checking'  => 100,
        'FINISHED'  => 100
      }.freeze
  
      def self.starting_percent
        BUILD_PROGRESS['STARTED'].to_s
      end
  
      def self.finished_percent
        BUILD_PROGRESS['FINISHED'].to_s
      end
  
      def self.searching_percent()
        BUILD_PROGRESS['Searching'].to_s
      end

      def self.building_percent()
        BUILD_PROGRESS['Building'].to_s
      end
    end
  end