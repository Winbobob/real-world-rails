require 'thread_order'

module RSpec::Core
  RSpec.describe MemoizedHelpers do
    before(:each) { RSpec.configuration.configure_expectation_framework }

    def subject_value_for(describe_arg, &block)
      example_group = RSpec.describe(describe_arg, &block)
      subject_value = nil
      example_group.example { subject_value = subject }
      example_group.run
      subject_value
    end

    describe "implicit subject" do
      describe "with a class" do
        it "returns an instance of the class" 

      end

      describe "with a Module" do
        it "returns the Module" 

      end

      describe "with a string" do
        it "returns the string" 

      end

      describe "with a number" do
        it "returns the number" 

      end

      describe "with a hash" do
        it "returns the hash" 

      end

      describe "with a symbol" do
        it "returns the symbol" 

      end

      describe "with true" do
        it "returns `true`" 

      end

      describe "with false" do
        it "returns `false`" 

      end

      describe "with nil" do
        it "returns `nil`" 

      end

      it "can be overriden and super'd to from a nested group" 

    end

    describe "explicit subject" do
      it "yields the example in which it is eval'd" 


      context "doesn't issue a deprecation when used with doubles" do
        subject do
          Struct.new(:value) do
            def working_with?(double)
              double.value >= value
            end
          end.new 1
        end

        it { should be_working_with double(:value => 10) }
      end

      [false, nil].each do |falsy_value|
        context "with a value of #{falsy_value.inspect}" do
          it "is evaluated once per example" 

        end
      end

      describe "defined in a top level group" do
        it "replaces the implicit subject in that group" 

      end

      describe "defined in a top level group" do
        let(:group) do
          RSpec.describe do
            subject{ [4, 5, 6] }
          end
        end

        it "is available in a nested group (subclass)" 


        it "is available in a doubly nested group (subclass)" 


        it "can be overriden and super'd to from a nested group" 


        [:before, :after].each do |hook|
          it "raises an error when referenced from `#{hook}(:all)`" 

        end
      end

      describe "with a name" do
        it "yields the example in which it is eval'd" 


        it "defines a method that returns the memoized subject" 


        it "is referred from inside subject by the name" 


        it 'can continue to be referenced by the name even when an inner group redefines the subject' 


        it 'can continue to reference an inner subject after the outer subject name is referenced' 


        it 'is not overriden when an inner group defines a new method with the same name' 


        context 'when `super` is used' do
          def should_raise_not_supported_error(&block)
            ex = nil

            RSpec.describe do
              let(:list) { ["a", "b", "c"] }
              subject { [1, 2, 3] }

              describe 'first' do
                module_exec(&block) if block

                subject(:list) { super().first(2) }
                ex = example { subject }
              end
            end.run

            expect(ex.execution_result.status).to eq(:failed)
            expect(ex.execution_result.exception.message).to match(/super.*not supported/)
          end

          it 'raises a "not supported" error' 


          context 'with a `let` definition before the named subject' do
            it 'raises a "not supported" error' 

          end
        end
      end
    end

    context "using 'self' as an explicit subject" do
      it "delegates matcher to the ExampleGroup" 


      it 'supports a new expect-based syntax' 

    end

    describe '#subject!' do
      let(:prepared_array) { [1,2,3] }
      subject! { prepared_array.pop }

      it "evaluates subject before example" 


      it "returns memoized value from first invocation" 

    end

    describe 'threadsafety', :threadsafe => true do
      before(:all) { eq 1 } # explanation: https://github.com/rspec/rspec-core/pull/1858/files#r25411166

      context 'when not threadsafe' do
        # would be nice to not set this on the global
        before { RSpec.configuration.threadsafe = false }

        it 'can wind up overwriting the previous memoized value (but if you don\'t need threadsafety, this is faster)' 

      end

      context 'when threadsafe' do
        before(:context) { RSpec.configuration.threadsafe = true }
        specify 'first thread to access determines the return value' do
          describe_successfully do
            let!(:order) { ThreadOrder.new }
            after { order.apocalypse! :join }

            let :memoized_value do
              if order.current == :second
                :second_access
              else
                order.pass_to :second, :resume_on => :sleep
                :first_access
              end
            end

            example do
              order.declare(:second) { expect(memoized_value).to eq :first_access }
              expect(memoized_value).to eq :first_access
            end
          end
        end

        specify 'memoized block will only be evaluated once' do
          describe_successfully do
            let!(:order) { ThreadOrder.new }
            after  { order.apocalypse! }
            before { @previously_accessed = false }

            let :memoized_value do
              raise 'Called multiple times!' if @previously_accessed
              @previously_accessed = true
              order.pass_to :second, :resume_on => :sleep
            end

            example do
              order.declare(:second) { memoized_value }
              memoized_value
              order.join_all
            end
          end
        end

        specify 'memoized blocks prevent other threads from accessing, even when it is accesssed in a superclass' do
          describe_successfully do
            let!(:order) { ThreadOrder.new }
            after { order.apocalypse! :join }

            let!(:calls) { {:parent => 0, :child => 0} }
            let(:memoized_value) do
              calls[:parent] += 1
              order.pass_to :second, :resume_on => :sleep
              'parent'
            end

            describe 'child' do
              let :memoized_value do
                calls[:child] += 1
                "#{super()}/child"
              end

              example do
                order.declare(:second) { expect(memoized_value).to eq 'parent/child' }
                expect(memoized_value).to eq 'parent/child'
                expect(calls).to eq :parent => 1, :child => 1
              end
            end
          end
        end
      end
    end
  end

  RSpec.describe "#let" do
    let(:counter) do
      Class.new do
        def initialize
          @count = 0
        end
        def count
          @count += 1
        end
      end.new
    end

    let(:nil_value) do
      @nil_value_count += 1
      nil
    end

    it "generates an instance method" 


    it "caches the value" 


    it "caches a nil value" 


    let(:yield_the_example) do |example_yielded_to_let|
      @example_yielded_to_let = example_yielded_to_let
    end

    it "yields the example" do |example_yielded_to_example|
      yield_the_example
      expect(@example_yielded_to_let).to equal example_yielded_to_example
    end

    let(:regex_with_capture) { %r[RegexWithCapture(\d)] }

    it 'does not pass the block up the ancestor chain' 


    it 'raises a useful error when called without a block' 


    it 'raises an error when attempting to define a reserved method name' 


    let(:a_value) { "a string" }

    context 'when overriding let in a nested context' do
      let(:a_value) { super() + " (modified)" }

      it 'can use `super` to reference the parent context value' 

    end

    context 'when the declaration uses `return`' do
      let(:value) do
        return :early_exit if @early_exit
        :late_exit
      end

      it 'can exit the let declaration early' 


      it 'can get past a conditional `return` statement' 

    end

    [:before, :after].each do |hook|
      it "raises an error when referenced from `#{hook}(:all)`" 

    end

    context "when included modules have hooks that define memoized helpers" do
      it "allows memoized helpers to override methods in previously included modules" 

    end
  end

  RSpec.describe "#let!" do
    subject { [1,2,3] }
    let!(:popped) { subject.pop }

    it "evaluates the value non-lazily" 


    it "returns memoized value from first invocation" 

  end

  RSpec.describe 'using subject in before and let blocks' do
    shared_examples_for 'a subject' do
      let(:subject_id_in_let) { subject.object_id }
      before { @subject_id_in_before = subject.object_id }

      it 'should be memoized' 


      it { is_expected.to eq(subject) }
    end

    describe Object do
      context 'with implicit subject' do
        it_should_behave_like 'a subject'
      end

      context 'with explicit subject' do
        subject { Object.new }
        it_should_behave_like 'a subject'
      end

      context 'with a constant subject'do
        subject { 123 }
        it_should_behave_like 'a subject'
      end
    end
  end

  RSpec.describe 'Module#define_method' do
    it 'retains its normal private visibility on Ruby versions where it is normally private', :if => RUBY_VERSION < '2.5' 

  end
end


