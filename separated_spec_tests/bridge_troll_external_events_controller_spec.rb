require 'rails_helper'

describe ExternalEventsController do
  before do
    sign_in create(:user, admin: true)
  end

  describe "GET index" do
    it "succeeds" 

  end

  describe "GET new" do
    it "succeeds" 

  end

  describe "GET edit" do
    it "succeeds" 

  end

  describe "POST create" do
    let(:valid_attributes) do
      {
        name: "MyString",
        location: "MyHouse",
        city: "MyCity",
        starts_at: 2.days.from_now
      }
    end

    describe "with valid params" do
      it "creates a new ExternalEvent and redirects to the index" 

    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested external_event and redirects to the index" 

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested external_event and redirects to the index" 

  end
end

