# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MinMax, :config do
  subject(:cop) { described_class.new(config) }

  context 'with an array literal containing calls to `#min` and `#max`' do
    context 'when the expression stands alone' do
      it 'registers an offense if the receivers match' 


      it 'does not register an offense if the receivers do not match' 


      it 'does not register an offense if there are additional elements' 


      it 'does not register an offense if the receiver is implicit' 


      it 'auto-corrects an offense to use `#minmax`' 

    end

    context 'when the expression is used in a parallel assignment' do
      it 'registers an offense if the receivers match' 


      it 'does not register an offense if the receivers do not match' 


      it 'does not register an offense if there are additional elements' 


      it 'does not register an offense if the receiver is implicit' 


      it 'auto-corrects an offense to use `#minmax`' 

    end

    context 'when the expression is used as a return value' do
      it 'registers an offense if the receivers match' 


      it 'does not register an offense if the receivers do not match' 


      it 'does not register an offense if there are additional elements' 


      it 'does not register an offense if the receiver is implicit' 


      it 'auto-corrects an offense to use `#minmax`' 

    end
  end
end

