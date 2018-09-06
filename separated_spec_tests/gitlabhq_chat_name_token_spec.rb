require 'spec_helper'

describe Gitlab::ChatNameToken do
  context 'when using unknown token' do
    let(:token) { }

    subject { described_class.new(token).get }

    it 'returns empty data' 

  end

  context 'when storing data' do
    let(:data) { { key: 'value' } }

    subject { described_class.new(@token) }

    before do
      @token = described_class.new.store!(data)
    end

    it 'returns stored data' 


    context 'and after deleting them' do
      before do
        subject.delete
      end

      it 'data are removed' 

    end
  end
end

