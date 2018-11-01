require "rails_helper"

describe Jobs::PendingQueuedPostReminder do
  context "notify_about_queued_posts_after is 0" do
    before { SiteSetting.notify_about_queued_posts_after = 0 }

    it "never emails" 

  end

  context "notify_about_queued_posts_after is 24" do
    before do
      SiteSetting.notify_about_queued_posts_after = 24
    end

    it "doesn't create system message if there are no queued posts" 


    it "creates system message if there are new queued posts" 


    it "doesn't create system message again about the same posts" 

  end
end

