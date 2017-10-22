describe Fastlane::Actions::BearychatAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The bearychat plugin is working!")

      Fastlane::Actions::BearychatAction.run(nil)
    end
  end
end
