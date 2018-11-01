require 'spec_helper'

describe HoursController do
  
  before do
    @user = Factory(:confirmed_user)
    @project = Factory(:project)
    @project.add_user @user
    
    Factory(:comment, :project => @project, :user => @user, :hours => 4.2)
    Factory(:comment, :project => @project, :user => @user, :hours => 1.2)
    Factory(:comment, :project => @project, :hours => 2.0)
    Factory(:comment, :project => @project, :hours => 2.0).update_attribute(:created_at, Time.now-2.months)
  end
  
  it "shows the hours for the current month in a project in CSV format" 

  
  it "shows the hours for a specific time period in a project in CSV format" 

end

