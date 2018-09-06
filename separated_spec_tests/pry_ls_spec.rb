require_relative '../helper'

describe "ls" do
  describe "bug #1407" do
    it "behaves as usual when a method of the same name exists." 

  end

  describe "below ceiling" do
    it "should stop before Object by default" 


    it "should include object if -v is given" 


    it "should include super-classes by default" 


    it "should not include super-classes when -q is given" 

  end

  describe "help" do
    it 'should show help with -h' 

  end

  describe "BasicObject" do
    it "should work on BasicObject" 


    it "should work on subclasses of BasicObject" 

  end

  describe "immediates" do
    # Ruby 2.4+
    if 5.class.name == 'Integer'
      it "should work on Integer" 

    else
      it "should work on Fixnum" 

    end
  end

  describe "methods" do
    it "should show public methods by default" 


    it "should not show protected/private by default" 


    it "should show public methods with -p" 


    it "should show protected/private methods with -p" 


    it "should work for objects with an overridden method method" 


    it "should work for objects which instance_variables returns array of symbol but there is no Symbol#downcase" 


    it "should show error message when instance is given with -M option" 



    # see: https://travis-ci.org/pry/pry/jobs/5071918
    unless Pry::Helpers::BaseHelpers.rbx?
      it "should handle classes that (pathologically) define .ancestors" 

    end
  end

  describe 'with -l' do
    focus 'should find locals and sort by descending size' do
      result = pry_eval(Object.new, "aa = 'asdf'; bb = 'xyz'", 'ls -l')
      expect(result).not_to match(/=>/)
      expect(result).not_to match(/0x\d{5}/)
      expect(result).to match(/asdf.*xyz/m)
    end
    it 'should not list pry noise' 

  end

  describe "when inside Modules" do
    it "should still work" 


    it "should work for ivars" 


    it "should include instance methods by default" 


    it "should behave normally when invoked on Module itself" 

  end

  describe "constants" do
    it "works on top-level" 


    it "should show constants defined on the current module" 


    it "should not show constants defined on parent modules by default" 


    it "should show constants defined on ancestors with -v" 


    it "should not autoload constants!" 


    it "should show constants for an object's class regardless of mixins" 

  end

  describe "grep" do
    it "should reduce the number of outputted things" 


    it "should still output matching things" 

  end

  describe "when no arguments given" do
    describe "when at the top-level" do
      # rubinius has a bug that means local_variables of "main" aren't reported inside eval()
      unless Pry::Helpers::BaseHelpers.rbx?
        it "should show local variables" 

      end
    end

    describe "when in a class" do
      it "should show constants" 


      it "should show class variables" 


      it "should show methods" 

    end

    describe "when in an object" do
      it "should show methods" 


      it "should show instance variables" 

    end
  end

  if Pry::Helpers::BaseHelpers.jruby?
    describe 'on java objects' do
      it 'should omit java-esque aliases by default' 


      it 'should include java-esque aliases if requested' 

    end
  end
end

