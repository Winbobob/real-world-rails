require 'rails_helper'

describe SupportStatus do
  let(:support) { Support.new }
  subject { described_class.new support }

  describe '#to_s' do
    context 'with comments' do
      before do
        expect(support).to receive(:discussed?).and_return(true)
      end

      context "returns 'new'" do
        it 'when support is from today' 

      end

      context "returns 'ok'" do
        it 'when support is from today' 

      end

      context "returns 'worrying'" do
        it 'when support is older than 2 days' 

      end

      context "returns 'critical'" do
        it 'when support is older than 4 days' 

      end
    end

    context 'without comments' do
      before do
        expect(support).to receive(:discussed?).and_return(false)
      end

      context "returns 'new'" do
        it 'when support is newer than 12h' 

      end

      context "returns 'ok'" do
        it 'when support is older than 12h' 

      end

      context "returns 'worrying'" do
        it 'when support is older than 2 days' 

      end

      context "returns 'critical'" do
        it 'when support is older than 4 days' 

      end
    end
  end
end

