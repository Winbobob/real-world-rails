require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'user_export'

describe UserExport do

  before(:each) do
    @users = []
    5.times { |i| @users << FactoryGirl.create(:engaged_user, name: "User #{i}", email: "user#{i}@example.com") }

    @csv = "Name,Email\nUser 0,user0@example.com\nUser 1,user1@example.com\nUser 2,user2@example.com\nUser 3,user3@example.com\nUser 4,user4@example.com\n"
  end

  it "returns list of users" 


  it "returns a CSV of users" 


  it "writes to a Tempfile" 


  it "uploads a file" 


  it "Uploads and returns a URL" 


end

