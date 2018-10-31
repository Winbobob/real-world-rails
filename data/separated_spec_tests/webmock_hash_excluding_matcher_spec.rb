require 'spec_helper'

module WebMock
  module Matchers
    describe HashExcludingMatcher do
      it 'stringifies the given hash keys' 


      it 'sorts elements in the hash' 


      it 'describes itself properly' 


      describe 'success' do
        it 'match with hash with a missing key' 


        it 'match an empty hash with a given key' 


        it 'match when values are nil but keys are different' 


        describe 'when matching an empty hash' do
          it 'does not matches against any hash' 

        end
      end

      describe 'failing' do
        it 'does not match a hash with a one missing key when one pair is matching' 


        it 'match a hash with an incorrect value' 


        it 'does not matches the same hash' 


        it 'does not matches a hash with extra stuff' 


        it 'does not match a non-hash' 

      end
    end
  end
end

