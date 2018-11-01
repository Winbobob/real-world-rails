require 'spec_helper'
require './spec/controllers/squash_many_duplicates_examples'

module Calagator

describe EventsController, :type => :controller do
  routes { Calagator::Engine.routes }

  describe "#index" do
    render_views

    describe "as HTML" do
      it "should produce HTML" 

    end

    describe "as XML" do
      describe "without events" do
        before do
          get :index, :format => "xml"

          @struct = Hash.from_xml(response.body)["events"]
        end

        it "should not have entries" 

      end

      describe "with events" do
        before do
          FactoryGirl.create(:event, :with_venue)
          FactoryGirl.create(:event, :with_venue)

          get :index, :format => "xml"

          @struct = Hash.from_xml(response.body)["events"]
        end

        it "should return an array" 


        it "should have entries" 


        it "should include venue details" 

      end
    end

    describe "as JSON" do
      describe "without events" do
        before do
          get :index, :format => "json"

          @struct = ActiveSupport::JSON.decode(response.body)
        end

        it "should return an array" 


        it "should not have entries" 

      end

      describe "with events" do
        before do
          @event = FactoryGirl.create(:event, :with_venue)
          @venue = @event.venue

          get :index, :format => "json"

          @struct = ActiveSupport::JSON.decode(response.body)
        end

        it "should return an array" 


        it "should return an event" 


        it "should return an event's venue" 

      end
    end

    describe "as ATOM" do
      describe "without events" do
        before do
          get :index, :format => "atom"
          @struct = Hash.from_xml(response.body)
        end

        it "should be a feed" 


        it "should not have events" 

      end

      describe "with events" do
        before do
          FactoryGirl.create(:event, :with_venue)
          FactoryGirl.create(:event, :with_venue)

          get :index, :format => "atom"

          @struct = Hash.from_xml(response.body)
        end

        let(:entries) { @struct["feed"]["entry"] }

        it "should be a feed" 


        it "should have entries" 


        it "should have an event" 

      end
    end

    describe "as iCalendar" do
      describe "without events" do
        before do
          get :index, :format => "ics"
        end

        it "should have a calendar" 


        it "should not have events" 

      end

      describe "with events" do
        before do
          @current_event = FactoryGirl.create(:event, :start_time => today + 1.hour)
          @past_event = FactoryGirl.create(:event, :start_time => today - 1.hour)

          get :index, :format => "ics"
        end

        it "should have a calendar" 


        it "should have events" 


        it "should render all future events" 


        it "should not render past events" 

      end
    end

    describe "and filtering by date range" do
      let!(:within) { [
        Event.create!(
          title: "matching1",
          start_time: Time.zone.parse("2010-01-16 00:00"),
          end_time: Time.zone.parse("2010-01-16 01:00")
        ),
      ] }

      let!(:before) { [
        Event.create!(
          title: "nonmatchingbefore",
          start_time: Time.zone.parse("2010-01-15 23:00"),
          end_time: Time.zone.parse("2010-01-15 23:59")
        ),
      ] }

      let!(:after) { [
        Event.create!(
          title: "nonmatchingafter",
          start_time: Time.zone.parse("2010-01-17 00:01"),
          end_time: Time.zone.parse("2010-01-17 01:00")
        ),
      ] }

      it "should return matching events" 

    end

    describe "and filtering by time range" do
      around do |example|
        Timecop.freeze("2010-01-01") do
          example.run
        end
      end

      let!(:within) { [
        Event.create!(
          title: "within",
          start_time: Time.zone.parse("2010-01-16 10:00"),
          end_time: Time.zone.parse("2010-01-16 11:00"),
        ),
      ] }

      let!(:before) { [
        Event.create!(
          title: "before",
          start_time: Time.zone.parse("2010-01-16 05:00"),
          end_time: Time.zone.parse("2010-01-16 06:00"),
        ),
      ] }

      let!(:after) { [
        Event.create!(
          title: "after",
          start_time: Time.zone.parse("2010-01-16 15:00"),
          end_time: Time.zone.parse("2010-01-16 16:00"),
        ),
      ] }

      it "should return matching events before an end time" 


      it "should return matching events within a time range" 


      it "should return matching events after a start time" 

    end
  end

  describe "#show" do
    it "should show an event" 


    it "should redirect from a duplicate event to its master" 


    it "should show an error when asked to display a non-existent event" 

  end

  describe "when creating and updating events" do
    before do
      @params = {
        "end_date"       => "2008-06-04",
        "start_date"     => "2008-06-03",
        "event" => {
          "title"       => "MyVenue",
          "url"         => "http://my.venue",
          "description" => "Wheeeee"
        },
        "end_time"       => "",
        "start_time"     => ""
      }.with_indifferent_access
      @venue = FactoryGirl.build(:venue)
      @event = FactoryGirl.build(:event, :venue => @venue)
    end

    describe "#new" do
      it "should display form for creating new event" 

    end

    describe "#create" do
      render_views

      it "should create a new event without a venue" 


      it "should associate a venue based on a given venue id" 


      it "should associate a venue based on a given venue name" 


      it "should associate a venue by id when both an id and a name are provided" 


      it "should create a new event and new venue, and redirect to venue edit form" 


      it "should catch errors and redisplay the new event form" 


      it "should stop evil robots" 


      it "should not allow too many links in the description" 


      it "should accept HTTP-rich presentation descriptions without too many links" 


      it "should allow the user to preview the event" 


      it "should create an event for an existing venue" 

    end

    describe "#update" do
      before(:each) do
        @event = FactoryGirl.create(:event, :with_venue, id: 42)
        @venue = @event.venue
        @params.merge!(id: 42)
      end

      it "should display form for editing event" 


      it "should update an event without a venue" 


      it "should associate a venue based on a given venue id" 


      it "should associate a venue based on a given venue name" 


      it "should associate a venue by id when both an id and a name are provided" 


      it "should update an event and create a new venue, and redirect to the venue edit form" 


      it "should catch errors and redisplay the new event form" 


      it "should stop evil robots" 


      it "should not allow too many links in the description" 


      it "should allow the user to preview the event" 


      it "should not allow a user to update a locked event" 

    end

    describe "#clone" do
      before do
        @event = FactoryGirl.create(:event)

        allow(Event).to receive(:find).and_return(@event)

        get "clone", :id => 1
      end

      it "should build an unsaved record" 


      it "should build a cloned record similar to the existing record" 


      it "should display a new event form" 


      it "should have notice with cloning instructions" 

    end
  end

  context "with admin auth for duplicates" do
    before do
      credentials = ActionController::HttpAuthentication::Basic.encode_credentials Calagator.admin_username, Calagator.admin_password
      request.env['HTTP_AUTHORIZATION'] = credentials
    end

    describe "#duplicates" do
      render_views

      it "should find current duplicates and not past duplicates" 


      it "should redirect duplicate events to their master" 


      it "should display an error message if given invalid arguments" 

    end

    context do
      include_examples "#squash_many_duplicates", :event
    end
  end

  describe "#search" do
    describe "when returning results" do
      render_views

      let!(:current_event) { FactoryGirl.create(:event, :with_venue, title: "MyQuery") }
      let!(:current_event_2) { FactoryGirl.create(:event, :with_venue, description: "WOW myquery!") }
      let!(:past_event) { FactoryGirl.create(:event, :with_venue, title: "old myquery") }

      describe "in HTML format" do
        before do
          get :search, :query => "myquery", :format => "html"
        end

        it "should assign search result" 


        it "should assign matching events" 


        it "should render matching events" 


        describe "sidebar" do
          it "should have iCalendar feed" 


          it "should have Atom feed" 


          it "should have Google subscription" 

        end
      end

      describe "in XML format" do
        it "should produce XML" 


        it "should include venue details" 

      end

      describe "in JSON format" do
        it "should produce JSON" 


        it "should include venue details" 

      end

      describe "in ATOM format" do
        it "should produce ATOM" 

      end

      describe "in ICS format" do
        it "should produce ICS" 


        it "should produce events matching the query" 

      end

      describe "failures" do
        it "sets search failures in the flash message" 


        it "redirects to home if hard failure" 

      end
    end
  end

  describe "#destroy" do
    it "should destroy events" 


    it "should not allow a user to destroy a locked event" 


  end
end

end

