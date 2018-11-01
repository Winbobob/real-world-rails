# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Badge do
  subject(:badge) { described_class.new('Test', 'ModuleMustBeAClassCop') }

  it 'exposes department name' 


  it 'exposes cop name' 


  describe '.parse' do
    it 'parses Department/CopName syntax' 


    it 'parses unqualified badge references' 

  end

  describe '.for' do
    it 'parses cop class name' 

  end

  it 'compares by value' 


  it 'can be converted to a string with the Department/CopName format' 


  describe '#qualified?' do
    it 'says `CopName` is not qualified' 


    it 'says `Department/CopName` is qualified' 

  end
end

