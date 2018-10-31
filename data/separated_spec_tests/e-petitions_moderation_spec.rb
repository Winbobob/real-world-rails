require 'rails_helper'

RSpec.describe "routes for admin petition moderation", type: :routes, admin: true do
  it "doesn't route GET /admin/petitions/1/moderation/new" 


  it "doesn't route POST /admin/petitions/1/moderation" 


  it "doesn't route GET /admin/petitions/1/moderation" 


  it "doesn't route GET /admin/petitions/1/moderation/edit" 


  it "routes PATCH /admin/petitions/1/moderation to admin/moderation#update" 


  it "doesn't route DELETE /admin/petitions/1/moderation" 

end

