# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSpamScorer do

  after(:each) { described_class.reset }

  describe '.currency_symbols' do

    it 'sets a default currency_symbols value' 


    it 'sets a custom currency_symbols value' 


  end

  describe '.score_mappings' do

    it 'sets a default score_mappings value' 


    it 'sets a custom score_mappings value' 


  end

  describe '.suspicious_domains' do

    it 'sets a default suspicious_domains value' 


    it 'sets a custom suspicious_domains value' 


  end

  describe '.spam_domains' do

    it 'sets a default spam_domains value' 


    it 'sets a custom spam_domains value' 


  end

  describe '.spam_formats' do

    it 'sets a default spam_formats value' 


    it 'sets a custom spam_formats value' 


  end

  describe '.spam_score_threshold' do

    it 'sets a default spam_score_threshold value' 


    it 'sets a custom spam_score_threshold value' 


  end

  describe '.spam_tlds' do

    it 'sets a default spam_tlds value' 


    it 'sets a custom spam_tlds value' 


  end

  describe '.reset' do

    it 'resets the class instance variables' 


    it 'returns the list of attributes that were reset' 


  end

  describe '.new' do

    it 'sets a default currency_symbols value' 


    it 'sets a custom currency_symbols value' 


    it 'sets a default score_mappings value' 


    it 'sets a custom score_mappings value' 


    it 'sets a default suspicious_domains value' 


    it 'sets a custom suspicious_domains value' 


    it 'sets a default spam_formats value' 


    it 'sets a custom spam_formats value' 


    it 'sets a default spam_score_threshold value' 


    it 'sets a custom spam_score_threshold value' 


    it 'sets a default spam_tlds value' 


    it 'sets a custom spam_tlds value' 


  end

  describe '#spam?' do

    it 'returns true if the user spam score is above the threshold' 


    it 'returns false if the user spam score is equal to the threshold' 


    it 'returns false if the user spam score is below the threshold' 


  end

  describe '#score' do

    it 'returns 0 if no mappings return true' 


    it 'returns 0 if the user has comments' 


    it 'returns 0 if the user has track_things' 


    it 'increases the score for each score mapping that returns true' 


    it 'raises an error if a mapping is invalid' 


  end

  describe '#name_is_all_lowercase?' do

    it 'is true if the name is all lowercase' 


    it 'is false if the name is not all lowercase' 


  end

  describe '#name_is_one_word?' do

    it 'is true if the name is one word' 


    it 'is false if the name includes a space' 


  end

  describe '#name_is_garbled?' do

    it 'is true if the name includes 5 consecutive consonants' 


    it 'is false if the name does not include 5 consecutive consonants' 


  end

  describe '#name_includes_non_alpha_characters?' do

    it 'is true if the name includes numbers' 


    it 'is true if the name includes non-word characters' 


    it 'is false if the name is English alpha characters' 


    it 'is false if the name is English alpha characters and whitespace' 


  end

  describe '#email_from_suspicious_domain?' do

    it 'is true if the email is from a suspicious domain' 


    it 'is false if the email is not from a suspicious domain' 


  end

  describe '#email_from_spam_domain?' do

    it 'is true if the email is from a spam domain' 


    it 'is false if the email is not from a spam domain' 


  end

  describe '#email_from_spam_tld?' do

    it 'is true if the email is from a spam tld' 


    it 'is false if the email is not from a spam tld' 


  end

  describe '#about_me_includes_currency_symbol?' do

    it 'is true if the about me includes a currency symbol' 


    it 'is false if the about me does not include a currency symbol' 


  end

  describe '#about_me_is_link_only?' do

    it 'is true if the about me is just a HTTP URL' 


    it 'is true if the about me is just a HTTPS URL' 


    it 'is false if the about me has text only' 


    it 'is false if the about me includes other text' 


    it 'is false if the about me includes other text' 


    it 'is case insensitive' 


  end

  describe '#about_me_is_spam_format?' do

    it 'is true if the about me matches a spammy format' 


    it 'is false if the about me is not a spammy format' 


    it 'replaces \r\n with \n' 


    context 'the default spam formats' do

      it 'is true if it matches TEXT\n\nURL' 


      it 'is true if it matches URL\n\nTEXT' 


      it 'is true if it matches TEXT\n\nTEXT\n\nURL' 


    end

  end

  describe '#about_me_includes_anchor_tag?' do

    it 'is true if the about me includes an a tag' 


    it 'is false if the about me does not include an a tag' 

  end

  describe '#about_me_already_exists?' do

    it 'is true if the about me already exists' 


    it 'is false if the about me is unique to the user' 


  end

end

