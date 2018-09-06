# frozen_string_literal: true

require 'rails_helper'

describe Extractor do
  describe 'extract_mentions_or_lists_with_indices' do
    it 'returns an empty array if the given string does not have at signs' 


    it 'does not extract mentions which ends with particular characters' 


    it 'returns mentions as an array' 


    it 'yields mentions if a block is given' 

  end

  describe 'extract_hashtags_with_indices' do
    it 'returns an empty array if it does not have #' 


    it 'does not exclude normal hash text before ://' 


    it 'excludes http://' 


    it 'excludes https://' 


    it 'yields hashtags if a block is given' 

  end

  describe 'extract_cashtags_with_indices' do
    it 'returns []' 

  end
end

