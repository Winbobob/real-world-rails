# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::FirstMethodArgumentLineBreak do
  subject(:cop) { described_class.new }

  context 'args listed on the first line' do
    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  context 'hash arg spanning multiple lines' do
    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  context 'hash arg without a line break before the first pair' do
    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  it 'ignores arguments listed on a single line' 


  it 'ignores arguments without parens' 


  it 'ignores methods without arguments' 

end

