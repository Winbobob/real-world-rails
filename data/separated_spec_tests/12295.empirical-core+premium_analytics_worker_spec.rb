require 'rails_helper'

describe PremiumAnalyticsWorker do
  let(:subject) { described_class.new }
  let(:analyzer) { double(:analyzer, track: true) }

  before do
    allow(Analyzer).to receive(:new) { analyzer }
  end

  describe '#perform' do
    let!(:user) { create(:user) }

    context 'when account type is paid' do
      it 'should track began premium' 

    end

    context 'when account type is not paid' do
      it 'should track began trial' 

    end
  end
end

