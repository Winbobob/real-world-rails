# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AlaveteliSpamTermChecker do

  after(:each) do
    described_class.default_spam_terms = described_class::DEFAULT_SPAM_TERMS
  end

  describe '.default_spam_terms' do

    it 'returns the DEFAULT_SPAM_TERMS if no custom terms have been set' 


  end

  describe '.default_spam_terms=' do

    it 'sets custom terms' 


    it 'converts a single term to an array' 


    it 'converts a String term to a Regexp' 


    it 'handles mixed String and Regexp terms' 


    it 'allows an empty set of terms' 


    it 'allows an empty set of terms when given nil' 


    it 'does not allow an invalid term' 


  end

  describe '.new' do

    it 'sets the default terms if none are given' 


    it 'sets the custom default spam terms if none are given' 


    it 'sets custom terms' 


    it 'converts a single term to an array' 


    it 'converts a String term to a Regexp' 


    it 'handles mixed String and Regexp terms' 


    it 'allows an empty set of terms' 


    it 'does not allow an invalid term' 


  end

  describe '#spam?' do

    it 'returns true if the term matches a spam term' 


    it 'returns false if the term does not match any spam terms' 


  end

end

