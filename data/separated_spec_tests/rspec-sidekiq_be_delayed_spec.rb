require 'spec_helper'

RSpec.describe RSpec::Sidekiq::Matchers::BeDelayed do
  let(:delay_subject) { RSpec::Sidekiq::Matchers::BeDelayed.new }
  let(:delay_with_arguments_subject) { RSpec::Sidekiq::Matchers::BeDelayed.new Object }
  let(:delay_for_subject) { RSpec::Sidekiq::Matchers::BeDelayed.new.for 3600 }
  let(:delay_for_with_arguments_subject) { RSpec::Sidekiq::Matchers::BeDelayed.new(Object).for 3600 }
  let(:delay_until_subject) { RSpec::Sidekiq::Matchers::BeDelayed.new.until Time.now + 3600 }
  let(:delay_until_with_arguments_subject) { RSpec::Sidekiq::Matchers::BeDelayed.new(Object).until Time.now + 3600 }
  before(:each) do
    delay_subject.matches? Object.method :nil?
    delay_with_arguments_subject.matches? Object.method :is_a?

    delay_for_subject.matches? Object.method :nil?
    delay_for_with_arguments_subject.matches? Object.method :is_a?

    delay_until_subject.matches? Object.method :nil?
    delay_until_with_arguments_subject.matches? Object.method :is_a?
  end

  describe 'expected usage' do
    it 'matches' 

  end

  describe '#be_delayed_job' do
    it 'returns instance' 

  end

  describe '#description' do
    context 'when expected is a delay' do
      it 'returns description' 

    end

    context 'when expected is a delay with arguments' do
      it 'returns description' 

    end

    context 'when expected is a delay for' do
      it 'returns description' 

    end

    context 'when expected is a delay for with arguments' do
      it 'returns description' 

    end

    context 'when expected is a delay until' do
      it 'returns description' 

    end

    context 'when expected is a delay until with arguments' do
      it 'returns description' 

    end
  end

  describe '#failure_message' do
    context 'when expected is a delay' do
      it 'returns message' 

    end

    context 'when expected is a delay with arguments' do
      it 'returns message' 

    end

    context 'when expected is a delay for' do
      it 'returns message' 

    end

    context 'when expected is a delay for with arguments' do
      it 'returns message' 

    end

    context 'when expected is a delay until' do
      it 'returns message' 

    end

    context 'when expected is a delay until with arguments' do
      it 'returns message' 

    end
  end

  describe '#matches?' do
    context 'when condition matches' do
      context 'when expected is a delay' do
        it 'returns true' 

      end

      context 'when expected is a delay with arguments' do
        it 'returns true' 

      end

      context 'when expected is a delay for' do
        it 'returns true' 

      end

      context 'when expected is a delay for with arguments' do
        it 'returns true' 

      end

      context 'when expected is a delay until' do
        it 'returns true' 

      end

      context 'when expected is a delay until with arguments' do
        it 'returns true' 

      end
    end

    context 'when condition does not match' do
      context 'when expected is a delay' do
        it 'returns false' 

      end

      context 'when expected is a delay with arguments' do
        it 'returns false' 

      end

      context 'when expected is a delay for' do
        it 'returns false' 

      end

      context 'when expected is a delay for with arguments' do
        it 'returns false' 

      end

      context 'when expected is a delay until' do
        it 'returns false' 

      end

      context 'when expected is a delay until with arguments' do
        it 'returns false' 

      end
    end
  end

  describe '#failure_message_when_negated' do
    context 'when expected is a delay' do
      it 'returns message' 

    end

    context 'when expected is a delay with arguments' do
      it 'returns message' 

    end

    context 'when expected is a delay for' do
      it 'returns message' 

    end

    context 'when expected is a delay for with arguments' do
      it 'returns message' 

    end

    context 'when expected is a delay until' do
      it 'returns message' 

    end

    context 'when expected is a delay until with arguments' do
      it 'returns message' 

    end
  end
end

