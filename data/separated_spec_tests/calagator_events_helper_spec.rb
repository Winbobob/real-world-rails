require 'spec_helper'

module Calagator

describe EventsHelper, :type => :helper do
  describe "#events_sort_link" do
    it "renders a sorting link with the field for the supplied key" 


    it "removes any existing order if no key is entered" 

  end

  describe "#events_sort_label" do
    it "should return nil without arguments" 


    it "should return string for a string key" 


    it "should return string for a symbol key" 


    it "should use the label Date when using a tag" 

  end

  describe "#today_tomorrow_or_weekday" do
    it "should display day of the week" 


    it "should display tomorrow as 'Tomorrow'" 

  end

  describe "#google_events_subscription_link" do
    def method(*args)
      helper.google_events_subscription_link(*args)
    end

    it "should fail if given unknown options" 


    it "should generate a default link" 


    it "should generate a search link" 


    it "should generate a tag link" 

  end

  describe "#icalendar_feed_link" do
    def method(*args)
      helper.icalendar_feed_link(*args)
    end

    it "should fail if given unknown options" 


    it "should generate a default link" 


    it "should generate a search link" 


    it "should generate a tag link" 

  end

  describe "#icalendar_export_link" do
    def method(*args)
      helper.icalendar_export_link(*args)
    end

    it "should fail if given unknown options" 


    it "should generate a default link" 


    it "should generate a search link" 


    it "should generate a tag link" 

  end

  describe "#atom_feed_link" do
    def method(*args)
      helper.atom_feed_link(*args)
    end

    it "should fail if given unknown options" 


    it "should generate a default link" 


    it "should generate a search link" 


    it "should generate a tag link" 

  end

  describe "#tweet_text" do
    it "contructs a tweet" 


    it "crops it at 140 characters" 

  end

  describe "sorting labels" do
    it "should display human-friendly label for a known value" 


    it "should display a default label" 


    it "should display a different default label when searching by tag" 

  end
end

end

