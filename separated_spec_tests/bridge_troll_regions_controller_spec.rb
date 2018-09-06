require 'rails_helper'

describe RegionsController do
  before do
    @region = create(:region)
  end

  describe "permissions" do
    context "a user that is not logged in" do
      context "when rendering views" do
        render_views
        it "can see the index page" 


        it "can see the show page" 

      end

      it "should not be able to create a new region" 


      it "should not be able to edit a region" 


      it "should not be able to delete a region" 

    end

    context "a user that is logged in" do
      before do
        @user = create(:user)
        sign_in @user
        @user.regions << @region
      end

      it "can retrieve a JSON representation of a region" 


      context "when rendering views" do
        render_views

        it "can see all the regions" 

      end

      it "should be able to create a new region" 


      describe 'who is a region leader' do
        before do
          @region.leaders << @user
          @region.reload
        end

        it "should be able to edit an region" 

      end

      describe 'who is not a region leader' do
        it "should not be able to edit an region" 

      end

      describe "#destroy" do
        it "can delete a region that belongs to no locations" 


        it "cannot delete a region that belongs to a location" 

      end
    end

    context "a region lead" do
      before do
        @user = create(:user)
        @region.leaders << @user
        sign_in @user
      end

      describe "for a region with multiple events" do
        before do
          @location = create(:location, region: @region)

          @org1 = create(:user)
          @org2 = create(:user)

          @event1 = create(:event, location: @location)
          @event1.organizers << @org1
          @event1.organizers << @org2

          @event2 = create(:event, location: @location)
          @event2.organizers << @org1
        end

        it "can see a list of unique organizers" 

      end
    end
  end
end

