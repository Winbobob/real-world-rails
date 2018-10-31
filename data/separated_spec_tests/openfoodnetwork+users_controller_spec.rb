require 'spec_helper'
require 'spree/api/testing_support/helpers'

describe Spree::UsersController, type: :controller do
  include AuthenticationWorkflow

  describe "show" do
    let!(:u1) { create(:user) }
    let!(:u2) { create(:user) }
    let!(:distributor1) { create(:distributor_enterprise) }
    let!(:distributor2) { create(:distributor_enterprise) }
    let!(:d1o1) { create(:completed_order_with_totals, distributor: distributor1, user_id: u1.id) }
    let!(:d1o2) { create(:completed_order_with_totals, distributor: distributor1, user_id: u1.id) }
    let!(:d1_order_for_u2) { create(:completed_order_with_totals, distributor: distributor1, user_id: u2.id) }
    let!(:d1o3) { create(:order, state: 'cart', distributor: distributor1, user_id: u1.id) }
    let!(:d2o1) { create(:completed_order_with_totals, distributor: distributor2, user_id: u2.id) }
    let!(:accounts_distributor) { create :distributor_enterprise }
    let!(:order_account_invoice) { create(:order, distributor: accounts_distributor, state: 'complete', user: u1) }

    let(:orders) { assigns(:orders) }
    let(:shops) { Enterprise.where(id: orders.pluck(:distributor_id)) }

    before do
      Spree::Config.set(accounts_distributor_id: accounts_distributor.id)
      allow(controller).to receive(:spree_current_user) { u1 }
    end

    it "returns orders placed by the user at normal shops" 

  end

  describe "registered_email" do
    let!(:user) { create(:user) }

    it "returns true if email corresponds to a registered user" 


    it "returns false if email does not correspond to a registered user" 

  end
end

