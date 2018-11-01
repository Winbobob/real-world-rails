require 'rails_helper'

describe SubscriptionsController do
  let!(:user) { create(:teacher, :premium) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    it 'should set the instance variables' 

  end

  describe "#purchaser_name" do
    context 'when subscription is not associated with current user' do
      let(:another_user) { create(:user) }

      before do
        allow_any_instance_of(Subscription).to receive(:users) { [another_user] }
        user.subscriptions.first.update(purchaser: another_user)
      end

      it 'should sign the user out' 

    end

    context 'when subscription is associated with current user' do
      it 'should render the purchaser name' 

    end
  end

  describe '#create' do
    it 'should create the subscription' 

  end

  describe '#update' do
    it 'should update the given subscription' 

  end

  describe '#destroy' do
    it 'should destroy the given subscription' 

  end
end

