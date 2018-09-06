require 'rails_helper'

RSpec.describe SecretToken do
  describe '.generate' do
    subject { described_class.generate }

    let(:token) { 'foo' }

    context 'when in production' do
      it 'returns the correct secret token' 

    end

    context 'when not in production' do
      let(:token) { ('a' * 30) }

      it { is_expected.to eq token }
    end
  end
end

