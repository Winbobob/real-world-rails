require 'rails_helper'
RSpec.describe EmailPreferencesController, type: :controller do
  render_views

  let(:participant) { create :participant }
  let(:email_preference) { participant.email_preferences.first }

=begin
  describe "GET #edit" do
    it "assigns the requested email_preference as @email_preference" 

  end

  describe "PUT #update" do
    let(:new_attributes) {
      { my_leaderboard: true, any_leaderboard: false }
    }

    it "updates the requested email_preference" 


    it "assigns the requested email_preference as @email_preference" 


    it "redirects to the email_preferences_controller" 

  end
=end
end

