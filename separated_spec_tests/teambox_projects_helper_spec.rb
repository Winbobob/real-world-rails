require 'spec_helper'

describe ProjectsHelper do
  before do
    @user = Factory(:confirmed_user, :login => 'jordi', :first_name => 'Jordi', :last_name => 'Romero')
    @project = Factory(:project, :user => @user)
    login_as @user
  end

  describe "projects_people_data_json" do
    it "should render a hash of people in json" 

  end
end


