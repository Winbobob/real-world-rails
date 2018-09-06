require "rails_helper"

describe PromptMailer do
  describe "#prompt" do
    it "has the correct headers" 


    context "when the user has set their timezone" do
      it "shows today's date in their timezone" 

    end

    context "when the user has a previous entry" do
      it "includes a past entry" 


      it "says how long ago the past entry was in the user's time zone" 


      it "describes when the user created their entry" 


      it "formats the previous entry with html" 


      context "and it has a photo" do
        it "includes it" 

      end
    end
  end

  context "when the user has no previous entries" do
    it "does not try to display the entry" 

  end

  context "when there is an announcement" do
    it "shows the announcement in the prompt" 

  end

  context "when a date is provided" do
    it "sends a prompt for the provided date" 

  end

  def with_announcement(announcement)
    ENV["ANNOUNCEMENT"] = announcement
    yield
    ENV["ANNOUNCEMENT"] = nil
  end
end

