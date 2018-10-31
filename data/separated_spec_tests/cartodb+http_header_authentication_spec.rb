# encoding: utf-8

require 'ostruct'
require 'uuidtools'
require_relative '../../spec_helper'
require_relative '../../../lib/carto/http_header_authentication'
require_relative '../../requests/http_authentication_helper'

describe Carto::HttpHeaderAuthentication do
  include HttpAuthenticationHelper

  EMAIL = "user@carto.com"
  USERNAME = "user"
  ID = UUIDTools::UUID.timestamp_create.to_s

  let(:mock_unauthenticated_request) do
    OpenStruct.new(headers: {})
  end

  let(:mock_email_request) { OpenStruct.new(headers: { "#{authenticated_header}" => EMAIL }) }
  let(:mock_username_request) { OpenStruct.new(headers: { "#{authenticated_header}" => USERNAME }) }
  let(:mock_id_request) { OpenStruct.new(headers: { "#{authenticated_header}" => ID }) }

  let(:mock_user) do
    OpenStruct.new(
      email: EMAIL
    )
  end

  let(:mock_user_search) { OpenStruct.new(first: mock_user) }

  describe '#valid?' do
    it 'returns false without configuration' 


    it 'returns false with configuration without header' 


    it 'returns true with configuration and header' 

  end

  describe '#get_user?' do
    before(:each) do
      stub_http_header_authentication_configuration(field: 'email')
    end

    it 'returns nil without header' 


    it 'searches by email with header' 


    describe 'auto field' do
      before(:each) do
        stub_http_header_authentication_configuration(field: 'auto')
      end

      it 'searches by field depending on header' 

    end
  end

  describe '#autocreation_enabled?' do
    it 'returns autocreation configuration' 

  end

  describe '#email' do
    let(:authenticator) { Carto::HttpHeaderAuthentication.new }

    it 'returns email for email requests' 


    it 'raises error if configuration is not email (or auto with an email in the request)' 


    it 'returns email if configuration is auto and request contains an email' 

  end

  describe '#creation_in_progress?' do
    let(:authenticator) { Carto::HttpHeaderAuthentication.new }

    it 'returns true if there is a matching creation in progress by (user) id' 


    it 'returns true if there is a matching creation in progress by username' 


    it 'returns true if there is a matching creation in progress by email' 


    it 'returns false if there is not a matching creation in progress' 

  end
end

