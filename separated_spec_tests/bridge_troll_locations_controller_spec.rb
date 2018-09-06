require 'rails_helper'

describe LocationsController do
  before do
    @location = create(:location)
  end

  describe "permissions" do
    context "a user that is not logged in" do
      it "can not edit or destroy a location" 

    end
  end

  context "a user that is logged in" do
    before do
      @user = create(:user)
      sign_in @user
    end

    context "when rendering views" do
      render_views

      it "can see all the locations" 

    end

    it "should be able to create a new location" 


    it "should be able to edit an location" 


    describe "updating a location" do
      let(:new_name) { 'Cowabunga' }
      let(:perform_update_request) do
        put :update, params: {id: @location.id, location: {name: new_name}}
      end

      it "is allowed when the location has no been used" 


      it "is disallowed otherwise" 

    end

    describe '#create (remote)' do
      let(:post_req) { post :create, params: { location: location_attrs }, format: 'js' }
      let(:location_attrs) { attributes_for(:location) }

      it "should return javascript" 


      it "respond successfully with an HTTP 200 status code" 

    end

    describe "#destroy" do
      it "can delete a location that belongs to no events" 


      it "cannot delete a location that belongs to an event" 

    end
  end
end

