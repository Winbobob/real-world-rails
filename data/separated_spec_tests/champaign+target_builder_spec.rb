require 'rails_helper'

describe CallTool::TargetBuilder do
  let(:builder) { CallTool::TargetBuilder }

  context 'without contry params' do
    it 'builds a target with passed attributes' 

  end

  context 'given country_name is passed' do
    it 'assigns the country code if name is valid' 


    it 'normalizes the country name' 


    it 'nullifies the country_code if name is invalid' 

  end

  context 'given country_code is passed' do
    it 'assigns the country_name if the code is valid' 


    it 'nullifies the country name if the code is invalid' 

  end

  context 'given country is passed' do
    it 'attempts to find a country with a matching country code' 


    it 'attempts to find a country with a matching country name' 

  end
end

