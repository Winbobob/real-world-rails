# frozen_string_literal: true

RSpec.describe RuboCop::Cop::InternalAffairs::RedundantLocationArgument do
  subject(:cop) { described_class.new }

  context 'when location argument is passed' do
    context 'when location argument is :expression' do
      it 'registers an offense' 


      context 'when there is a message argument' do
        it 'registers an offense' 

      end

      it 'removes default `location` when there are no other keywords' 


      it 'removes default `location` when preceded by another keyword' 


      it 'removes default `location` when followed by another keyword' 


      it 'removes default `location` surrounded by other keywords' 

    end

    context 'when location argument does not equal to :expression' do
      it 'does not register an offense' 

    end
  end

  context 'when location argument is not passed' do
    it 'does not register an offense' 

  end
end

