# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ColonMethodDefinition do
  subject(:cop) { described_class.new }

  it 'accepts a class method defined using .' 


  context 'using self' do
    it 'registers an offense for a class method defined using ::' 


    it 'corrects :: to .' 

  end

  context 'using the class name' do
    it 'registers an offense for a class method defined using ::' 


    it 'corrects :: to .' 

  end
end

