# frozen_string_literal: true
require 'rails_helper'

describe 'API::Stateless Location' do
  describe 'GET /api/stateless/location' do
    context 'Geocoder Success' do
      it 'responds with (at least) a country code and a currency' 

    end

    context 'Geocoder Timeout' do
      before do
        allow(Geocoder).to receive(:search) { [] }
      end

      it 'responds with a 504 Gateway Timeout' 


      after do
        allow(Geocoder).to receive(:search).and_call_original
      end
    end
  end
end

