# frozen_string_literal: true

require 'spec_helper'

describe "spree/admin/shared/_navigation_footer", type: :view do
  let(:user) { FactoryBot.build_stubbed(:admin_user) }
  before do
    allow(view).to receive(:try_spree_current_user).and_return(user)
  end

  it "has a a login-nav section" 


  it "has a user-account-link" 


  context "with a required spree_logout_path helper" do
    before do
      allow(view).to receive(:spree_logout_path).and_return("/logout")
    end

    it "has user-logout-link" 

  end

  context "with a spree.root_path" do
    before do
      allow(view.spree).to receive("root_path").and_return("/")
    end

    it "has a back to store link" 

  end
end

