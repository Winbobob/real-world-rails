require "rails_helper"

RSpec.describe "internal/users", type: :request do
  let(:mentor) { create(:user) }
  let(:mentee) { create(:user) }
  let(:admin)  { create(:user, :super_admin) }

  before do
    sign_in(admin)
    mentor
    mentee
  end

  describe "GETS /internal/users" do
    it "renders to appropriate page" 


    it "only displays mentors on ?state=mentors" 


    it "only displays mentees on ?state=mentees" 

  end

  describe "GET /internal/users/:id" do
    it "renders to appropriate page" 

  end

  describe "PUT internal/users/:id" do
    it "updates user to offer mentorship" 


    it "updates user to seek mentorship" 


    it "bans user from mentorship" 


    it "pairs mentor with a mentee" 


    it "pairs mentee with a mentor" 


    it "deactivates existing mentorships when user is banned" 


    it "creates mentorship note" 

  end

  describe "GET internal/users/:id/edit" do
    it "redirects from /username/moderate" 


    it "shows banish button for new users" 


    it "does not show banish button for non-admins" 

  end

  describe "PUT internal/users/:id/edit" do
    it "bans user for spam" 

  end
end

