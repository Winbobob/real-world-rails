require 'spec_helper'

RSpec.describe RSpec::Sidekiq::Matchers::BeProcessedIn do
  let(:symbol_subject) { RSpec::Sidekiq::Matchers::BeProcessedIn.new :a_queue }
  let(:symbol_worker) { create_worker queue: :a_queue }
  let(:string_subject) { RSpec::Sidekiq::Matchers::BeProcessedIn.new 'a_queue' }
  let(:string_worker) { create_worker queue: 'a_queue' }
  let(:active_job) { create_active_job :mailers }

  before(:each) do
    symbol_subject.matches? symbol_worker
    string_subject.matches? string_worker
  end

  describe 'expected usage' do
    it 'matches' 


    it 'matches on an ActiveJob' 

  end

  describe '#be_processed_in' do
    it 'returns instance' 

  end

  describe '#description' do
    context 'when expected is a symbol' do
      it 'returns description' 

    end

    context 'when expected is a string' do
      it 'returns description' 

    end
  end

  describe '#failure_message' do
    context 'when expected is a symbol' do
      it 'returns message' 

    end

    context 'when expected is a string' do
      it 'returns message' 

    end
  end

  describe '#matches?' do
    context 'when condition matches' do
      context 'when expected is a symbol' do
        it 'returns true' 

      end

      context 'when expected is a symbol and actual is string' do
        it 'returns true' 

      end

      context 'when expected is a string' do
        it 'returns true' 

      end

      context 'when expected is a string and actual is symbol' do
        it 'returns true' 

      end
    end

    context 'when condition does not match' do
      context 'when expected is a symbol' do
        it 'returns false' 

      end

      context 'when expected is a string' do
        it 'returns false' 

      end
    end
  end

  describe '#failure_message_when_negated' do
    context 'when expected is a symbol' do
      it 'returns message' 

    end

    context 'when expected is a string' do
      it 'returns message' 

    end
  end
end

