require 'rails_helper'

RSpec.describe "routes for sponsor", type: :routes do
  # Routes nested to /petition/:petition_id
  it "doesn't route GET /petitions/1/sponsors" 


  it "routes GET /petitions/1/sponsors/new to sponsors#new" 


  it "routes POST /petitions/1/sponsors/new to sponsors#confirm" 


  it "routes POST /petitions/1/sponsors to sponsors#create" 


  it "routes GET /petitions/1/sponsors/thank-you to sponsors#thank_you" 


  it "doesn't route GET /petitions/1/sponsors/2" 


  it "doesn't route GET /petitions/1/sponsors/2/edit" 


  it "doesn't route PATCH /petitions/1/sponsors/2" 


  it "doesn't route PUT /petitions/1/sponsors/2" 


  it "doesn't route DELETE /petitions/1/sponsors/2" 


  # un-nested routes
  it "routes GET /sponsors/:id/verify to sponsors#verify" 


  it "doesn't route GET /sponsors/:id/unsubscribe" 


  it "routes GET /sponsors/:id/sponsored to sponsors#signed" 


  it "doesn't route GET /sponsors" 


  it "doesn't route GET /sponsors/new" 


  it "doesn't route POST /sponsors" 


  it "doesn't route GET /sponsors/1" 


  it "doesn't route GET /sponsors/1/edit" 


  it "doesn't route PATCH /sponsors/1" 


  it "doesn't route DELETE /sponsors/1" 

end

