# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::EmptyLineAfterMagicComment do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense for code that immediately follows comment' 


  it 'registers an offense for documentation immediately following comment' 


  it 'registers an offense when multiple magic comments without empty line' 


  it 'accepts code that separates the comment from the code with a newline' 


  it 'accepts an empty source file' 


  it 'accepts a source file with only a magic comment' 


  it 'autocorrects by adding a newline' 


  it 'autocorrects by adding a newline above the documentation' 

end

