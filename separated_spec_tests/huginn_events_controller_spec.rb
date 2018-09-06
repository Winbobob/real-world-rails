require 'rails_helper'

describe EventsController do
  before do
    expect(Event.where(:user_id => users(:bob).id).count).to be > 0
    expect(Event.where(:user_id => users(:jane).id).count).to be > 0
  end

  describe "GET index" do
    it "only returns Events created by Agents of the current user" 


    it "can filter by Agent" 

  end

  describe "GET show" do
    it "only shows Events for the current user" 

  end

  describe "POST reemit" do
    before do
      request.env["HTTP_REFERER"] = "/events"
      sign_in users(:bob)
    end

    it "clones and re-emits events" 


    it "can only re-emit Events for the current user" 

  end

  describe "DELETE destroy" do
    it "only deletes events for the current user" 

  end
end

