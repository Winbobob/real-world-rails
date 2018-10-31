# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SafeRedirect do

  describe '.new' do

    it 'requires a redirect_parameter' 


    it 'parses the redirect_parameter to a URI' 


    it 'rejects an invalid redirect_parameter' 


  end

  describe '#path' do
    subject { described_class.new(redirect_param).path }

    context 'with a simple path' do
      let(:redirect_param) { '/request/the_cost_of_boring' }

      it 'returns the path' 


    end

    context 'with query parameters' do
      let(:redirect_param) { '/request/the_cost_of_boring?x=y&y=z' }

      it 'strips the query parameters' 


    end

    context 'with an anchor' do
      let(:redirect_param) { '/request/the_cost_of_boring#incoming-1' }

      it 'retains the anchor' 


    end

    context 'with query parameters and an anchor' do
      let(:redirect_param) { '/request/the_cost_of_boring?x=y&y=z#incoming-1' }

      it 'strips the query parameters and retains the anchor' 


    end

    context 'with a host component' do
      let(:redirect_param) { 'http://www.example.com/request/hello' }

      it 'strips the host' 


    end

    context 'with an optional query' do
      subject { described_class.new(redirect_param).path(query: 'emergency=1') }

      let(:redirect_param) { '/request/hello' }

      it 'appends the query string' 


    end

  end

end

