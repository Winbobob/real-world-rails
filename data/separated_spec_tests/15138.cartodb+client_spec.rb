# encoding: utf-8

require_relative '../../../spec_helper'

require 'rspec/core'
require 'rspec/expectations'
require 'rspec/mocks'
require 'mocha'
require_relative '../../../../lib/carto/http/client'
require_relative '../../../../lib/carto/http/request'

describe Carto::Http::Client do

  before(:each) do
    http_client_tag = 'test'
    @client = Carto::Http::Client.get(http_client_tag, log_requests: true)
  end


  describe '#request' do
    it 'wraps creation of typhoeus request objects' 

  end

  describe 'Request#run' do
    it 'performs a request through its typhoeus request object' 

  end

  describe '#get' do
    it 'creates a wrapped GET request and runs it' 

  end

  describe '#post' do
    it 'creates a wrapped POST request and runs it' 

  end

  describe '#head' do
    it 'creates a wrapped HEAD request and runs it' 

  end

  describe '#put' do
    it 'creates a wrapped PUT request and runs it' 

  end

  describe '#delete' do
    it 'creates a wrapped DELETE request and runs it' 

  end

end


