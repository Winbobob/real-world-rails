require_relative '../helper'

describe 'cd' do
  before do
    @o, @obj = Object.new, Object.new
    @obj.instance_variable_set(:@x, 66)
    @obj.instance_variable_set(:@y, 79)
    @o.instance_variable_set(:@obj, @obj)

    @t = pry_tester(@o) do
      def mapped_binding_stack
        binding_stack.map { |b| b.eval('self') }
      end

      def binding_stack
        pry.binding_stack.dup
      end

      def command_state
        pry.command_state["cd"]
      end

      def old_stack
        pry.command_state['cd'].old_stack.dup
      end
    end
  end

  describe 'state' do
    it 'should not to be set up in fresh instance' 

  end

  describe 'old stack toggling with `cd -`' do
    describe 'in fresh pry instance' do
      it 'should not toggle when there is no old stack' 

    end

    describe 'when an error was raised' do
      it 'should not toggle and should keep correct stacks' 

    end

    describe 'when using simple cd syntax' do
      it 'should toggle' 

    end

    describe "when using complex cd syntax" do
      it 'should toggle with a complex path (simple case)' 


      it 'should toggle with a complex path (more complex case)' 

    end

    describe 'series of cd calls' do
      it 'should toggle with fuzzy `cd -` calls' 

    end

    describe 'when using cd ..' do
      it 'should toggle with a simple path' 


      it 'should toggle with a complex path' 

    end

    describe 'when using cd ::' do
      it 'should toggle' 

    end

    describe 'when using cd /' do
      it 'should toggle' 

    end

    describe 'when using ^D (Control-D) key press' do
      it 'should keep correct old binding' 

    end
  end

  it 'should cd into simple input' 


  it 'should break out of session with cd ..' 


  it "should not leave the REPL session when given 'cd ..'" 


  it 'should break out to outer-most session with cd /' 


  it 'should break out to outer-most session with just cd (no args)' 


  it 'should cd into an object and its ivar using cd obj/@ivar syntax' 


  it 'should cd into an object and its ivar using cd obj/@ivar/ syntax (note following /)' 


  it 'should cd into previous object and its local using cd ../local syntax' 


  it 'should cd into an object and its ivar and back again using cd obj/@ivar/.. syntax' 


  it 'should cd into an object and its ivar and back and then into another ivar using cd obj/@ivar/../@y syntax' 


  it 'should cd back to top-level and then into another ivar using cd /@ivar/ syntax' 


  it 'should start a session on TOPLEVEL_BINDING with cd ::' 


  it 'should cd into complex input (with spaces)' 


  it 'should not cd into complex input when it encounters an exception' 


  it 'can cd into an expression containing a string with slashes in it' 


  it 'can cd into an expression with division in it' 


  # Regression test for ticket #516.
  it 'should be able to cd into the Object BasicObject' 

end

