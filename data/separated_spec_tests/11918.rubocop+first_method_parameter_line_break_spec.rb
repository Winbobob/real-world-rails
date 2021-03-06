# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::FirstMethodParameterLineBreak do
  subject(:cop) { described_class.new }

  context 'params listed on the first line' do
    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  context 'params on first line of singleton method' do
    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  it 'ignores params listed on a single line' 


  it 'ignores params without parens' 


  it 'ignores single-line methods' 


  it 'ignores methods without params' 


  context 'params with default values' do
    it 'detects the offense' 


    it 'autocorrects the offense' 

  end
end

