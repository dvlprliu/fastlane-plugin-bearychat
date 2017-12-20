module Fastlane
  module Actions
    class BearychatAction < Action
      def self.run(params)
        webhook = params[:webhook_url] || ENV['BEARYCHAT_WEBHOOK_URL']
        # markdown = params[:markdown] || ENV['BEARYCHAT_MARKDOWN']
        text = params[:text]
        cmd = ['curl']
        cmd << "'#{webhook}'"
        cmd << '-X POST'
        cmd << "-H 'Content-Type: application/json'"
        # cmd << "-d 'payload={\"text\": \"#{text}\"}'"
        cmd << '-d \'{'
        cmd << "\"text\" : \"#{text}\", "
        cmd << '"markdown" : true'
        cmd << '}\''
        sh cmd.join(' ')
      end

      def self.description
        "send messages to a bearychat channal"
      end

      def self.authors
        ["dvlprliu"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "send messages to a bearychat channe"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :webhook_url,
            env_name: 'BEARYCHAT_WEBHOOK_URL',
            description: 'webhook url of your bearychat channel',
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :text,
            description: 'messages that sends to bearychat channel',
            optional: false,
            type: String
          )
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "BEARYCHAT_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
