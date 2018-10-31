# frozen_string_literal: true

require 'spec_helper'
require 'alchemy/shell'

module Alchemy
  # Class fixture
  class MyToDoList
    extend Shell
  end

  describe Shell do
    before { allow(MyToDoList).to receive(:puts) }

    describe '.todo' do
      it "should add given string as a todo by delegating to .add_todo" 

    end

    describe '.todos' do
      it "should be an Array" 

    end

    describe '.add_todo' do
      it "should add the given string to the .todos array" 

    end

    describe '.display_todos' do
      context 'if there are todos in the list' do
        before do
          allow(MyToDoList).to receive(:todos).and_return(['My first todo', 'My second todo'])
        end

        it "should log them" 


        it "should iterate through the todos with an index" 

      end

      context 'if there are todos in the list' do
        before do
          allow(MyToDoList).to receive(:todos).and_return([])
        end

        it "should not log anything" 

      end
    end

    describe '.log' do
      before { Alchemy::Shell.verbose! }

      context 'if the message type is "skip"' do
        it "the output color should be yellow and cleared again" 

      end

      context 'if the message type is "error"' do
        it "the output color should be yellow and cleared again" 

      end

      context 'if the message type is "message"' do
        it "the output color should just be cleared" 

      end

      context 'if no message type is given' do
        it "the output color should be green" 

      end
    end

    describe '.color' do
      context 'if given name is a constant of Thor::Shell::Color' do
        before do
          allow(Thor::Shell::Color).to receive(:const_defined?).and_return(true)
        end

        it "should call the constant" 

      end

      context 'if given name is not a defined constant of Thor::Shell::Color' do
        before do
          allow(Thor::Shell::Color).to receive(:const_defined?).and_return(false)
        end

        it "should return en empty string" 

      end
    end
  end
end

