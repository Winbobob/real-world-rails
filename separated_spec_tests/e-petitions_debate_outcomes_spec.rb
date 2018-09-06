require 'rails_helper'

RSpec.describe "routes for admin petition debate outcomes", type: :routes, admin: true do
  it "doesn't route GET /admin/petitions/1/debate-outcome/new" 


  it "doesn't route POST /admin/petitions/1/debate-outcome" 


  it "routes GET /admin/petitions/1/debate-outcome to admin/debate_outcomes#show" 


  it "doesn't route GET /admin/petitions/1/debate-outcome/edit" 


  it "routes PATCH /admin/petitions/1/debate-outcome to admin/debate_outcomes#update" 


  it "doesn't route DELETE /admin/petitions/1/debate-outcome" 

end

