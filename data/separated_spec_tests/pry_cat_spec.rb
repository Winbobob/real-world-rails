require_relative '../helper'

describe "cat" do
  before do
    @str_output = StringIO.new

    @t = pry_tester do
      def insert_nil_input
        @pry.update_input_history(nil)
      end

      def last_exception=(e)
        @pry.last_exception = e
      end
    end
  end

  describe "when invoked without arguments" do
    it 'should display an error message' 

  end

  describe "on receiving a file that does not exist" do
    it 'should display an error message' 

  end

  describe "with --in" do
    it 'should display the last few expressions with indices' 

  end

  describe "with --in 1" do
    it 'should display the first expression with no index' 

  end

  describe "with --in -1" do
    it 'should display the last expression with no index' 

  end

  describe "with --in 1..2" do
    it 'should display the given range with indices, omitting nils' 

  end

  # this doesnt work so well on rbx due to differences in backtrace
  # so we currently skip rbx until we figure out a workaround
  describe "with --ex" do
    before do
      @o = Object.new

      # this is to test exception code (cat --ex)
      def @o.broken_method
        this method is broken
      end
    end

    if !Pry::Helpers::BaseHelpers.rbx?
      it 'cat --ex should display repl code that generated exception' 


      it 'cat --ex should correctly display code that generated exception' 

    end
  end

  describe "with --ex N" do
    it 'should cat first level of backtrace when --ex used with no argument ' 


    it 'should cat first level of backtrace when --ex 0 used ' 


    it 'should cat second level of backtrace when --ex 1 used ' 


    it 'should cat third level of backtrace when --ex 2 used' 


    it 'should show error when backtrace level out of bounds' 


    it 'each successive cat --ex should show the next level of backtrace, and going past the final level should return to the first' 

  end
end

