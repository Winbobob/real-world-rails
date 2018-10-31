require 'rails_helper'
require 'caching/api_request'

describe Caching::ApiRequest do
  let(:url) { 'http://test.com/ping.json' }

  let(:value1) { 'test value 1' }
  let(:response1) { double('Response1', headers: {}, body: value1) }
  let(:value2) { 'test value 2' }
  let(:response2) { double('Response2', headers: {}, body: value2) }

  before(:each) do
    Caching.backend = Caching::MemoryStore
  end

  after(:each) do
    Caching.clear
  end

  describe 'options' do
    subject { described_class.new(url, options) }

    context 'default set' do
      let(:options) { {} }

      it 'should have a default set of options, if none provided' 

    end

    context 'custom set' do
      let(:options) { {ttl: 180, ignore_params: ['sorting']} }

      it 'should override default options if provided' 

    end
  end

  describe 'url normalization and param filtering' do
    [
      %w(http://test.com                http://test.com),
      %w(http://Test.Com                http://test.com),
      %w(http://test.com?               http://test.com),
      %w(http://test.com/               http://test.com/),
      %w(http://test.com/?              http://test.com/),
      %w(http://test.com?123            http://test.com?123),
      %w(http://test.com/?123           http://test.com/?123),
      %w(http://test.com/?321           http://test.com/?321),
      %w(http://test.com?test=1         http://test.com?test=1),
      %w(http://test.com?api_key=1      http://test.com?api_key=1),
      %w(http://test.com?api_key=1&a=b  http://test.com?a=b&api_key=1),
      %w(http://test.com?b=1&a=2        http://test.com?a=2&b=1),
      %w(http://test.com?a=1#anchor     http://test.com?a=1),
    ].each do |(url, processed_url)|
      it "should process #{url} and return #{processed_url}" 

    end
  end

  describe 'writing and reading from the cache' do
    let(:current_store) { Caching.backend.current }

    context 'caching new content' do
      it 'should write to the cache and return the content' 


      it 'should cache again a stale content' 

    end

    context 'reading from cache existing content' do
      it 'should read from the cache and return the content' 

    end
  end
end

