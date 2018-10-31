require 'spec_helper'

RSpec.describe RSpec::Sidekiq::Matchers::BeRetryable do
  let(:specific_subject) { RSpec::Sidekiq::Matchers::BeRetryable.new 2 }
  let(:specific_worker) { create_worker retry: 2 }
  let(:default_subject) { RSpec::Sidekiq::Matchers::BeRetryable.new true }
  let(:default_worker) { create_worker retry: true }
  let(:negative_subject) { RSpec::Sidekiq::Matchers::BeRetryable.new false }
  let(:negative_worker) { create_worker retry: false }
  before(:each) do
    specific_subject.matches? specific_worker
    default_subject.matches? default_worker
    negative_subject.matches? negative_worker
  end

  describe 'expected usage' do
    it 'matches' 

  end

  describe '#be_retryable' do
    it 'returns instance' 

  end

  describe '#description' do
    context 'when expected is a number' do
      it 'returns description' 

    end

    context 'when expected is true' do
      it 'returns description' 

    end

    context 'when expected is false' do
      it 'returns description' 

    end
  end

  describe '#failure_message' do
    context 'when expected is a number' do
      it 'returns message' 

    end

    context 'when expected is true' do
      it 'returns message' 

    end

    context 'when expected is false' do
      it 'returns message' 

    end
  end

  describe '#matches?' do
    context 'when condition matches' do
      context 'when expected is a number' do
        it 'returns true' 

      end

      context 'when expected is true' do
        it 'returns true' 

      end

      context 'when expected is false' do
        it 'returns true' 

      end
    end

    context 'when condition does not match' do
      context 'when expected is a number' do
        it 'returns false' 

      end

      context 'when expected is true' do
        it 'returns false' 

      end

      context 'when expected is false' do
        it 'returns false' 

      end
    end
  end

  describe '#failure_message_when_negated' do
    context 'when expected is a number' do
      it 'returns message' 

    end

    context 'when expected is true' do
      it 'returns message' 

    end

    context 'when expected is false' do
      it 'returns message' 

    end
  end
end

