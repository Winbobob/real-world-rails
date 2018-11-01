# frozen_string_literal: true

require 'spec_helper'

describe "spree/admin/shared/_navigation_footer", type: :view do
  let(:user) { FactoryBot.build_stubbed(:admin_user) }
  let(:ability) { Object.new.extend(CanCan::Ability) }
  before do
    allow(view).to receive(:try_spree_current_user).and_return(user)
    allow(controller).to receive(:current_ability).and_return(ability)
  end

  it "has a a login-nav section" 


  context "authorized user" do
    before do
      ability.can :admin, user
    end

    it "has a user-account-link that links to edit_admin_user_path" 


    it "has not a user-account-link that links to admin_path" 

  end

  context "unauthorized user" do
    it "has a user-account-link that links to admin_path" 


    it "has not a user-account-link that links to edit_admin_user_path" 

  end

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

