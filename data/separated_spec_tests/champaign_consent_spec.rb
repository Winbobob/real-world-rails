# frozen_string_literal: true

require 'rails_helper'

describe 'Api::Consent' do
  describe 'POST /api/stateless/members/:id/consent' do
    let!(:member) { create(:member, email: 'foo@example.com') }

    context 'member exists' do
      it 'records time consent given' 

    end

    context 'member does not exist' do
      it 'returns not found' 

    end
  end

  describe 'DELETE /api/stateless/consent' do
    context 'member exists' do
      let!(:member) { create(:member, consented_at: Time.now, email: 'foo@example.com') }

      it 'records time consent given' 

    end

    context 'member does not exist' do
      it 'returns not found' 

    end

    context 'email is nil' do
      it 'returns not found' 

    end
  end
end

