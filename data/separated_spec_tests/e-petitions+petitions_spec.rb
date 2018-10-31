require 'rails_helper'

RSpec.describe "routes for Archived Petitions", type: :routes do
  it "routes GET /archived/petitions to archived/petitions#index" 


  it "routes GET /archived/petitions/new to archived/petitions#show" 


  it "doesn't route POST /archived/petitions" 


  it "routes GET /archived/petitions/1 to archived/petitions#show" 


  it "doesn't route GET /archived/petitions/1/edit" 


  it "doesn't route PUT /archived/petitions/1" 


  it "doesn't route PATCH /archived/petitions/1" 


  it "doesn't route DELETE /archived/petitions/1" 


  describe "url helpers" do
    describe "#archived_petitions" do
      it "generates /archived/petitions" 

    end

    describe "#new_archived_petition" do
      it "raises a NameError" 

    end

    describe "#archived_petition" do
      it "generates /archived/petitions/1" 

    end

    describe "#edit_archived_petition" do
      it "raises a NameError" 

    end
  end
end

