# frozen_string_literal: true

require_relative '../spec_helper'
require 'jwt'

describe 'README.md code test' do
  context 'algorithm usage' do
    let(:payload) { { data: 'test' } }

    it 'NONE' 


    it 'HMAC' 


    it 'RSA' 


    it 'ECDSA' 


    it 'RSASSA-PSS' 

  end

  context 'claims' do
    let(:hmac_secret) { 'MyP4ssW0rD' }

    context 'exp' do
      it 'without leeway' 


      it 'with leeway' 

    end

    context 'nbf' do
      it 'without leeway' 


      it 'with leeway' 

    end

    it 'iss' 


    context 'aud' do
      it 'array' 


      it 'string' 

    end

    it 'jti' 


    context 'iat' do
      it 'without leeway' 


      it 'with leeway' 

    end

    context 'custom header fields' do
      it 'with custom field' 

    end

    it 'sub' 

  end
end

