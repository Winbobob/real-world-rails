# frozen_string_literal: true

require 'rails_helper'

describe 'Pending Action Notifications' do
  let(:action) { create(:pending_action) }

  describe 'PUT /opened' do
    it 'stamps opened_at with current time' 

  end

  describe 'PUT /delivered' do
    it 'stamps delivered_at with current time' 

  end

  describe 'PUT /bounced' do
    it 'stamps bounced_at with current time' 

  end

  describe 'PUT /complaint' do
    it 'stamps bounced_at and sets complaint to true' 

  end

  describe 'PUT /clicked' do
    it 'appends url to clicked array' 

  end
end

