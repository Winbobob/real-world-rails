# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::ConditionPosition do
  subject(:cop) { described_class.new }

  %w[if unless while until].each do |keyword|
    it 'registers an offense for condition on the next line' 


    it 'accepts condition on the same line' 


    it 'accepts condition on a different line for modifiers' 

  end

  it 'registers an offense for elsif condition on the next line' 


  it 'handles ternary ops' 

end

