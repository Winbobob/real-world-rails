require 'rails_helper'

describe Jobs::PendingFlagsReminder do
  context "notify_about_flags_after is 0" do
    before { SiteSetting.notify_about_flags_after = 0 }

    it "never notifies" 

  end

  context "notify_about_flags_after is 48" do
    before do
      SiteSetting.notify_about_flags_after = 48
      $redis.del described_class.last_notified_key
    end

    after do
      $redis.del described_class.last_notified_key
    end

    it "doesn't send message when flags are less than 48 hours old" 


    it "sends message when there is a flag older than 48 hours" 


    it "doesn't send a message if there are no new flags older than 48 hours old" 

  end
end

