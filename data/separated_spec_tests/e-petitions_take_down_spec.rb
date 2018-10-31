require 'rails_helper'

RSpec.describe "routes for admin petition take downs", type: :routes, admin: true do
  it "doesn't route GET /admin/petitions/1/take_down/new" 


  it "doesn't route POST /admin/petitions/1/take_down" 


  it "routes GET /admin/petitions/1/take-down to admin/take_down#show" 


  it "doesn't route GET /admin/petitions/1/take-down/edit" 


  it "routes PATCH /admin/petitions/1/take-down to admin/take_down#update" 


  it "doesn't route DELETE /admin/petitions/1/take-down" 

end

