module RSpec::Core
  RSpec.describe Hooks do
    class HooksHost
      include Hooks

      def parent_groups
        []
      end

      def register_hook(position, scope, *args, &block)
        block ||= Proc.new { }
        __send__(position, scope, *args, &block)
        hook_collection_for(position, scope).first
      end

      def hook_collection_for(position, scope)
        hooks.send(:all_hooks_for, position, scope)
      end
    end

    [:example, :context, :suite].each do |scope|
      describe "#before(#{scope})" do
        it "stops running subsequent hooks of the same type when an error is encountered" 

      end

      describe "#after(#{scope})" do
        it "runs subsequent hooks of the same type when an error is encountered so all cleanup can complete" 

      end
    end

    [:before, :after, :around].each do |type|
      [:example, :context].each do |scope|
        next if type == :around && scope == :context

        describe "##{type}(#{scope})" do
          it_behaves_like "metadata hash builder" do
            define_method :metadata_hash do |*args|
              HooksHost.new.register_hook(type, scope, *args).options
            end
          end
        end
      end

      describe "##{type}(no scope)" do
        let(:instance) { HooksHost.new }

        it "defaults to :example scope if no arguments are given" 


        it "defaults to :example scope if the only argument is a metadata hash" 


        it "raises an error if only metadata symbols are given as arguments" 

      end
    end

    [:before, :after].each do |type|
      [:example, :context].each do |scope|
        describe "##{type}(#{scope.inspect})" do
          let(:instance) { HooksHost.new }
          let!(:hook)    { instance.register_hook(type, scope) }

          it "does not make #{scope.inspect} a metadata key" 


          it "is scoped to #{scope.inspect}" 


          it 'does not run when in dry run mode' 


          if scope == :example
            it "yields the example as an argument to the hook" 

          end
        end
      end
    end

    describe "#around" do
      context "when it does not run the example" do
        context "for a hook declared in the group" do
          it 'converts the example to a skipped example so the user is made aware of it' 

        end

        context "for a hook declared in config" do
          it 'converts the example to a skipped example so the user is made aware of it' 

        end

        if RUBY_VERSION.to_f < 1.9
          def hook_desc(_)
            "around hook"
          end
        else
          def hook_desc(line)
            "around hook at #{Metadata.relative_path(__FILE__)}:#{line}"
          end
        end

        it 'indicates which around hook did not run the example in the pending message' 

      end

      it 'considers the hook to have run when passed as a block to a method that yields' 


      it 'does not consider the hook to have run when passed as a block to a method that does not yield' 


      context "when not running the example within the around block" do
        it "does not run the example" 
            it "foo" 

          end
          group.run
          expect(examples).to eq([])
        end
      end

      context "when running the example within the around block" do
        it "runs the example" 
            it "foo" 

          end
          group.run
          expect(examples.count).to eq(1)
        end

        it "exposes example metadata to each around hook" 


        it "exposes the full example interface to each around hook" 


        it "exposes a sensible inspect value" 
            it "does something" 

          end

          group.run
          expect(inspect_value).to match(/ExampleProcsy/)
        end
      end

      context "when running the example within a block passed to a method" do
        it "runs the example" 
            it "foo" 

          end
          group.run
          expect(examples.count).to eq(1)
        end
      end
    end

    [:all, :each].each do |scope|
      describe "prepend_before(#{scope})" do
        it "adds to the front of the list of before(:#{scope}) hooks" 

      end

      describe "append_before(#{scope})" do
        it "adds to the back of the list of before(:#{scope}) hooks (same as `before`)" 

      end

      describe "prepend_after(#{scope})" do
        it "adds to the front of the list of after(:#{scope}) hooks (same as `after`)" 

      end

      describe "append_after(#{scope})" do
        it "adds to the back of the list of after(:#{scope}) hooks" 

      end
    end

    describe "lambda" do
      it "can be used as a hook" 

    end

    it "only defines methods that are intended to be part of RSpec's public API (+ `hooks`)" 

  end
end

