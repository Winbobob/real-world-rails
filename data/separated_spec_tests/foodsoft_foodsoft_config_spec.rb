require_relative '../spec_helper'

describe FoodsoftConfig do
  let(:name) { Faker::Lorem.words(rand(2..4)).join(' ') }
  let(:other_name) { Faker::Lorem.words(rand(2..4)).join(' ') }

  it 'returns a default value' 


  it 'returns an empty default value' 


  it 'returns a configuration value' 


  it 'can set a configuration value' 


  it 'can override a configuration value' 


  it 'cannot set a default protected value' 


  it 'can unprotect a default protected value' 


  describe 'can protect a value', type: :feature do
    before do
      FoodsoftConfig.config[:protected][:name] = true
    end

    it 'can protect a value' 


    it 'and unprotect it again' 

  end

  it 'can protect all values' 


  it 'can whitelist a value' 


  describe 'has indifferent access', type: :feature do
    it 'with symbol' 


    it 'with string' 


    it 'with nested symbol' 


    it 'with nested string' 

  end

end

