require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  let(:teacher) { create(:teacher_with_school) }

  before do
    allow(controller).to receive(:current_user) { teacher.reload }
  end

  describe '#create_customer_with_card' do
    before do
      teacher.update(stripe_customer_id: nil)
      allow(Stripe::Customer).to receive(:create) { double(:customer, id: 42) }
    end

    it 'should create the customer on stripe and update current users stripe customer id' 

  end

  describe '#update_card' do
    let(:new_card) { double(:card, id: 108) }
    let(:sources) { double(:sources, create: new_card) }
    let(:customer) { double(:customer, sources: sources, "default_source=".to_sym => true, save: true) }

    before do
      allow(Stripe::Customer).to receive(:retrieve) { customer }
    end

    it 'should create a new source and add that as default source in stripe customer' 

  end

  describe '#new_teacher_premium' do
    context 'when new subscription' do
      before do
        allow(Subscription).to receive(:give_teacher_premium_if_charge_succeeds) { "subscription" }
      end

      it 'should kick off the sales contact updater and return the json' 

    end

    context 'when no new subscription' do
      before do
        allow(Subscription).to receive(:give_teacher_premium_if_charge_succeeds) { nil }
      end

      it 'should return the json' 

    end
  end

  describe '#new_school_premium' do
    context 'when new subscription present' do
      before do
        allow(Subscription).to receive(:give_school_premium_if_charge_succeeds) { "subscription" }
      end

      it 'should kick off the sales contact updater and return the json' 

    end

    context 'when new subscription not present' do
      before do
        allow(Subscription).to receive(:give_school_premium_if_charge_succeeds) { nil }
      end

      it 'should return the json' 

    end
  end
end

