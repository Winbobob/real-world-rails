require "rails_helper"

RSpec.describe "OrganizationsUpdate", type: :request do
  let(:organization) { create(:organization) }
  let(:user) { create(:user, organization_id: organization.id) }
  let(:article) { create(:article, user_id: user.id) }
  let(:comment) { create(:comment, user_id: user.id, commentable_id: article.id) }

  before do
    user.org_admin = true
    sign_in user
  end

  it "updates ordinary article with proper params" 


  it "generates new secret" 

end

