require 'spec_helper'
require './spec/controllers/squash_many_duplicates_examples'

module Calagator

describe VenuesController, :type => :controller do
  routes { Calagator::Engine.routes }

  render_views

  context "concerning duplicates" do
    let!(:venue_master) { FactoryGirl.create(:venue) }
    let!(:venue_duplicate) { FactoryGirl.create(:venue, duplicate_of: venue_master) }

    it "redirects duplicate venues to their master" 


    it "doesn't redirect non-duplicates" 

  end

  context "with admin auth for duplicates" do
    before do
      credentials = ActionController::HttpAuthentication::Basic.encode_credentials Calagator.admin_username, Calagator.admin_password
      request.env['HTTP_AUTHORIZATION'] = credentials
    end

    it "should display an error message if given invalid arguments" 


    context do
      include_examples "#squash_many_duplicates", :venue
    end
  end

  describe "when creating venues" do
    it "should redirect to the newly created venue" 


    it "should stop evil robots" 

  end

  describe "when updating venues" do
    before do
      @venue = FactoryGirl.create(:venue)
    end

    it "should redirect to the updated venue" 


    it "should redirect to any associated event" 


    it "should stop evil robots" 

  end

  describe "when rendering the new venue page" do
    it "passes the template a new venue" 

  end

  describe "when rendering the edit venue page" do
    it "passes the template the specified venue" 

  end

  describe "when rendering the map page" do
    before do
      @open_venue = FactoryGirl.create(:venue)
      @closed_venue = FactoryGirl.create(:venue, closed: true)
      @duplicate_venue = FactoryGirl.create(:venue, duplicate_of: @open_venue)
    end

    it "only shows open non-duplicate venues" 

  end

  describe "when rendering the venues index" do
    before do
      @venues = [FactoryGirl.create(:venue), FactoryGirl.create(:venue)]
    end

    it "should assign the search object to @search" 


    it "should assign search results to @venues" 


    describe "in JSON format" do
      it "should produce JSON" 

    end

  end

  describe "when showing venues" do
    it "redirects to all venues if venue doesn't exist" 


    describe "in JSON format" do
      describe "with events" do
        before do
          @venue = FactoryGirl.build(:venue, :id => 123)
          allow(Venue).to receive(:find).and_return(@venue)
        end

        it "should produce JSON" 

      end
    end

    describe "in HTML format" do
      describe "venue with future and past events" do
        before do
          @venue = FactoryGirl.create(:venue)
          @future_event = FactoryGirl.create(:event, :venue => @venue)
          @past_event = FactoryGirl.create(:event, :venue => @venue,
            :start_time => Time.now - 1.week + 1.hour,
            :end_time => Time.now - 1.week + 2.hours)

          get :show, :id => @venue.to_param, :format => "html"
          expect(response).to be_success
        end

        it "should have a venue" 


        it "should have a future event" 


        it "should have a past event" 

      end
    end

    describe "as an iCalendar" do
      before do
        @venue = FactoryGirl.create(:venue)
        @future_event = FactoryGirl.create(:event, :venue => @venue, :start_time => today + 1.hour)
        @past_event = FactoryGirl.create(:event, :venue => @venue, :start_time => today - 1.hour)

        get :show, :id => @venue.to_param, :format => "ics"
      end

      it "should have a calendar" 


      it "should have events" 


      it "should render all future events" 


      it "should render all past events" 

    end

  end

  describe "DELETE" do
    describe "when deleting a venue without events" do
      before do
        @venue = FactoryGirl.create(:venue)
      end

      shared_examples_for "destroying a Venue record without events" do
        it "should destroy the Venue record" 

      end

      describe "and rendering HTML" do
        before do
          delete :destroy, :id => @venue.id
        end

        it_should_behave_like "destroying a Venue record without events"

        it "should display a success message" 


        it "should redirect to the venues listing" 

      end

      describe "and rendering XML" do
        render_views

        before do
          delete :destroy, :id => @venue.id, :format => "xml"
        end

        it_should_behave_like "destroying a Venue record without events"

        it "should return a success status" 

      end
    end

    describe "when deleting a venue with events" do
      before do
        @event = FactoryGirl.create(:event, :with_venue)
        @venue = @event.venue
      end

      shared_examples_for "destroying a Venue record with events" do
        it "should not destroy the Venue record" 

      end

      describe "and rendering HTML" do
        before do
          delete :destroy, :id => @venue.id
        end

        it_should_behave_like "destroying a Venue record with events"

        it "should display a failure message" 


        it "should redirect to the venue page" 

      end

      describe "and rendering XML" do
        before do
          delete :destroy, :id => @venue.id, :format => "xml"
        end

        it_should_behave_like "destroying a Venue record with events"

        it "should return unprocessable entity status" 


        it "should describing the problem" 

      end
    end
  end
end

end

