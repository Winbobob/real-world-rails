require_relative 'helper'

describe Pry::DEFAULT_CONTROL_D_HANDLER do

  describe "control-d press" do

    before do
      # Simulates a ^D press.
      @control_d = "Pry::DEFAULT_CONTROL_D_HANDLER.call('', _pry_)"
    end

    describe "in an expression" do
      it "should clear out passed string" 

    end

    describe 'at top-level session' do
      it 'should break out of a REPL loop' 

    end

    describe 'in a nested session' do
      it 'should pop last binding from the binding stack' 


      it "breaks out of the parent session" 

    end

  end

end

