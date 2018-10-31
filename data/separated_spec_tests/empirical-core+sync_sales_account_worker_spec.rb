require 'rails_helper'

describe SyncSalesAccountWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let(:syncer) { double(:syncer, call: true) }

    before do
      allow(SyncSalesAccount).to receive(:new) { syncer }
    end

    it 'should sync the account worker' 

  end
end

