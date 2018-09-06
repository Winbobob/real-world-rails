require 'spec_helper'

feature 'Account Page' do
  include AuthenticationWorkflow

  describe "updating" do
    let!(:user) { create(:user) }
    let!(:enterprise) { create(:distributor_enterprise, owner: user) }

    before do
      quick_login_as user
    end

    context "as an enterprise user" do
      it "loads the page" 

    end
  end
end

