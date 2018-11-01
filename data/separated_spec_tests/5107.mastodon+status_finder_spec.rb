# frozen_string_literal: true

require 'rails_helper'

describe StatusFinder do
  include RoutingHelper

  describe '#status' do
    subject { described_class.new(url) }

    context 'with a status url' do
      let(:status) { Fabricate(:status) }
      let(:url) { short_account_status_url(account_username: status.account.username, id: status.id) }

      it 'finds the stream entry' 


      it 'raises an error if action is not :show' 

    end

    context 'with a stream entry url' do
      let(:stream_entry) { Fabricate(:stream_entry) }
      let(:url) { account_stream_entry_url(stream_entry.account, stream_entry) }

      it 'finds the stream entry' 

    end

    context 'with a remote url even if id exists on local' do
      let(:status) { Fabricate(:status) }
      let(:url) { "https://example.com/users/test/statuses/#{status.id}" }

      it 'raises an error' 

    end

    context 'with a plausible url' do
      let(:url) { 'https://example.com/users/test/updates/123/embed' }

      it 'raises an error' 

    end

    context 'with an unrecognized url' do
      let(:url) { 'https://example.com/about' }

      it 'raises an error' 

    end
  end
end

