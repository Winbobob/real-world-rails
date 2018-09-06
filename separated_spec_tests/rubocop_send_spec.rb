# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::Send do
  subject(:cop) { described_class.new }

  context 'with send' do
    context 'and with a receiver' do
      it 'registers an offense for an invocation with args' 


      it 'does not register an offense for an invocation without args' 

    end

    context 'and without a receiver' do
      it 'registers an offense for an invocation with args' 


      it 'does not register an offense for an invocation without args' 

    end
  end

  context 'with __send__' do
    context 'and with a receiver' do
      it 'does not register an offense for an invocation with args' 


      it 'does not register an offense for an invocation without args' 

    end

    context 'and without a receiver' do
      it 'does not register an offense for an invocation with args' 


      it 'does not register an offense for an invocation without args' 

    end
  end

  context 'with public_send' do
    context 'and with a receiver' do
      it 'does not register an offense for an invocation with args' 


      it 'does not register an offense for an invocation without args' 

    end

    context 'and without a receiver' do
      it 'does not register an offense for an invocation with args' 


      it 'does not register an offense for an invocation without args' 

    end
  end
end

