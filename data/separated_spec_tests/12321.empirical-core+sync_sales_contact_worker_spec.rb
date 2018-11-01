require 'rails_helper'

describe SyncSalesContactWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let(:syncer) { double(:syncer, call: true) }

    before do
      allow(SyncSalesContact).to receive(:new) { syncer }
    end

    it 'should sync the sales contact syncer' 

  end
end

