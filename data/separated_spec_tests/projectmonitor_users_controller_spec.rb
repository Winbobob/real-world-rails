require 'spec_helper'

describe UsersController, :type => :controller do
  it "requires login" 


  describe "logged in as a user" do
    let(:user) { create(:user) }
    before { sign_in(user) }

    it "shows a login page" 


    it "creates a new user" 


    it "should handle a bad user" 

  end

  it "should generate params for users's new action from GET /users" 

end

