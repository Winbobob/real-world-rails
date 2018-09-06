require File.dirname(__FILE__) + '/../spec_helper'

describe TasksController do
  before do
    @user = Factory(:confirmed_user)
    @project = Factory(:project)
    @project.add_user @user
  end

  describe "#create" do
    it "should set the due date" 

  end
end

