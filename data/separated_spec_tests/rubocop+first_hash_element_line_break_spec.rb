# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::FirstHashElementLineBreak do
  subject(:cop) { described_class.new }

  context 'elements listed on the first line' do
    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  context 'hash nested in a method call' do
    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  it 'ignores implicit hashes in method calls with parens' 


  it 'ignores implicit hashes in method calls without parens' 


  it 'ignores implicit hashes in method calls that are improperly formatted' 


  it 'ignores elements listed on a single line' 

end

