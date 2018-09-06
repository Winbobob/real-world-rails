require 'spec_helper'

describe RegistrationController, type: :controller do
  include AuthenticationWorkflow
  describe "redirecting when user not logged in" do
    it "index" 

  end

  describe "redirecting when user has reached enterprise ownership limit" do
    let!(:user) { create_enterprise_user( enterprise_limit: 1 ) }
    let!(:enterprise) { create(:distributor_enterprise, owner: user) }

    before do
      controller.stub spree_current_user: user
    end

    it "index" 

  end

  describe "loading data when user is logged in" do
    let!(:user) { create_enterprise_user }

    before do
      controller.stub spree_current_user: user
    end

    describe "index" do
      it "loads the spree api key" 

    end
  end
end

