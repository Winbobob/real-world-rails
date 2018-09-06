# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::ContributionsController, type: :controller do
  subject { response }
  let(:admin) { create(:user, admin: true) }
  let(:current_user) { admin }

  before do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  describe 'POST batch_chargeback' do
    let!(:confirmed_contribution) { create(:confirmed_contribution) }
    let!(:payment) { confirmed_contribution.payments.last }

    let!(:confirmed_contribution_2) { create(:confirmed_contribution) }
    let!(:payment_2) { confirmed_contribution_2.payments.last }

    let!(:pending_contribution) { create(:pending_contribution) }
    let!(:payment_3) { pending_contribution.payments.last }


    context 'when not logged' do
      let(:current_user) { nil }
      before do
        allow(controller).to receive(:current_user).and_return(current_user)
        post :batch_chargeback, payment_ids: [payment.id, payment_2.id, payment_3.id], locale: :pt
      end

      it "should be redirect" 

    end

    context 'when logged without admin' do
      let(:current_user) { create(:user, admin: false) }
      before do
        allow(controller).to receive(:current_user).and_return(current_user)
        post :batch_chargeback, payment_ids: [payment.id, payment_2.id, payment_3.id], locale: :pt
      end

      it "should be redirect" 

    end

    context 'when admin logged' do
      before do
        allow_any_instance_of(Project).to receive(:successful_pledged_transaction).and_return({id: 'mock'})
        post :batch_chargeback, payment_ids: [payment.id, payment_2.id, payment_3.id], locale: :pt
      end

      it "should be successful" 


      it 'should chargeback and generate balance for valid chargeback subscriptions' 

    end
  end

end

