# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceAfterNot do
  subject(:cop) { described_class.new }

  it 'reports an offense for space after !' 


  it 'accepts no space after !' 


  it 'accepts space after not keyword' 


  it 'reports an offense for space after ! with the negated receiver ' \
     'wrapped in parentheses' do
    inspect_source('! (model)')

    expect(cop.messages)
      .to eq(['Do not leave space between `!` and its argument.'])
    expect(cop.highlights).to eq(['! (model)'])
  end

  context 'auto-correct' do
    it 'removes redundant space' 


    it 'keeps space after not keyword' 


    it 'removes redundant space when there is a parentheses' 

  end
end

