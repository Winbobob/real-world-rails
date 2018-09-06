# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceAroundBlockParameters, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'common behavior' do
    it 'accepts an empty block' 


    it 'skips lambda without args' 


    it 'skips lambda without parens' 

  end

  context 'when EnforcedStyleInsidePipes is no_space' do
    let(:cop_config) { { 'EnforcedStyleInsidePipes' => 'no_space' } }

    include_examples 'common behavior'

    it 'accepts a block with spaces in the right places' 


    it 'accepts a block with parameters but no body' 


    it 'accepts a block parameter without preceding space' 


    it 'accepts a lambda with spaces in the right places' 


    it 'registers an offense for space before first parameter' 


    it 'registers an offense for space after last parameter' 


    it 'registers an offense for no space after closing pipe' 


    it 'registers an offense to a lambda for space before first parameter' 


    it 'registers an offense to a lambda for space after last parameter' 


    it 'accepts line break after closing pipe' 


    it 'registers an offense for multiple spaces before parameter' 


    context 'trailing comma' do
      it 'registers an offense for space after the last comma' 


      it 'accepts no space after the last comma' 

    end

    it 'auto-corrects offenses' 


    it 'auto-corrects offenses for a lambda' 

  end

  context 'when EnforcedStyleInsidePipes is space' do
    let(:cop_config) { { 'EnforcedStyleInsidePipes' => 'space' } }

    include_examples 'common behavior'

    it 'accepts a block with spaces in the right places' 


    it 'accepts a block with parameters but no body' 


    it 'accepts a block parameter without preceding space' 


    it 'accepts a lambda with spaces in the right places' 


    it 'registers an offense for no space before first parameter' 


    it 'registers an offense for no space after last parameter' 


    it 'registers an offense for extra space before first parameter' 


    it 'registers an offense for multiple spaces after last parameter' 


    it 'registers an offense for no space after closing pipe' 


    it 'registers an offense to a lambda for no space before first parameter' 


    it 'registers an offense to a lambda for no space after last parameter' 


    it 'registers an offense to a lambda for extra space' \
       'before first parameter' do
      expect_offense(<<-RUBY.strip_indent)
        ->(  x ) { puts x }
           ^ Extra space before first block parameter detected.
      RUBY
    end

    it 'registers an offense to a lambda for multiple spaces' \
       'after last parameter' do
      expect_offense(<<-RUBY.strip_indent)
        ->( x, y   ) { puts x }
                 ^^ Extra space after last block parameter detected.
      RUBY
    end

    it 'accepts line break after closing pipe' 


    it 'registers an offense for multiple spaces before parameter' 


    context 'trailing comma' do
      it 'accepts space after the last comma' 


      it 'registers an offense for no space after the last comma' 

    end

    it 'auto-corrects block arguments inside Hash#each' 


    it 'auto-corrects lambda args' 

  end
end

