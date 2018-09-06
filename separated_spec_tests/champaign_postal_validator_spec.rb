# frozen_string_literal: true
require 'rails_helper'

describe PostalValidator do
  def valid?(postal, country = nil)
    PostalValidator.new(postal, country_code: country).valid?
  end

  context 'given a US country code' do
    it 'validats US specific format' 

  end

  context 'given generic valid postal codes' do
    it 'successfully validates them' 

  end

  it 'validates only accepted characters are present' 


  it "validates it's no longer than 9 chars" 

end

