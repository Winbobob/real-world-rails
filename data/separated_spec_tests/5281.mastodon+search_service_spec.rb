# frozen_string_literal: true

require 'rails_helper'

describe SearchService, type: :service do
  subject { described_class.new }

  describe '#call' do
    describe 'with a blank query' do
      it 'returns empty results without searching' 

    end

    describe 'with an url query' do
      before do
        @query = 'http://test.host/query'
      end

      context 'that does not find anything' do
        it 'returns the empty results' 

      end

      context 'that finds an account' do
        it 'includes the account in the results' 

      end

      context 'that finds a status' do
        it 'includes the status in the results' 

      end
    end

    describe 'with a non-url query' do
      context 'that matches an account' do
        it 'includes the account in the results' 

      end

      context 'that matches a tag' do
        it 'includes the tag in the results' 

        it 'does not include tag when starts with @ character' 

      end
    end
  end

  def empty_results
    { accounts: [], hashtags: [], statuses: [] }
  end
end

