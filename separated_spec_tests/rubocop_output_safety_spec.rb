# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::OutputSafety do
  subject(:cop) { described_class.new }

  context 'when using `#safe_concat`' do
    it 'registers an offense' 


    it 'registers an offense when wrapped inside `#safe_join`' 


    context 'when using safe navigation operator', :ruby23 do
      it 'registers an offense' 

    end
  end

  context 'when using `#html_safe`' do
    it 'registers an offense for literal receiver and no argument' 


    it 'registers an offense for variable receiver and no argument' 


    it 'does not register an offense for variable receiver and arguments' 


    it 'does not register an offense without a receiver' 


    it 'registers an offense when used inside `#safe_join`' 


    it 'registers an offense when used inside `#safe_join` in other method' 


    context 'when using safe navigation operator', :ruby23 do
      it 'registers an offense for variable receiver and no argument' 

    end
  end

  context 'when using `#raw`' do
    it 'registers an offense with no receiver and a variable argument' 


    it 'registers an offense with no receiver and a literal argument' 


    it 'does not register an offense with a receiver' 


    it 'does not register an offense without arguments' 


    it 'does not reguster an offense with more than one argument' 


    it 'does not ergister an offense for comments' 


    it 'registers an offense when used inside `#safe_join`' 


    it 'registers an offense when used inside `#safe_join` in other method' 

  end
end

