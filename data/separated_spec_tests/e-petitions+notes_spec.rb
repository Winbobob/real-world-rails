require 'rails_helper'

RSpec.describe "routes for admin petition notes", type: :routes, admin: true do
  it "doesn't route GET /admin/petitions/1/notes/new" 


  it "doesn't route POST /admin/petitions/1/notes" 


  it "routes GET /admin/petitions/1/notes to admin/notes#show" 


  it "doesn't route GET /admin/petitions/1/notes/edit" 


  it "routes PATCH /admin/petitions/1/notes to admin/notes#update" 


  it "doesn't route DELETE /admin/petitions/1/notes" 

end

