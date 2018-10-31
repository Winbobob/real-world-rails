require_relative 'helper'

_version = 1

describe "test Pry defaults" do
  before do
    @str_output = StringIO.new
  end

  after do
    Pry.reset_defaults
    Pry.config.color = false
  end

  describe "input" do
    it 'should set the input default, and the default should be overridable' 


    it 'should pass in the prompt if readline arity is 1' 


    it 'should not pass in the prompt if the arity is 0' 


    it 'should not pass in the prompt if the arity is -1' 


  end

  it 'should set the output default, and the default should be overridable' 


  it "should set the print default, and the default should be overridable" 


  describe "pry return values" do
    it 'should return nil' 


    it 'should return the parameter given to exit-all' 


    it 'should return the parameter (multi word string) given to exit-all' 


    it 'should return the parameter (function call) given to exit-all' 


    it 'should return the parameter (self) given to exit-all' 

  end

  describe "prompts" do
    before do
      Pry.config.output = StringIO.new
    end

    def get_prompts(pry)
      a = pry.select_prompt
      pry.eval "["
      b = pry.select_prompt
      pry.eval "]"
      [a, b]
    end

    it 'should set the prompt default, and the default should be overridable (single prompt)' 


    it 'should set the prompt default, and the default should be overridable (multi prompt)' 


    describe 'storing and restoring the prompt' do
      before do
        make = lambda do |name,i|
          prompt = [ proc { "#{i}>" } , proc { "#{i+1}>" } ]
          (class << prompt; self; end).send(:define_method, :inspect) { "<Prompt-#{name}>" }
          prompt
        end
        @a , @b , @c = make[:a,0] , make[:b,1] , make[:c,2]
        @pry = Pry.new prompt: @a
      end
      it 'should have a prompt stack' 


      it 'should restore overridden prompts when returning from file-mode' 


      it '#pop_prompt should return the popped prompt' 


      it 'should not pop the last prompt' 


      describe '#prompt= should replace the current prompt with the new prompt' do
        it 'when only one prompt on the stack' 

        it 'when several prompts on the stack' 

      end
    end
  end

  describe "view_clip used for displaying an object in a truncated format" do
    DEFAULT_OPTIONS = {
      max_length: 60
    }
    MAX_LENGTH = DEFAULT_OPTIONS[:max_length]

    describe "given an object with an #inspect string" do
      it "returns the #<> format of the object (never use inspect)" 

    end

    describe "given the 'main' object" do
      it "returns the #to_s of main (special case)" 

    end

    describe "the list of prompt safe objects" do
      [1, 2.0, -5, "hello", :test].each do |o|
        it "returns the #inspect of the special-cased immediate object: #{o}" 

      end

      it "returns #<> format of the special-cased immediate object if #inspect is longer than maximum" 


      it "returns the #inspect of the custom prompt safe objects" 

    end

    describe "given an object with an #inspect string as long as the maximum specified" do
      it "returns the #<> format of the object (never use inspect)" 

    end

    describe "given a regular object with an #inspect string longer than the maximum specified" do

      describe "when the object is a regular one" do
        it "returns a string of the #<class name:object idish> format" 

      end

      describe "when the object is a Class or a Module" do
        describe "without a name (usually a c = Class.new)" do
          it "returns a string of the #<class name:object idish> format" 

        end

        describe "with a #name longer than the maximum specified" do
          it "returns a string of the #<class name:object idish> format" 

        end

        describe "with a #name shorter than or equal to the maximum specified" do
          it "returns a string of the #<class name:object idish> format" 

        end

      end

    end

  end

  describe 'quiet' do
    it 'should show whereami by default' 


    it 'should hide whereami if quiet is set' 

  end

  describe 'toplevel_binding' do
    it 'should be devoid of local variables' 


    it 'should have self the same as TOPLEVEL_BINDING' 


    it 'should define private methods on Object' 

  end

  it 'should set the hooks default, and the default should be overridable' 

end

