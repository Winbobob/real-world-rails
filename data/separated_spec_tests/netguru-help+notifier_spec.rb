require 'rails_helper'

describe Notifier do
  describe '#commence!' do
    let(:support) { Support.create }
    let(:notification) { AskForSupportNotification.new(support) }
    subject { described_class.new(notification) }

    it "calls notify_slack method if it's in enabled_notifications" 

  end
end

