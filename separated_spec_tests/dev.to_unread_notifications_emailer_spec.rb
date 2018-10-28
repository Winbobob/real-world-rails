require "rails_helper"

RSpec.describe UnreadNotificationsEmailer, vcr: {} do
  let(:user) { create(:user) }

  it "returns boolean on whether or not to send an email based on user activity" 

end

