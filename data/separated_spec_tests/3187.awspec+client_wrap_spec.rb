require 'spec_helper'

# used to test the method_missing functionality #
module RSpec::Mocks
  module Errors
    class RequestLimitExceeded < RuntimeError
    end
  end
end

# rubocop:disable Metrics/BlockLength
describe Awspec::Helper::ClientWrap do
  let(:subj) { Awspec::Helper::ClientWrap }

  describe 'wtf .new' do
    let(:client) { subj.new('client') }

    context 'given the correct required arguments' do
      it 'should create a new instance' 


      it 'should set the client arrtibute' 


      it 'should set the backoff attribute to the default' 


      it 'should set the iteration attribute to the default' 


      it 'should set the backoff_limit attribute to the default' 

    end

    context 'given optional args' do
      let(:client) { subj.new('client', backoff: 1.0, iteration: 2, backoff_limit: 10) }

      it 'should set the backoff attribute' 


      it 'should set the iteration attribute' 


      it 'should set the backoff_limit attribute' 

    end

    context 'given no client' do
      it 'should raise an ArgumentError' 

    end

    context 'given a nil client' do
      it 'should raise an ArgumentError' 

    end
  end

  describe '#method_missing (protected)' do
    context 'given the client does not raise ::RequestLimitExceeded error' do
      let(:client) { subj.new({}) }

      it 'should pass the method through to the client' 


      it 'should raise exceptions not caught' 

    end

    context 'given the client raises ::RequestLimitExceeded error' do
      let(:client) { double 'fake' }

      it 'should be called multiple times in a sleep loop, and re-raise the exception if it is not cleared' 


      it 'return as expected once the error is cleared' 

    end
  end
end

