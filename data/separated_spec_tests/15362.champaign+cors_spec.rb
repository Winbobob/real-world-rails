# frozen_string_literal: true
require 'rails_helper'

describe 'CORS support' do
  let(:allow_origin) do
    response.headers['Access-Control-Allow-Origin']
  end

  let(:allow_methods) do
    response.headers['Access-Control-Allow-Methods']
  end

  let(:allow_credentials) do
    response.headers['Access-Control-Allow-Credentials']
  end

  it 'responds to OPTIONS with a 204 No Content' 


  # Note that there are no controller methods to handle any OPTIONS
  # requests. This tests that all existing routes are matched via: OPTIONS
  # and responded to accordigly.
  describe 'Preflight requests (OPTIONS)' do
    context 'when a request comes *.sumofus.org subdomain' do
      headers = {
        accept: 'application/json',
        origin: 'http://actions.sumofus.org'
      }

      it 'responds allowing the exact subdomain' 


      it 'also allows requests from sumofus.org (no subdomain)' 


      it 'allows all HTTP methods' 


      it 'allows all Credentials' 

    end

    context 'when the origin is not a *.sumofus.org subdomain' do
      headers = { origin: 'http://www.not-sumofus.org' }

      it 'does not have the allow-origin cors header' 


      it 'does not have the allow-methods cors header' 


      it 'does not have the allow-credentials cors header' 

    end
  end

  # This block only tests one GET request, but the same applies to
  # all existing routes that are handled by a controller method
  describe 'Any other http request' do
    context 'when a request comes *.sumofus.org subdomain' do
      headers = {
        accept: 'application/json',
        origin: 'https://actions.sumofus.org'
      }

      it 'responds allowing the exact domain' 

    end

    context 'when the origin is not a *.sumofus.org subdomain' do
      headers = {
        accept: 'application/json',
        origin: 'http://www.not-sumofus.org'
      }

      it 'responds without the CORS headers' 

    end
  end
end

