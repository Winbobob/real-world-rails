require "spec_helper"
require "singleton"

describe Docile do

  describe ".dsl_eval" do

    context "when DSL context object is an Array" do
      let(:array) { [] }
      let!(:result) { execute_dsl_against_array }

      def execute_dsl_against_array
        Docile.dsl_eval(array) do
          push 1
          push 2
          pop
          push 3
        end
      end

      it "executes the block against the DSL context object" 


      it "returns the DSL object after executing block against it" 


      it "doesn't proxy #__id__" 


      it "raises NoMethodError if the DSL object doesn't implement the method" 

    end

    Pizza = Struct.new(:cheese, :pepperoni, :bacon, :sauce)

    class PizzaBuilder
      def cheese(v=true);    @cheese    = v; end
      def pepperoni(v=true); @pepperoni = v; end
      def bacon(v=true);     @bacon     = v; end
      def sauce(v=nil);      @sauce     = v; end
      def build
        Pizza.new(!!@cheese, !!@pepperoni, !!@bacon, @sauce)
      end
    end

    context "when DSL context object is a Builder pattern" do
      let(:builder) { PizzaBuilder.new }
      let(:result) { execute_dsl_against_builder_and_call_build }

      def execute_dsl_against_builder_and_call_build
        @sauce = :extra
        Docile.dsl_eval(builder) do
          bacon
          cheese
          sauce @sauce
        end.build
      end

      it "returns correctly built object" 

    end

    class InnerDSL
      def initialize; @b = "b"; end
      attr_accessor :b
    end

    class OuterDSL
      def initialize; @a = "a"; end
      attr_accessor :a

      def inner(&block)
        Docile.dsl_eval(InnerDSL.new, &block)
      end

      def inner_with_params(param, &block)
        Docile.dsl_eval(InnerDSL.new, param, :foo, &block)
      end
    end

    def outer(&block)
      Docile.dsl_eval(OuterDSL.new, &block)
    end

    context "when given parameters for the DSL block" do
      def parameterized(*args, &block)
        Docile.dsl_eval(OuterDSL.new, *args, &block)
      end

      it "passes parameters to the block" 


      it "finds parameters before methods" 


      it "find outer dsl parameters in inner dsl scope" 

    end

    context "when block's context has helper methods which call DSL methods" do
      class BlockContextWithHelperMethods
        def initialize(array_as_dsl)
          @array_as_dsl = array_as_dsl
        end

        # Classic dynamic programming factorial, using the methods of {Array}
        # as a DSL to implement it, via helper methods {#calculate_factorials}
        # and {#save_factorials} which are defined in this class, so therefore
        # outside the block.
        def factorial_as_dsl_against_array(n)
          Docile.dsl_eval(@array_as_dsl) { calculate_factorials(n) }.last
        end

        # Uses the helper method {#save_factorials} below.
        def calculate_factorials(n)
          (2..n).each { |i| save_factorial(i) }
        end

        # Uses the methods {Array#push} and {Array#at} as a DSL from a helper
        # method defined in the block's context. Successfully calling this
        # proves that we can find helper methods from outside the block, and
        # then find DSL methods from inside those helper methods.
        def save_factorial(i)
          push(i * at(i - 1))
        end
      end

      subject { context.method(:factorial_as_dsl_against_array) }

      let(:context) { BlockContextWithHelperMethods.new(array_as_dsl) }

      let(:array_as_dsl) { [1, 1] }

      it "finds DSL methods within helper method defined in block's context" 


      it "removes fallback instrumentation from the DSL object after block" 


      it "removes method to remove fallbacl from the DSL object after block" 


      context "when helper methods call methods that are undefined" do
        let(:array_as_dsl) { "not an array" }

        it "raises NoMethodError" 


        it "removes fallback instrumentation from the DSL object after block" 

      end
    end

    context "when DSL have NoMethod error inside" do
      class DSLWithNoMethod
        def initialize(b); @b = b; end
        attr_accessor :b
        def push_element
          @b.push 1
        end
      end

      it "raise NoMethodError error from nil" 

    end

    context "when DSL blocks are nested" do

      context "method lookup" do
        it "finds method of outer dsl in outer dsl scope" 


        it "finds method of inner dsl in inner dsl scope" 


        it "finds method of outer dsl in inner dsl scope" 


        it "finds method of block's context in outer dsl scope" 


        it "finds method of block's context in inner dsl scope" 


        it "finds method of outer dsl in preference to block context" 

      end

      context "local variable lookup" do
        it "finds local variable from block context in outer dsl scope" 


        it "finds local variable from block definition in inner dsl scope" 

      end

      context "instance variable lookup" do
        it "finds instance variable from block definition in outer dsl scope" 


        it "proxies instance variable assignments in block in outer dsl scope back into block's context" 


        it "finds instance variable from block definition in inner dsl scope" 


        it "proxies instance variable assignments in block in inner dsl scope back into block's context" 

      end

    end

    context "when DSL context object is a Dispatch pattern" do
      class DispatchScope
        def params
          { :a => 1, :b => 2, :c => 3 }
        end
      end

      class MessageDispatch
        include Singleton

        def initialize
          @responders = {}
        end

        def add_responder path, &block
          @responders[path] = block
        end

        def dispatch path, request
          Docile.dsl_eval(DispatchScope.new, request, &@responders[path])
        end
      end

      def respond(path, &block)
        MessageDispatch.instance.add_responder(path, &block)
      end

      def send_request(path, request)
        MessageDispatch.instance.dispatch(path, request)
      end

      it "dispatches correctly" 


    end

  end

  describe ".dsl_eval_with_block_return" do
    let(:array) { [] }
    let!(:result) { execute_dsl_against_array }

    def execute_dsl_against_array
      Docile.dsl_eval_with_block_return(array) do
        push 1
        push 2
        pop
        push 3
        "Return me!"
      end
    end

    it "executes the block against the DSL context object" 


    it "returns the block's return value" 

  end

  describe ".dsl_eval_immutable" do

    context "when DSL context object is a frozen String" do
      let(:original) { "I'm immutable!".freeze }
      let!(:result) { execute_non_mutating_dsl_against_string }

      def execute_non_mutating_dsl_against_string
        Docile.dsl_eval_immutable(original) do
          reverse
          upcase
        end
      end

      it "doesn't modify the original string" 


      it "chains the commands in the block against the DSL context object" 

    end

    context "when DSL context object is a number" do
      let(:original) { 84.5 }
      let!(:result) { execute_non_mutating_dsl_against_number }

      def execute_non_mutating_dsl_against_number
        Docile.dsl_eval_immutable(original) do
          fdiv(2)
          floor
        end
      end

      it "chains the commands in the block against the DSL context object" 

    end
  end

end

describe Docile::FallbackContextProxy do

  describe "#instance_variables" do
    subject { create_fcp_and_set_one_instance_variable.instance_variables }
    let(:expected_type_of_names) { type_of_ivar_names_on_this_ruby }
    let(:actual_type_of_names) { subject.first.class }
    let(:excluded) { Docile::FallbackContextProxy::NON_PROXIED_INSTANCE_VARIABLES }

    def create_fcp_and_set_one_instance_variable
      fcp = Docile::FallbackContextProxy.new(nil, nil)
      fcp.instance_variable_set(:@foo, "foo")
      fcp
    end

    def type_of_ivar_names_on_this_ruby
      @a = 1
      instance_variables.first.class
    end

    it "returns proxied instance variables" 


    it "doesn't return non-proxied instance variables" 


    it "preserves the type (String or Symbol) of names on this ruby version" 

  end

end

