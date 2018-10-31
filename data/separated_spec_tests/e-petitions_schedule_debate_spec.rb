require 'rails_helper'

RSpec.describe "routes for admin petition scheduled debate dates", type: :routes, admin: true do
  it "doesn't route GET /admin/petitions/1/schedule-debate/new" 


  it "doesn't route POST /admin/petitions/1/schedule-debate" 


  it "routes GET /admin/petitions/1/schedule-debate to admin/schedule_debate#show" 


  it "doesn't route GET /admin/petitions/1/schedule-debate/edit" 


  it "routes PATCH /admin/petitions/1/schedule-debate to admin/schedule_debate#update" 


  it "doesn't route DELETE /admin/petitions/1/schedule-debate" 

end

