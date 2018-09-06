require_relative 'helper'

describe Pry do
  before do
    @str_output = StringIO.new
  end

  describe ".configure" do
    it "yields a block with Pry.config as its argument" 

  end

  describe "Exotic object support" do
    # regression test for exotic object support
    it "Should not error when return value is a BasicObject instance" 

  end

  describe 'DISABLE_PRY' do
    before do
      ENV['DISABLE_PRY'] = 'true'
    end

    after do
      ENV.delete 'DISABLE_PRY'
    end

    it 'should not binding.pry' 


    it 'should not Pry.start' 

  end

  describe 'FAIL_PRY' do
    before do
      ENV['FAIL_PRY'] = 'true'
    end

    after do
      ENV.delete 'FAIL_PRY'
    end

    it 'should raise an error for binding.pry' 


    it 'should raise an error for Pry.start' 

  end

  describe "Pry.critical_section" do
    it "should prevent Pry being called" 

  end

  describe "Pry.binding_for" do

    # regression test for burg's bug (see git history)
    it "Should not error when object doesn't have a valid == method" 


    it "should not leak local variables" 


    it "should work on frozen objects" 

  end

  describe "#last_exception=" do
    before do
      @pry = Pry.new binding: binding
      @e = mock_exception "foo.rb:1"
    end

    it "returns an instance of Pry::LastException" 


    it "returns a frozen exception" 


    it "returns an object who mirrors itself as the wrapped exception" 

  end

  describe "open a Pry session on an object" do
    describe "rep" do
      before do
        class Hello
        end
      end

      after do
        Object.send(:remove_const, :Hello)
      end

      # bug fix for https://github.com/pry/pry/issues/93
      it 'should not leak pry constants into Object namespace' 


      it 'should be able to operate inside the BasicObject class' 


      it 'should set an ivar on an object' 


      it 'should display error if Pry instance runs out of input' 


      it 'should make self evaluate to the receiver of the rep session' 


      it 'should define a nested class under Hello and not on top-level or Pry' 


      it 'should suppress output if input ends in a ";" and is an Exception object (single line)' 


      it 'should suppress output if input ends in a ";" (single line)' 


      it 'should be able to evaluate exceptions normally' 


      it 'should notice when exceptions are raised' 


      it 'should not try to catch intended exceptions' 


      describe "multi-line input" do
        it "works" 


        it 'should suppress output if input ends in a ";" (multi-line)' 


        describe "newline stripping from an empty string" do
          it "with double quotes" 


          it "with single quotes" 


          it "with fancy delimiters" 

        end

        describe "newline stripping from an empty regexp" do
          it "with regular regexp delimiters" 


          it "with fancy delimiters" 

        end

        describe "newline from an empty heredoc" do
          it "works" 

        end
      end
    end

    describe "repl" do
      describe "basic functionality" do
        it 'should set an ivar on an object and exit the repl' 

      end

      describe "complete_expression?" do
        it "should not mutate the input!" 

      end

      describe "history arrays" do
        it 'sets _ to the last result' 


        it 'sets out to an array with the result' 


        it 'sets _in_ to an array with the entered lines' 


        it 'uses 100 as the size of _in_ and _out_' 


        it 'can change the size of the history arrays' 


        it 'store exceptions' 

      end

      describe "last_result" do
        it "should be set to the most recent value" 


        # This test needs mock_pry because the command retvals work by
        # replacing the eval_string, so _ won't be modified without Pry doing
        # a REPL loop.
        it "should be set to the result of a command with :keep_retval" 


        it "should be preserved over an empty line" 


        it "should be preserved when evalling a  command without :keep_retval" 

      end

      describe "nesting" do
        after do
          Pry.reset_defaults
          Pry.config.color = false
        end

        it 'should nest properly' 

      end

      describe "defining methods" do
        it 'should define a method on the singleton class of an object when performing "def meth;end" inside the object' 


        it 'should define an instance method on the module when performing "def meth;end" inside the module' 


        it 'should define an instance method on the class when performing "def meth;end" inside the class' 


        it 'should define a method on the class of an object when performing "def meth;end" inside an immediate value or Numeric' 

      end

      describe "Object#pry" do

        after do
          Pry.reset_defaults
          Pry.config.color = false
        end

        it "should start a pry session on the receiver (first form)" 


        it "should start a pry session on the receiver (second form)" 


        it "should raise if more than two arguments are passed to Object#pry" 

      end

      describe "Pry.binding_for" do
        it 'should return TOPLEVEL_BINDING if parameter self is main' 

      end
    end
  end

  describe 'setting custom options' do
    it 'does not raise for unrecognized options' 


    it 'correctly handles the :quiet option (#1261)' 

  end

  describe "a fresh instance" do
    it "should use `caller` as its backtrace" 

  end
end

