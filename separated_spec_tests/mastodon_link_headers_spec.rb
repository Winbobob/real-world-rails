# frozen_string_literal: true

require 'rails_helper'

describe 'Link headers' do
  describe 'on the account show page' do
    let(:account) { Fabricate(:account, username: 'test') }

    before do
      get short_account_path(username: account)
    end

    it 'contains webfinger url in link header' 


    it 'contains atom url in link header' 


    def link_header_with_type(type)
      response.headers['Link'].links.find do |link|
        link.attr_pairs.any? { |pair| pair == ['type', type] }
      end
    end
  end
end

