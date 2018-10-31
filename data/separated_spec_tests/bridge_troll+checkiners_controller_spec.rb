require 'rails_helper'

describe CheckinersController do
  before do
    @event = create(:event)
    @user = create(:user)
  end

  context "a user that is logged in and is an organizer for a published event" do
    before do
      @event.organizers << @user

      sign_in @user
    end

    it "can see list of checkiners" 


    describe "assigning checkiners" do
      it "can promote a user to checkiner" 


      it "shows an error if no user is provided" 

    end
  end
end

