# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AlaveteliRateLimiter::RateLimiter do
  let(:window) { AlaveteliRateLimiter::Window.new(1, :hour) }
  let(:rule) { AlaveteliRateLimiter::Rule.new(:test, 1, window) }

  describe '.new' do

    it 'requires a Rule' 


    it 'accepts a Rule' 


    it 'creates a default backend' 


    it 'allows a custom backend' 


  end

  describe '#rule' do

    it 'returns the rule attribute' 


  end

  describe '#backend' do

    it 'returns the backend attribute' 


  end

  describe '#records' do

    it 'returns the records in the backend' 


  end

  describe '#record' do

    it 'records an event for the id in the backend' 


    it 'converts to a String key' 


  end

  describe '#record!' do

    it 'purges old records before recording the new event' 


  end

  describe '#limit?' do
    let(:rule) { AlaveteliRateLimiter::Rule.new(:test, 1, double) }

    context 'with the rule initialized with the instance' do
      it 'returns true if the records break the rule limit' 


      it 'returns false if the records are within the rule limit' 

    end

    context 'with the rule passed as an argument' do
      let(:custom_rule) { AlaveteliRateLimiter::Rule.new(:test, 1, double) }

      it 'returns true if the records break the rule limit' 


      it 'returns false if the records are within the rule limit' 

    end

  end

end

