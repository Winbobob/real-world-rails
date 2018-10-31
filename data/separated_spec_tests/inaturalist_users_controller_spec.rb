require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController, "dashboard" do
  before(:each) { enable_elastic_indexing(Observation, UpdateAction) }
  after(:each) { disable_elastic_indexing(Observation, UpdateAction) }
  it "should be accessible when signed in" 

end

describe UsersController, "update" do
  let(:user) { User.make! }
  before { sign_in user }

  it "changes updated_at when changing preferred_project_addition_by" 

end

describe UsersController, "delete" do
  let(:user) { User.make! }

  it "destroys in a delayed job" 


  it "should be possible for the user" 

  
  it "should be impossible for everyone else" 

end

describe UsersController, "search" do
  it "should work while signed out" 


  it "should results as json sorted by login" 


  it "should return exact matches first" 

end

describe UsersController, "set_spammer" do
  describe "non-curators" do
    it "cannot access it" 

  end

  describe "curators" do
    before(:each) do
      @curator = make_curator
      http_login(@curator)
      request.env["HTTP_REFERER"] = "/"
    end

    it "can access it" 


    it "can set spammer to true" 


    it "removes spam flags when setting to non-spammer" 


    it "resolves spam flags when setting to non-spammer" 


    it "does not resolve spam flags when setting to spammer" 


    it "leaves resolver blank when resolving flags" 


    it "sets the user_id of the flag to the current_user" 


    it "resolves the spam flag on the user when setting to non-spammer" 

  end
end

describe UsersController, "spam" do
  let(:spammer) { User.make!(spammer: true) }

  it "should render 403 when the user is a spammer" 

end

describe UsersController, "update_session" do
  it "should set session attributes" 


  it "should save preferences for logged in users" 

end

describe UsersController, "merge" do
  let(:normal_user) { User.make! }
  let(:curator_user) { make_curator }
  let(:admin_user) { make_admin }
  let(:keeper_user) { User.make! }
  let(:reject_user) { User.make! }
  it "should not work for normal users" 

  it "should not work for curators" 

  it "should work for site admins" 

end

describe UsersController, "add_role" do
  it "should set curator_sponsor to current user" 

end

describe UsersController, "remove_role" do
  it "should nilify curator_sponsor" 

end

