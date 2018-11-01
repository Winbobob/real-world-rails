require_relative 'helper'
require 'set'

describe Pry::Method do
  it "should use String names for compatibility" 


  describe ".from_str" do
    it 'should look up instance methods if no methods available and no options provided' 


    it 'should look up methods if no instance methods available and no options provided' 


    it 'should look up instance methods first even if methods available and no options provided' 


    it 'should look up instance methods if "instance-methods"  option provided' 


    it 'should look up methods if :methods  option provided' 


    it 'should look up instance methods using the Class#method syntax' 


    it 'should look up methods using the object.method syntax' 


    it 'should NOT look up instance methods using the Class#method syntax if no instance methods defined' 


    it 'should NOT look up methods using the object.method syntax if no methods defined' 


    it 'should look up methods using klass.new.method syntax' 


    it 'should take care of corner cases like mongo[] e.g Foo::Bar.new[]- issue 998' 


    it 'should take care of cases like $ mongo[] - issue 998' 


    it 'should look up instance methods using klass.meth#method syntax' 


    it 'should look up methods using instance::bar syntax' 


    it 'should not raise an exception if receiver does not exist' 

  end

  describe '.from_binding' do
    it 'should be able to pick a method out of a binding' 


    it 'should NOT find a method from the toplevel binding' 


    it "should find methods that have been undef'd" 


    it 'should find the super method correctly' 


    it 'should find the right method if a super method exists' 


    it "should find the right method from a BasicObject" 


    it 'should find the right method even if it was renamed and replaced' 

  end

  describe 'super' do
    it 'should be able to find the super method on a bound method' 


    it 'should be able to find the super method of an unbound method' 


    it 'should return nil if no super method exists' 


    it 'should be able to find super methods defined on modules' 


    it 'should be able to find super methods defined on super-classes when there are modules in the way' 


    it 'should be able to jump up multiple levels of bound method, even through modules' 

  end

  describe 'all_from_class' do
    def should_find_method(name)
      expect(Pry::Method.all_from_class(@class).map(&:name)).to include name
    end

    it 'should be able to find public instance methods defined in a class' 


    it 'should be able to find private and protected instance methods defined in a class' 


    it 'should find methods all the way up to Kernel' 


    it 'should be able to find instance methods defined in a super-class' 


    it 'should be able to find instance methods defined in modules included into this class' 


    it 'should be able to find instance methods defined in modules included into super-classes' 


    it 'should attribute overridden methods to the sub-class' 


    it 'should be able to find methods defined on a singleton class' 


    it 'should be able to find methods on super-classes when given a singleton class' 

  end

  describe 'all_from_obj' do
    describe 'on normal objects' do
      def should_find_method(name)
        expect(Pry::Method.all_from_obj(@obj).map(&:name)).to include name
      end

      it "should find methods defined in the object's class" 


      it "should find methods defined in modules included into the object's class" 


      it "should find methods defined in the object's singleton class" 


      it "should find methods in modules included into the object's singleton class" 


      it "should find methods all the way up to Kernel" 


      it "should not find methods defined on the classes singleton class" 


      it "should work in the face of an overridden send" 

    end

    describe 'on classes' do
      def should_find_method(name)
        expect(Pry::Method.all_from_obj(@class).map(&:name)).to include name
      end

      it "should find methods defined in the class' singleton class" 


      it "should find methods defined on modules extended into the class" 


      it "should find methods defined on the singleton class of super-classes" 


      it "should not find methods defined within the class" 


      it "should find methods defined on Class" 


      it "should find methods defined on Kernel" 


      it "should attribute overridden methods to the sub-class' singleton class" 


      it "should attrbute overridden methods to the class not the module" 


      it "should attribute overridden methods to the relevant singleton class in preference to Class" 

    end

    describe 'method resolution order' do
      module LS
        class Top; end

        class Next < Top; end

        module M; end
        module N; include M; end
        module O; include M; end
        module P; end

        class Low < Next; include N; include P; end
        class Lower < Low; extend N; end
        class Bottom < Lower; extend O; end
      end


      def eigen_class(obj); class << obj; self; end; end

      it "should look at a class and then its superclass" 


      it "should include the included modules between a class and its superclass" 


      it "should not include modules extended into the class" 


      it "should include included modules for Modules" 


      it "should include the singleton class of objects" 


      it "should not include singleton classes of numbers" 


      it "should include singleton classes for classes" 


      it "should include modules included into singleton classes" 


      it "should include modules at most once" 


      it "should include modules at the point which they would be reached" 


      it "should include the Pry::Method.instance_resolution_order of Class after the singleton classes" 

    end
  end

  describe 'method_name_from_first_line' do
    it 'should work in all simple cases' 

  end

  describe 'method aliases' do
    before do
      @class = Class.new {
        def eat
        end

        alias fress eat
        alias_method :omnomnom, :fress

        def eruct
        end
      }
    end

    it 'should be able to find method aliases' 


    it 'should return an empty Array if cannot find aliases' 


    it 'should not include the own name in the list of aliases' 


    it 'should find aliases for top-level methods' 


    it 'should be able to find aliases for methods implemented in C' 

  end

  describe '.signature' do
    before do
      @class = Class.new {
        def self.standard_arg(arg) end

        def self.block_arg(&block) end

        def self.rest(*splat) end

        def self.optional(option=nil) end
      }
    end

    it 'should print the name of regular args' 


    it 'should print the name of block args, with an & label' 


    it 'should print the name of additional args, with an * label' 


    it 'should print the name of optional args, with =? after the arg name' 


    # keyword args are only on >= Ruby 2.1
    if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.1")
      it 'should print the name of keyword args, with :? after the arg name' 


      it 'should print the name of keyword args, with : after the arg name' 

    end
  end
end

