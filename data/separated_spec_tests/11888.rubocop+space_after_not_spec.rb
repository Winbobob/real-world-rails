# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceAfterNot do
  subject(:cop) { described_class.new }

  it 'reports an offense for space after !' 


  it 'accepts no space after !' 


  it 'accepts space after not keyword' 


  it 'reports an offense for space after ! with the negated receiver ' \
     'wrapped in parentheses' do
    expect_offense(<<-RUBY.strip_indent)
      ! (model)
      ^^^^^^^^^ Do not leave space between `!` and its argument.
    RUBY
  end

  context 'auto-correct' do
    it 'removes redundant space' 


    it 'keeps space after not keyword' 


    it 'removes redundant space when there is a parentheses' 

  end
end

