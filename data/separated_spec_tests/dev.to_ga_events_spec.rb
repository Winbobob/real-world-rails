require "rails_helper"

vcr_option = {
  cassette_name: "ga_event",
  allow_playback_repeats: "true",
}

RSpec.describe "GaEvents", type: :request, vcr: vcr_option do
  describe "POST /fallback_activity_recorder" do
    it "posts to fallback_activity_recorder" 

  end
end

