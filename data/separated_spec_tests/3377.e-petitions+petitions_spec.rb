require 'rails_helper'

RSpec.describe "routes for petitions", type: :routes do
  it "routes GET /petitions to petitions#index" 


  it "routes GET /petitions/new to petitions#new" 


  it "routes POST /petitions/new to petitions#create" 


  it "doesn't route POST /petitions" 


  it "routes GET /petitions/:id to petitions#show" 


  it "doesn't route GET /petitions/:id/edit" 


  it "doesn't route PATCH /petitions/:id" 


  it "doesn't route PUT /petitions/:id" 


  it "doesn't route DELETE /petitions/:id" 


  it "routes GET /petitions/check to petitions#check" 


  it "routes GET /petitions/check_results to petitions#check_results" 


  it "routes GET /petitions/:id/count to petitions#count" 


  it "routes GET /petitions/:id/thank-you to petitions#thank_you" 


  it "routes GET /petitions/:id/gathering-support to petitions#gathering_support" 


  it "routes GET /petitions/:id/moderation-info to petitions#moderation_info" 

end

