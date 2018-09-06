# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::ReadWriteAttribute do
  subject(:cop) { described_class.new }

  context 'read_attribute' do
    it 'registers an offense' 


    it 'registers no offense with explicit receiver' 

  end

  context 'write_attribute' do
    it 'registers an offense' 


    it 'registers no offense with explicit receiver' 

  end

  describe '#autocorrect' do
    context 'write_attribute' do
      it 'autocorrects symbol' 


      it 'autocorrects string' 


      it 'autocorrects without parentheses' 


      it 'autocorrects expression' 


      it 'autocorrects multiline' 

    end

    context 'read_attribute' do
      it 'autocorrects symbol' 


      it 'autocorrects string' 


      it 'autocorrects without parentheses' 


      it 'autocorrects expression' 


      it 'autocorrects multiline' 

    end
  end
end

