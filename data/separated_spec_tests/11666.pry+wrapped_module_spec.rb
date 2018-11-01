require_relative 'helper'

describe Pry::WrappedModule do

  describe "#initialize" do
    it "should raise an exception when a non-module is passed" 

  end

  describe "candidates" do
    class Host
      %w(spec/fixtures/candidate_helper1.rb
         spec/fixtures/candidate_helper2.rb).each do |file|
        binding.eval File.read(file), file, 1
      end

      # rank 2
      class CandidateTest
        def test6
        end
      end

      class PitifullyBlank
        DEFAULT_TEST = CandidateTest
      end

      FOREVER_ALONE_LINE = __LINE__ + 1
      class ForeverAlone
        class DoublyNested
          # nested docs
          class TriplyNested
            def nested_method
            end
          end
        end
      end
    end

    describe "number_of_candidates" do
      it 'should return the correct number of candidates' 


      it 'should return 0 candidates for a class with no nested modules or methods' 


      it 'should return 1 candidate for a class with a nested module with methods' 

    end

    describe "ordering of candidates" do
      it 'should return class with largest number of methods as primary candidate' 


      it 'should return class with second largest number of methods as second ranked candidate' 


      it 'should return class with third largest number of methods as third ranked candidate' 


      it 'should raise when trying to access non-existent candidate' 

    end

    describe "source_location" do
      it 'should return primary candidates source_location by default' 


      it 'should return the location of the outer module if an inner module has methods' 


      it 'should return nil if no source_location can be found' 

    end

    describe "source" do
      it 'should return primary candidates source by default' 


      it 'should return source for highest ranked candidate' 


      it 'should return source for second ranked candidate' 


      it 'should return source for third ranked candidate' 


      it 'should return source for deeply nested class' 

    end

    describe "doc" do
      it 'should return primary candidates doc by default' 


      it 'should return doc for highest ranked candidate' 


      it 'should return doc for second ranked candidate' 


      it 'should return doc for third ranked candidate' 


      it 'should return docs for deeply nested class' 

    end
  end

  describe ".method_prefix" do
    before do
      Foo = Class.new
      @foo = Foo.new
    end

    after do
      Object.remove_const(:Foo)
    end

    it "should return Foo# for normal classes" 


    it "should return Bar# for modules" 


    it "should return Foo. for singleton classes of classes" 


    example "of singleton classes of objects" do
      expect(Pry::WrappedModule.new(class << @foo; self; end).method_prefix).to eq "self."
    end

    example "of anonymous classes should not be empty" do
      expect(Pry::WrappedModule.new(Class.new).method_prefix).to match(/#<Class:.*>#/)
    end

    example "of singleton classes of anonymous classes should not be empty" do
      expect(Pry::WrappedModule.new(class << Class.new; self; end).method_prefix).to match(/#<Class:.*>./)
    end
  end

  describe ".singleton_class?" do
    it "should be true for singleton classes" 


    it "should be false for normal classes" 


    it "should be false for modules" 

  end

  describe ".singleton_instance" do
    it "should raise an exception when called on a non-singleton-class" 


    it "should return the attached object" 

  end

  describe ".super" do
    describe "receiver is a class" do
      before do
        @a = Class.new
        @m = Module.new
        @b = Class.new(@a)
        @b.send(:include, @m)
        @c = Class.new(@b)
      end

      it 'should return superclass for a wrapped class' 


      it 'should return nth superclass for a wrapped class' 


      it 'should ignore modules when retrieving nth superclass' 


      it 'should return nil when no nth superclass exists' 


      it 'should return self when .super(0) is used' 

    end

    describe "receiver is a module" do
      before do
        @m1 = Module.new
        @m2 = Module.new.tap { |v| v.send(:include, @m1) }
        @m3 = Module.new.tap { |v| v.send(:include, @m2) }
      end

      it 'should not ignore modules when retrieving supers' 


      it 'should retrieve nth super' 


      it 'should return self when .super(0) is used' 

    end
  end

  describe ".from_str" do
    before do
      class Namespace
        remove_const :Value if defined? Value
        Value = Class.new
      end
    end

    it 'should lookup a constant' 


    it 'should lookup a local' 


    it 'should lookup an ivar' 

  end
end

