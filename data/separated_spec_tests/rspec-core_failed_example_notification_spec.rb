module RSpec::Core::Notifications
  RSpec.describe FailedExampleNotification do
    before do
      allow(RSpec.configuration).to receive(:color_enabled?).and_return(true)
    end

    it "uses the default color for the shared example backtrace line" 

  end
end

