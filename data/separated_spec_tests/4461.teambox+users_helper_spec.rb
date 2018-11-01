require 'spec_helper'

describe UsersHelper do
  before do
    @user = Factory(:confirmed_user)
    @project = Factory(:project, :user => @user)
    login_as @user
  end

  describe "json_projects" do
    before do
      @projects = JSON.parse(json_projects)
    end
    it "should return an hash of projects with the user's role" 

  end

  describe "json_organizations" do
    it "shouldn't include deleted organizations" 

  end

  describe "json_external_organizations" do
    it "shouldn't include deleted organizations" 

  end
end


