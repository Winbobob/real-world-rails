require 'rails_helper'

RSpec.describe "routes for admin petitions", type: :routes, admin: true do
  it "routes GET /admin/petitions/ to admin/petitions#index" 


  it "doesn't route GET /admin/petitions/1/new" 


  it "doesn't route POST /admin/petitions/1" 


  it "routes GET /admin/petitions/1 to admin/petitions#show" 


  it "doesn't route GET /admin/petitions/1/edit" 


  it "doesn't route PATCH /admin/petitions/1" 


  it "doesn't route DELETE /admin/petitions/1" 

end

