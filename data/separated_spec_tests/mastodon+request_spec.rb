# frozen_string_literal: true

require 'rails_helper'
require 'securerandom'

describe Request do
  subject { Request.new(:get, 'http://example.com') }

  describe '#headers' do
    it 'returns user agent' 


    it 'returns the date header' 


    it 'returns the host header' 


    it 'does not return virtual request-target header' 

  end

  describe '#on_behalf_of' do
    it 'when used, adds signature header' 

  end

  describe '#add_headers' do
    it 'adds headers to the request' 

  end

  describe '#perform' do
    context 'with valid host' do
      before { stub_request(:get, 'http://example.com') }

      it 'executes a HTTP request' 


      it 'executes a HTTP request when the first address is private' 


      it 'sets headers' 


      it 'closes underlaying connection' 


      it 'returns response which implements body_with_limit' 

    end

    context 'with private host' do
      around do |example|
        WebMock.disable!
        example.run
        WebMock.enable!
      end

      it 'raises Mastodon::ValidationError' 

    end
  end

  describe "response's body_with_limit method" do
    it 'rejects body more than 1 megabyte by default' 


    it 'accepts body less than 1 megabyte by default' 


    it 'rejects body by given size' 


    it 'rejects too large chunked body' 


    it 'rejects too large monolithic body' 


    it 'uses binary encoding if Content-Type does not tell encoding' 


    it 'uses binary encoding if Content-Type tells unknown encoding' 


    it 'uses encoding specified by Content-Type' 

  end
end

