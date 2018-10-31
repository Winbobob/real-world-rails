require "spec_helper"

RSpec.describe "the spy family of methods" do
  describe "spy" do
    it "responds to arbitrary methods" 


    it "takes a name" 


    it "records called methods" 


    it "takes a hash of method names and return values" 


    it "takes a name and a hash of method names and return values" 

  end

  shared_examples_for "a verifying spy with a foo method" do
    it "responds to methods on the verified object" 


    it "does not respond to methods that are not on the verified object" 


    it "records called methods" 


    it 'fails fast when `have_received` is passed an undefined method name' 


    it 'fails fast when negative `have_received` is passed an undefined method name' 

  end

  describe "instance_spy" do
    context "when passing a class object" do
      let(:the_class) do
        Class.new do
          def foo
            3
          end
        end
      end

      subject { instance_spy(the_class) }

      it_behaves_like "a verifying spy with a foo method"

      it "takes a class and a hash of method names and return values" 

    end

    context "passing a class by string reference" do
      DummyClass = Class.new do
        def foo
          3
        end
      end

      let(:the_class) { "DummyClass" }

      subject { instance_spy(the_class) }

      it_behaves_like "a verifying spy with a foo method"

      it "takes a class name string and a hash of method names and return values" 

    end
  end

  describe "object_spy" do
    let(:the_class) do
      Class.new do
        def foo
          3
        end
      end
    end

    let(:the_instance) { the_class.new }

    subject { object_spy(the_instance) }

    it_behaves_like "a verifying spy with a foo method"

    it "takes an instance and a hash of method names and return values" 

  end

  describe "class_spy" do
    let(:the_class) do
      Class.new do
        def self.foo
          3
        end
      end
    end

    subject { class_spy(the_class) }

    it_behaves_like "a verifying spy with a foo method"

    it "takes a class and a hash of method names and return values" 

  end
end

