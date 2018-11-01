# frozen_string_literal: true

require 'rails_helper'

describe 'API::MemberServices' do
  context 'with invalid auth headers' do
    let(:bogus_header) do
      {
        'X-CHAMPAIGN-SIGNATURE' => 'olololololo',
        'X-CHAMPAIGN-NONCE' => 'wololo'
      }
    end

    it 'logs an access violation and sends back status 401' 

  end

  context 'with missing auth headers' do
    it 'complains about missing auth headers' 

  end
end

