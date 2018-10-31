require 'rails_helper'

describe Cms::SubscriptionsController do
  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#create' do
    let!(:school) { create(:school) }
    let(:subscription) { build(:subscription) }

    it 'should create the subscription' 

  end

  describe '#update' do
    let!(:subscription) { create(:subscription) }

    it 'should update the given subscription' 

  end
end

