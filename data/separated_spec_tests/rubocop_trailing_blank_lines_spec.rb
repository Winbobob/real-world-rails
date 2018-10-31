# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::TrailingBlankLines, :config do
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is final_newline' do
    let(:cop_config) { { 'EnforcedStyle' => 'final_newline' } }

    it 'accepts final newline' 


    it 'accepts an empty file' 


    it 'accepts final blank lines if they come after __END__' 


    it 'accepts final blank lines if they come after __END__ in empty file' 


    it 'registers an offense for multiple trailing blank lines' 


    it 'registers an offense for multiple blank lines in an empty file' 


    it 'registers an offense for no final newline after assignment' 


    it 'registers an offense for no final newline after block comment' 


    it 'auto-corrects unwanted blank lines' 


    it 'auto-corrects unwanted blank lines in an empty file' 


    it 'auto-corrects even if some lines have space' 

  end

  context 'when EnforcedStyle is final_blank_line' do
    let(:cop_config) { { 'EnforcedStyle' => 'final_blank_line' } }

    it 'registers an offense for final newline' 


    it 'registers an offense for multiple trailing blank lines' 


    it 'registers an offense for multiple blank lines in an empty file' 


    it 'registers an offense for no final newline' 


    it 'accepts final blank line' 


    it 'auto-corrects unwanted blank lines' 


    it 'auto-corrects unwanted blank lines in an empty file' 


    it 'auto-corrects missing blank line' 


    it 'auto-corrects missing newline' 

  end
end

