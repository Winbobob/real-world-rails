# frozen_string_literal: true
require 'rails_helper'

describe LiquidHelper do
  describe 'country_option_tags' do
    it 'gives a long html by default' 


    it 'does not include select tags' 


    it 'does not select a country by default' 


    it 'selects a country if passed request_country as a code' 


    it 'does not select a country if passed request_country as a country name' 

  end

  describe 'petition_target' do
    it 'returns nil if no page given' 


    it 'returns nil if page has no action plugin' 


    it 'returns nil if action plugin is inactive' 


    it 'returns the target value of an action plugin' 


    it 'returns the target value of the first non-blank action plugin' 

  end
end

