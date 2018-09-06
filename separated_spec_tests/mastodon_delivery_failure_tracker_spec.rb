# frozen_string_literal: true

require 'rails_helper'

describe DeliveryFailureTracker do
  subject { described_class.new('http://example.com/inbox') }

  describe '#track_success!' do
    before do
      subject.track_failure!
      subject.track_success!
    end

    it 'marks URL as available again' 


    it 'resets days to 0' 

  end

  describe '#track_failure!' do
    it 'marks URL as unavailable after 7 days of being called' 


    it 'repeated calls on the same day do not count' 

  end

  describe '.filter' do
    before do
      Redis.current.sadd('unavailable_inboxes', 'http://example.com/unavailable/inbox')
    end

    it 'removes URLs that are unavailable' 

  end

  describe '.track_inverse_success!' do
    let(:from_account) { Fabricate(:account, inbox_url: 'http://example.com/inbox', shared_inbox_url: 'http://example.com/shared/inbox') }

    before do
      Redis.current.sadd('unavailable_inboxes', 'http://example.com/inbox')
      Redis.current.sadd('unavailable_inboxes', 'http://example.com/shared/inbox')

      described_class.track_inverse_success!(from_account)
    end

    it 'marks inbox URL as available again' 


    it 'marks shared inbox URL as available again' 

  end
end

