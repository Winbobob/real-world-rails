require 'spec_helper'

describe "admin actions" do

  before :all do
    @admin = User.find_by(login: ADMIN)
    @owner = User.find_by(login: OWNER)
  end

  before :each do
      login_as(@admin, :scope => :user)
  end  

  it "looks at admin tabs" 


  it "changes email content" 


  it "makes a user an owner" 


  it "logs in as another user" 


  it "sorts owner list" 


end

