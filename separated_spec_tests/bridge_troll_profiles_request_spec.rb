require 'rails_helper'

describe "Profile" do
  before do
    @user = create(:user)
    profile_attributes = {
      childcaring: true,
      writing: true,
      designing: true,
      outreach: true,
      mentoring: true,
      macosx: true,
      windows: true,
      linux: true,
      other: "This is a note in other",
      bio: "This is a Bio",
      github_username: "sally33"
    }
    @user.profile.update_attributes(profile_attributes)

    sign_in_as(@user)
  end

  it "when user visits the profile show page should see" 


  it "allows user to add skills" 


  context "when the user has attended some workshops" do
    before do
      event = create(:event, title: 'BridgeBridge')
      event.rsvps << create(:rsvp, user: @user, event: event)
    end

    it "is able to see workshop history" 

  end
end

