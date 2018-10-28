require "rails_helper"

RSpec.describe "UserOrganization", type: :request do
  let(:user)          { create(:user) }
  let(:organization)  { create(:organization, secret: "SECRET", approved: true) }

  def add_org_admin
    user.update(organization_id: organization.id, org_admin: true)
    user2 = create(:user, organization_id: organization.id)
    post "/users/add_org_admin", params: { user_id: user2.id }
  end

  before do
    sign_in user
  end

  it "joins org with proper secret" 


  it "returns 404 if secret is wrong" 


  it "leaves org" 


  it "adds org admin" 


  it "adds analytics role when adding org admin if org is approved" 


  it "raises if user not org_admin" 


  it "removes org admin" 


  it "remove_org_admin raises if user not org_admin" 

end

