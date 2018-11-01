# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::InitialIndentation do
  subject(:cop) { described_class.new }

  it 'registers an offense for indented method definition' 


  it 'accepts unindented method definition' 


  context 'for a file with byte order mark' do
    it 'accepts unindented method call' 


    it 'registers an offense for indented method call' 


    it 'registers an offense for indented method call after comment' 

  end

  it 'accepts empty file' 


  it 'registers an offense for indented assignment disregarding comment' 


  it 'accepts unindented comment + assignment' 


  it 'auto-corrects indented method definition' 


  it 'auto-corrects indented assignment but not comment' 

end

