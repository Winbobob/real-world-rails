require 'spec_helper'

describe Api::Admin::IndexEnterpriseSerializer do
  include AuthenticationWorkflow

  let(:enterprise) { create(:distributor_enterprise) }
  context "when spree_current_user is a manager" do
    let(:user) { create_enterprise_user }
    before do
      user.enterprise_roles.create(enterprise: enterprise)
    end

    it "sets 'owned' to false" 

  end

  context "when spree_current_user is " do
    let(:user) { enterprise.owner }

    it "sets 'owned' to true" 

  end

  context "when spree_current_user is the owner" do
    let(:user) { create(:admin_user) }

    it "sets 'owned' to true" 

  end
end

