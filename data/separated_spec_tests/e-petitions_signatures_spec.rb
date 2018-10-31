require 'rails_helper'

RSpec.describe "routes for signatures", type: :routes do
  # Routes nested to /petition/:petition_id
  it "doesn't route GET /petitions/1/signatures" 


  it "routes GET /petitions/1/signatures/new to signatures#new" 


  it "routes POST /petitions/1/signatures/new to signatures#confirm" 


  it "routes POST /petitions/1/signatures to signatures#create" 


  it "routes GET /petitions/1/signatures/thank-you to signatures#thank_you" 


  it "doesn't route GET /petitions/1/signatures/2" 


  it "doesn't route GET /petitions/1/signatures/2/edit" 


  it "doesn't route PATCH /petitions/1/signatures/2" 


  it "doesn't route PUT /petitions/1/signatures/2" 


  it "doesn't route DELETE /petitions/1/signatures/2" 


  # un-nested routes
  it "routes GET /signatures/:id/verify to signatures#verify" 


  it "routes GET /signatures/:id/unsubscribe to signatures#unsubscribe" 


  it "routes GET /signatures/:id/signed to signatures#signed" 


  it "doesn't route GET /signatures" 


  it "doesn't route GET /signatures/new" 


  it "doesn't route POST /signatures" 


  it "doesn't route GET /signatures/1" 


  it "doesn't route GET /signatures/1/edit" 


  it "doesn't route PATCH /signatures/1" 


  it "doesn't route DELETE /signatures/1" 

end

