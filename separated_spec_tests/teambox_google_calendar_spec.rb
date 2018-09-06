require 'spec_helper'

describe GoogleCalendar do
  context "creating urls" do
    it "should generate a valid url when sent #create_url for list with no options" 

  end
  
  context "A Calendar" do
    it "should correctly parse the json of a calendar" 

    
    it "should output the calendar in the correct format when created as a calendar" 

    
    it "should successfully treat time_zone as timeZone in the hash" 

    
    it "should successfully round trip a calendar from and to json affecting additional parameters" 

  end
  
  context "An Event" do
    it "should correctly parse the json of an event" 

    
    it "should output the event details in the correct json when created as an event" 

    
    it "should successfully allow editing of the start and end date" 

    
    it "should successfully pass only dates and no times if we create an all day event" 

    
    it "should create a DateTime when passed a start or end date date with a time" 

    
    it "should create a Date when passed a start or end date date WITHOUT a time " 

    
    it "should successfully allow a roundtrip without affecting additional parameters" 

  end
  
  context "Posting Data" do
    it "should correctly format json post data from hashes" 

  end
end

