# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::TrailingWhitespace, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'AllowInHeredoc' => false } }

  it 'registers an offense for a line ending with space' 


  it 'registers an offense for a blank line with space' 


  it 'registers an offense for a line ending with tab' 


  it 'registers an offense for trailing whitespace in a heredoc string' 


  it 'registers offenses before __END__ but not after' 


  it 'is not fooled by __END__ within a documentation comment' 


  it 'is not fooled by heredoc containing __END__' 


  it 'is not fooled by heredoc containing __END__ within a doc comment' 


  it 'accepts a line without trailing whitespace' 


  it 'auto-corrects unwanted space' 


  context 'when `AllowInHeredoc` is set to true' do
    let(:cop_config) { { 'AllowInHeredoc' => true } }

    it 'accepts trailing whitespace in a heredoc string' 


    it 'registers an offence for trailing whitespace at the heredoc begin' 

  end
end

