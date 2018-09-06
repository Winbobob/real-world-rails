require 'rails_helper'

describe ServicesController do
  before do
    sign_in users(:bob)
  end

  describe "GET index" do
    it "only returns sevices of the current user" 

  end

  describe "POST toggle_availability" do
    it "should work for service of the user" 


    it "should not work for a service of another user" 

  end

  describe "DELETE destroy" do
    it "destroys only services owned by the current user" 

  end
end

