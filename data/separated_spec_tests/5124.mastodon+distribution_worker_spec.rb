require 'rails_helper'

describe ActivityPub::DistributionWorker do
  subject { described_class.new }

  let(:status)   { Fabricate(:status) }
  let(:follower) { Fabricate(:account, protocol: :activitypub, inbox_url: 'http://example.com') }

  describe '#perform' do
    before do
      allow(ActivityPub::DeliveryWorker).to receive(:push_bulk)
      follower.follow!(status.account)
    end

    context 'with public status' do
      before do
        status.update(visibility: :public)
      end

      it 'delivers to followers' 

    end

    context 'with private status' do
      before do
        status.update(visibility: :private)
      end

      it 'delivers to followers' 

    end

    context 'with direct status' do
      before do
        status.update(visibility: :direct)
      end

      it 'does nothing' 

    end
  end
end

