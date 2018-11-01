require 'spec_helper'

RSpec.describe Admin::OrganizationsController, type: :controller do
  let(:organization) { Fabricate(:organization) }
  let(:member) { Fabricate(:member, organization: organization) }
  let(:user) { member.user }

  before do
    login(user)
    allow(controller).to receive(:authenticate_superuser!).and_return(true)
  end

  describe "DELETE #destroy" do
    it "sign out if current user is logged to organization deleted" 

  end
end

