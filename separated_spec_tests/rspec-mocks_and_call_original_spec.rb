require 'delegate'

RSpec.describe "and_call_original" do
  context "on a partial double" do
    let(:klass) do
      Class.new do
        def meth_1
          :original
        end

        def meth_2(x)
          yield x, :additional_yielded_arg
        end

        def self.new_instance
          new
        end
      end
    end

    let(:instance) { klass.new }

    context "when a method that exists has been stubbed previously" do
      before { allow(instance).to receive(:meth_1).and_return(:override) }

      it 'restores the original behavior' 

    end

    context "when a non-existent method has been stubbed previously" do
      it 'restores the original NameError behavior' 

    end

    it 'passes the received message through to the original method' 


    it 'ignores prior declared stubs' 


    it 'passes args and blocks through to the original method' 


    it 'errors when you pass through the wrong number of args' 


    it 'warns when you override an existing implementation' 


    context "for singleton methods" do
      it 'works' 


      it 'works for SimpleDelegator subclasses', :if => (RUBY_VERSION.to_f > 1.8) do
        inst = Class.new(SimpleDelegator).new(1)
        def inst.foo; :bar; end
        expect(inst).to receive(:foo).and_call_original
        expect(inst.foo).to eq(:bar)
      end
    end

    it 'works for methods added through an extended module' 


    it "works for method added through an extended module onto a class's ancestor" 


    it "finds the method on the most direct ancestor even if the method " \
       "is available on more distant ancestors" do
      klass.extend Module.new { def foo; :klass_bar; end }
      sub_klass = Class.new(klass)
      sub_klass.extend Module.new { def foo; :sub_klass_bar; end }
      expect(sub_klass).to receive(:foo).and_call_original
      expect(sub_klass.foo).to eq(:sub_klass_bar)
    end

    it "finds the method on the most direct singleton class ancestors even if the method " \
       "is available on more distant ancestors" do
      klass.extend Module.new { def foo; :klass_bar; end }
      sub_klass = Class.new(klass) { def self.foo; :sub_klass_bar; end }
      sub_sub_klass = Class.new(sub_klass)
      expect(sub_sub_klass).to receive(:foo).and_call_original
      expect(sub_sub_klass.foo).to eq(:sub_klass_bar)
    end

    context 'when using any_instance' do
      it 'works for instance methods defined on the class' 


      it 'works for instance methods defined on the superclass of the class' 


      it 'works when mocking the method on one class and calling the method on an instance of a subclass' 

    end

    it 'works for class methods defined on a superclass' 


    context 'when a class method is stubbed in the superclass' do
      it 'still works for class methods defined on a superclass' 

    end

    it 'works for class methods defined on a grandparent class' 


    it 'works for class methods defined on the Class class' 


    it "works for instance methods defined on the object's class's superclass" 


    it 'works for aliased methods' 


    context 'on an object that defines method_missing' do
      before do
        klass.class_exec do
          private

          def method_missing(name, *args)
            if name.to_s == "greet_jack"
              "Hello, jack"
            else
              super
            end
          end
        end
      end

      it 'works when the method_missing definition handles the message' 


      it 'works for an any_instance partial mock' 


      it 'raises an error for an unhandled message for an any_instance partial mock' 


      it 'raises an error on invocation if method_missing does not handle the message' 

    end
  end

  context "on a partial double that overrides #method" do
    let(:request_klass) do
      Struct.new(:method, :url) do
        def perform
          :the_response
        end

        def self.method
          :some_method
        end
      end
    end

    let(:request) { request_klass.new(:get, "http://foo.com/bar") }

    it 'still works even though #method has been overridden' 


    it 'works for a singleton method' 

  end

  context "on a pure test double" do
    let(:instance) { double }

    it 'raises an error even if the double object responds to the message' 

  end
end

