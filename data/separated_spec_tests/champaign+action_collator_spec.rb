# frozen_string_literal: true
require 'rails_helper'

describe ActionCollator do
  let(:a1) { build :action, form_data: { phone: '12345', name: 'Hocus', id: 1 } }
  let(:a2) { build :action, form_data: { name: 'Pocus', postal: '90019', action_foo: 'bar', id: 2 } }

  describe 'keys' do
    it "includes the keys present on any action's form data" 


    it "excludes fields that aren't prefixes by action_ or match AK fields" 


    it 'excludes action_referrer_email and action_express_donation' 

  end

  describe 'headers' do
    it 'removes appropriate prefixes and titleizes' 

  end

  describe 'hashes' do
    it 'turns actions into hashes' 

  end

  describe 'csv' do
    let(:content_rows) { [',Pocus,90019,bar,default,2', '12345,Hocus,,,default,1'] }

    it 'has the headers as the first line' 


    it 'has a line for each action, and a header line' 


    it 'has all the values for each action' 


    it 'does not have the headers if skip_headers is passed as true' 


    it 'puts quotes around fields with commas' 

  end

  describe 'run' do
    it 'returns hashes and headers' 

  end
end

