require 'rails_helper'

describe AccountSearchService, type: :service do
  describe '.call' do
    describe 'with a query to ignore' do
      it 'returns empty array for missing query' 

      it 'returns empty array for hashtag query' 

      it 'returns empty array for limit zero' 

    end

    describe 'searching for a simple term that is not an exact match' do
      it 'does not return a nil entry in the array for the exact match' 

    end

    describe 'searching local and remote users' do
      describe "when only '@'" do
        before do
          allow(Account).to receive(:find_local)
          allow(Account).to receive(:search_for)
          subject.call('@', 10)
        end

        it 'uses find_local with empty query to look for local accounts' 

      end

      describe 'when no domain' do
        before do
          allow(Account).to receive(:find_local)
          allow(Account).to receive(:search_for)
          subject.call('one', 10)
        end

        it 'uses find_local to look for local accounts' 


        it 'uses search_for to find matches' 

      end

      describe 'when there is a domain' do
        before do
          allow(Account).to receive(:find_remote)
        end

        it 'uses find_remote to look for remote accounts' 


        describe 'and there is no account provided' do
          it 'uses search_for to find matches' 

        end

        describe 'and there is an account provided' do
          it 'uses advanced_search_for to find matches' 

        end
      end
    end

    describe 'with an exact match' do
      it 'returns exact match first, and does not return duplicates' 

    end

    describe 'when there is a local domain' do
      around do |example|
        before = Rails.configuration.x.local_domain
        example.run
        Rails.configuration.x.local_domain = before
      end

      it 'returns exact match first' 

    end

    describe 'when there is a domain but no exact match' do
      it 'follows the remote account when resolve is true' 


      it 'does not follow the remote account when resolve is false' 

    end

    describe 'should not include suspended accounts' do
      it 'returns the fuzzy match first, and does not return suspended exacts' 


      it "does not return suspended remote accounts" 

    end
  end
end

