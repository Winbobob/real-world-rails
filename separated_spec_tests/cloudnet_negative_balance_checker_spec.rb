require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::Actions

describe NegativeBalanceChecker do
  let(:scope) {NegativeBalanceChecker.new}

  context "enqueing jobs" do
    before(:each) do
      Sidekiq::Testing.fake!
      Sidekiq::Worker.clear_all
    end

    it "enque job for check no paying customers" 

  end

  context "perform jobs" do
    let!(:user1) { FactoryGirl.create(:user) }
    let!(:user2) { FactoryGirl.create(:user) }
    let!(:suspended_user) { FactoryGirl.create(:user, suspended: true) }
    let!(:invoice) {FactoryGirl.create :invoice, account: user1.account}
    let!(:server1) {FactoryGirl.create :server, user: user1}
    let(:mailer_q) {ActionMailer::Base.deliveries}

    before(:each) do
      mailer_q.clear
      item1 = FactoryGirl.create(:invoice_item, invoice: invoice, net_cost: 100_000)
      item2 = FactoryGirl.create(:invoice_item, invoice: invoice, net_cost: 34_000)
      invoice.invoice_items << [item1, item2]
    end

    it "performs actions on active and suspended users" 


    it "calls proper actions for users and sets tags" 


    context "integration tests for active user" do
      it_behaves_like "negative balance integration" do
        let(:user) {user1}
      end
    end

    context "integration tests for suspended user" do
      it_behaves_like "negative balance integration" do
        let(:user) {suspended_user}
        let!(:server) {FactoryGirl.create :server, user: user}

        before(:each) do
          user.account = invoice.account
          user.save
          user1.reload
        end
      end
    end
  end
end

