module Fastlane
  module Helper
    class BearychatHelper
      # class methods that you define here become available in your action
      # as `Helper::BearychatHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the bearychat plugin helper!")
      end
    end
  end
end
