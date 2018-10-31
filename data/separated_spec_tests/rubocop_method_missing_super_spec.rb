# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MethodMissingSuper do
  subject(:cop) { described_class.new }

  describe 'method_missing defined as an instance method' do
    it 'registers an offense when super is not called.' 


    it 'allows method_missing when super is called' 

  end

  describe 'method_missing defined as a class method' do
    it 'registers an offense when super is not called.' 


    it 'allows method_missing when super is called' 

  end
end

