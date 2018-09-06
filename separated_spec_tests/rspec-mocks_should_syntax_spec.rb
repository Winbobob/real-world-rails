require 'support/before_all_shared_example_group'

RSpec.describe "Using the legacy should syntax" do
  include_context "with syntax", [:should, :expect]

  describe "#received_message?" do
    let(:dbl) { double("double").as_null_object }

    it "answers false for received_message? when no messages received" 


    it "answers true for received_message? when message received" 


    it "answers true for received_message? when message received with correct args" 


    it "answers false for received_message? when message received with incorrect args" 

  end

  describe "#stub" do
    it "supports options" 


    it 'returns `nil` from all terminal actions to discourage further configuration' 


    it 'sets up a canned response' 


    it 'can stub multiple messages using a hash' 


    include_examples "fails in a before(:all) block" do
      def use_rspec_mocks
        Object.stub(:foo)
      end
    end
  end

  describe "#stub_chain" do
    it 'can stub a sequence of messages' 


    include_examples "fails in a before(:all) block" do
      def use_rspec_mocks
        Object.stub_chain(:foo, :bar)
      end
    end
  end

  describe "#unstub" do
    include_examples "fails in a before(:all) block" do
      def use_rspec_mocks
        Object.unstub(:foo)
      end
    end

    it "replaces the stubbed method with the original method" 


    it "removes all stubs with the supplied method name" 


    it "does not remove any expectations with the same method name" 


    it "restores the correct implementations when stubbed and unstubbed on a parent and child class" 


    it "raises a MockExpectationError if the method has not been stubbed" 

  end

  describe "#should_receive" do
    it 'fails on verification if the message is not received' 


    it 'does not fail on verification if the message is received' 


    it 'can set a canned response' 


    include_examples "fails in a before(:all) block" do
      def use_rspec_mocks
        Object.should_receive(:foo)
      end
    end

    context "with an options hash" do
      it "reports the file and line submitted with :expected_from" 


      it "uses the message supplied with :message" 


      it "uses the message supplied with :message after a similar stub" 

    end
  end

  describe "#should_not_receive" do
    it "returns a negative message expectation" 


    it 'fails when the message is received' 


    it 'does not fail on verification if the message is not received' 


    include_examples "fails in a before(:all) block" do
      def use_rspec_mocks
        Object.should_not_receive(:foo)
      end
    end
  end

  describe "#any_instance" do
    let(:klass) do
      Class.new do
        def existing_method; :existing_method_return_value; end
        def existing_method_with_arguments(_a, _b=nil); :existing_method_with_arguments_return_value; end
        def another_existing_method; end
      private
        def private_method; :private_method_return_value; end
      end
    end

    include_examples "fails in a before(:all) block" do
      def use_rspec_mocks
        Object.any_instance.should_receive(:foo)
      end
    end

    it "adds a class to the current space" 


    it 'can stub a method' 


    it 'can mock a method' 


    it 'can get method objects for the fluent interface', :if => RUBY_VERSION.to_f > 1.8 do
      and_return = klass.any_instance.stub(:foo).method(:and_return)
      and_return.call(23)

      expect(klass.new.foo).to eq(23)
    end

    it 'affects previously stubbed instances when stubbing a method' 


    it 'affects previously stubbed instances when mocking a method' 


    context "invocation order" do
      describe "#stub" do
        it "raises an error if 'stub' follows 'with'" 


        it "raises an error if 'with' follows 'and_return'" 


        it "raises an error if 'with' follows 'and_raise'" 


        it "raises an error if 'with' follows 'and_yield'" 


        context "behaves as 'every instance'" do
          let(:super_class) { Class.new { def foo; 'bar'; end } }
          let(:sub_class)   { Class.new(super_class) }

          it 'handles `unstub` on subclasses' 

        end
      end

      describe "#stub_chain" do
        it "raises an error if 'stub_chain' follows 'and_return'" 


        context "allows a chain of methods to be stubbed using #stub_chain" do
          example "given symbols representing the methods" do
            klass.any_instance.stub_chain(:one, :two, :three).and_return(:four)
            expect(klass.new.one.two.three).to eq(:four)
          end

          example "given a hash as the last argument uses the value as the expected return value" do
            klass.any_instance.stub_chain(:one, :two, :three => :four)
            expect(klass.new.one.two.three).to eq(:four)
          end

          example "given a string of '.' separated method names representing the chain" do
            klass.any_instance.stub_chain('one.two.three').and_return(:four)
            expect(klass.new.one.two.three).to eq(:four)
          end
        end

        it 'affects previously stubbed instances' 

      end

      describe "#should_receive" do
        it "raises an error if 'should_receive' follows 'with'" 

      end

      describe "#should_not_receive" do
        it "fails if the method is called" 


        it "passes if no method is called" 


        it "passes if only a different method is called" 


        context "with constraints" do
          it "fails if the method is called with the specified parameters" 


          it "passes if the method is called with different parameters" 

        end

        context 'when used in combination with should_receive' do
          it 'passes if only the expected message is received' 

        end

        it "prevents confusing double-negative expressions involving `never`" 

      end

      describe "#unstub" do
        it "replaces the stubbed method with the original method" 


        it "removes all stubs with the supplied method name" 


        it "removes stubs even if they have already been invoked" 


        it "removes stubs from sub class after invokation when super class was originally stubbed" 


        it "removes stubs set directly on an instance" 


        it "does not remove message expectations set directly on an instance" 


        it "does not remove any expectations with the same method name" 


        it "raises a MockExpectationError if the method has not been stubbed" 


        it 'does not get confused about string vs symbol usage for the message' 

      end
    end
  end
end

RSpec.context "with default syntax configuration" do
  orig_syntax = nil

  before(:all) { orig_syntax = RSpec::Mocks.configuration.syntax }
  after(:all)  { RSpec::Mocks.configuration.syntax = orig_syntax }
  before       { RSpec::Mocks.configuration.reset_syntaxes_to_default }

  let(:expected_arguments) {
    [
      /Using.*without explicitly enabling/,
      {:replacement => "the new `:expect` syntax or explicitly enable `:should`"}
    ]
  }

  it "it warns about should once, regardless of how many times it is called" 


  it "warns about should not once, regardless of how many times it is called" 


  it "warns about stubbing once, regardless of how many times it is called" 


  it "warns about unstubbing once, regardless of how many times it is called" 


  it "doesn't warn about stubbing after a reset and setting should" 


  it "includes the call site in the deprecation warning" 

end

RSpec.context "when the should syntax is enabled on a non-default syntax host" do
  include_context "with the default mocks syntax"

  it "continues to warn about the should syntax" 

end

