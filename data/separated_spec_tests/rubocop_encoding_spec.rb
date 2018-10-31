# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::Encoding, :config do
  subject(:cop) { described_class.new(config) }

  it 'registers no offense when no encoding present' 


  it 'registers no offense when encoding present but not UTF-8' 


  it 'registers an offense when encoding present and UTF-8' 


  it 'registers an offense when encoding present on 2nd line after shebang' 


  it 'registers an offense for vim-style encoding comments' 


  it 'registers no offense when encoding is in the wrong place' 


  it 'registers an offense for encoding inserted by magic_encoding gem' 


  context 'auto-correct' do
    it 'removes encoding comment on first line' 

  end
end

