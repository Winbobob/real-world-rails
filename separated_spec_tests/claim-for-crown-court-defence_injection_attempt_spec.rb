require 'rails_helper'

module Remote
  describe InjectionAttempt do
    let(:injection_attempt) { ::Remote::InjectionAttempt.new(succeeded: false, error_messages: ['injection error 1', 'injection error 2']) }

    describe '#succeeded' do
      subject { injection_attempt.succeeded }
      it 'returns false for successful attempts' 

    end

    describe '#active?' do
      subject { injection_attempt.active? }
      it 'returns true when not softly deleted' 


      it 'returns false when softly deleted' 

    end

    describe '#error_messages' do
      subject { injection_attempt.error_messages }
      it 'returns array of injection error messages' 

    end
  end
end

