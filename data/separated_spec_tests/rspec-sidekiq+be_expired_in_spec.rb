require 'spec_helper'

RSpec.describe RSpec::Sidekiq::Matchers::BeExpiredIn do
  let(:subject) { RSpec::Sidekiq::Matchers::BeExpiredIn.new 1 }
  let(:worker) { create_worker expires_in: 1 }

  describe '#be_expired_in' do
    it 'returns instance' 

  end

  describe 'expected usage' do
    it 'matches' 


    context 'with negated' do
      it 'matches' 

    end
  end

  describe '#failure_message' do
    it 'returns message' 

  end

  describe '#matches?' do
    context 'when expected equals actual' do
      it 'returns true' 

    end
    context 'when expected is not equal to actual' do
      it 'returns false' 

    end
  end

  describe '#failure_message_when_negated' do
    it 'returns message' 

  end

  describe '#description' do
    it 'returns message' 

  end
end

