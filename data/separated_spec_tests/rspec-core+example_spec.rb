require 'pp'
require 'stringio'

RSpec.describe RSpec::Core::Example, :parent_metadata => 'sample' do

  let(:example_group) do
    RSpec.describe('group description')
  end

  let(:example_instance) do
    example_group.example('example description') { }
  end

  it_behaves_like "metadata hash builder" do
    def metadata_hash(*args)
      example = example_group.example('example description', *args)
      example.metadata
    end
  end

  it "can be pretty printed" 


  describe "human readable output" do
    it 'prints a human readable description when inspected' 


    it 'prints a human readable description for #to_s' 

  end

  describe "#rerun_argument" do
    it "returns the location-based rerun argument" 

  end

  describe "#update_inherited_metadata" do
    it "updates the example metadata with the provided hash" 


    it "does not overwrite existing metadata since example metadata takes precedence over inherited metadata" 


    it "does not replace the existing metadata object with a new one or change its default proc" 


    it "applies new metadata-based config items based on the update" 
        it "gets the before hook due to the update" 

      end

      expect(sequence).to eq [:global_before_hook, :example, :global_after_hook]
    end
  end

  describe '#duplicate_with' do
    it 'successfully duplicates an example' 

  end

  it "captures example timing even for exceptions unhandled by RSpec" 


  describe "#exception" do
    it "supplies the exception raised, if there is one" 


    it "returns nil if there is no exception" 


    it 'provides a `MultipleExceptionError` if there are multiple exceptions (e.g. from `it`, `around` and `after`)' 

  end

  describe "when there is an explicit description" do
    context "when RSpec.configuration.format_docstrings is set to a block" do
      it "formats the description using the block" 

    end
  end

  describe "when there is no explicit description" do
    def expect_with(*frameworks)
      if frameworks.include?(:stdlib)
        example_group.class_exec do
          def assert(val)
            raise "Expected #{val} to be true" unless val
          end
        end
      end
    end

    context "when RSpec.configuration.format_docstrings is set to a block" do
      it "formats the description using the block" 

    end

    context "when `expect_with :rspec` is configured" do
      before(:each) { expect_with :rspec }

      it "uses the matcher-generated description" 


      it "uses the matcher-generated description in the full description" 


      it "uses the file and line number if there is no matcher-generated description" 


      it "uses the file and line number if there is an error before the matcher" 


      context "if the example is pending" do
        it "still uses the matcher-generated description if a matcher ran" 


        it "uses the file and line number of the example if no matcher ran" 

      end

      context "when an `after(:example)` hook raises an error" do
        it 'still assigns the description' 

      end

      context "when the matcher's `description` method raises an error" do
        description_line = __LINE__ + 3
        RSpec::Matchers.define :matcher_with_failing_description do
          match { true }
          description { raise ArgumentError, "boom" }
        end

        it 'allows the example to pass and surfaces the failing description in the example description' 

      end

      context "when an `after(:example)` hook has an expectation" do
        it "assigns the description based on the example's last expectation, ignoring the `after` expectation since it can apply to many examples" 

      end
    end

    context "when `expect_with :rspec, :stdlib` is configured" do
      before(:each) { expect_with :rspec, :stdlib }

      it "uses the matcher-generated description" 


      it "uses the file and line number if there is no matcher-generated description" 


      it "uses the file and line number if there is an error before the matcher" 

    end

    context "when `expect_with :stdlib` is configured" do
      around do |ex|
        # Prevent RSpec::Matchers from being autoloaded.
        orig_autoloads = RSpec::MODULES_TO_AUTOLOAD.dup
        RSpec::MODULES_TO_AUTOLOAD.clear
        ex.run
        RSpec::MODULES_TO_AUTOLOAD.replace(orig_autoloads)
      end

      before { expect_with :stdlib }

      it "does not attempt to get the generated description from RSpec::Matchers when not loaded" 


      it "uses the file and line number" 

    end
  end

  describe "#described_class" do
    it "returns the class (if any) of the outermost example group" 

  end

  describe "accessing metadata within a running example" do
    it "has a reference to itself when running" do |ex|
      expect(ex.description).to eq("has a reference to itself when running")
    end

    it "can access the example group's top level metadata as if it were its own" do |ex|
      expect(ex.example_group.metadata).to include(:parent_metadata => 'sample')
      expect(ex.metadata).to include(:parent_metadata => 'sample')
    end
  end

  describe "accessing options within a running example" do
    it "can look up option values by key", :demo => :data do |ex|
      expect(ex.metadata[:demo]).to eq(:data)
    end
  end

  describe "#run" do
    it "generates a description before tearing down mocks in case a mock object is used in the description" 


    it "runs after(:each) when the example passes" 


    it "runs after(:each) when the example fails" 


    it "runs after(:each) when the example raises an Exception" 


    context "with an after(:each) that raises" do
      it "runs subsequent after(:each)'s" 


      it "stores the exception" 

    end

    it "wraps before/after(:each) inside around" 



    context 'memory leaks, see GH-321, GH-1921' do
      def self.reliable_gc
        0 != GC.method(:start).arity # older Rubies don't give us options to ensure a full GC
      end

      def expect_gc(opts)
        get_all = opts.fetch :get_all

        begin
          GC.disable
          opts.fetch(:event).call
          expect(get_all.call).to eq(opts.fetch :pre_gc)
        ensure
          GC.enable
        end

        # See discussion on https://github.com/rspec/rspec-core/pull/1950
        # for why it's necessary to do this multiple times
        20.times do
          GC.start :full_mark => true, :immediate_sweep => true
          return if get_all.call == opts.fetch(:post_gc)
        end

        expect(get_all.call).to eq opts.fetch(:post_gc)
      end

      it 'releases references to the examples / their ivars', :if => reliable_gc do
        config        = RSpec::Core::Configuration.new
        real_reporter = RSpec::Core::Reporter.new(config) # in case it is the cause of a leak
        garbage       = Struct.new :defined_in

        group = RSpec.describe do
          before(:all)  { @before_all  = garbage.new :before_all  }
          before(:each) { @before_each = garbage.new :before_each }
          after(:each)  { @after_each  = garbage.new :after_each  }
          after(:all)   { @after_all   = garbage.new :after_all   }
          example "passing" do
            @passing_example = garbage.new :passing_example
            expect(@passing_example).to be
          end
          example "failing" do
            @failing_example = garbage.new :failing_example
            expect(@failing_example).to_not be
          end
        end

        expect_gc :event   => lambda { group.run real_reporter },
                  :get_all => lambda { ObjectSpace.each_object(garbage).map { |g| g.defined_in.to_s }.sort },
                  :pre_gc  => %w[after_all after_each after_each before_all before_each before_each failing_example passing_example],
                  :post_gc => []
      end

      it 'can still be referenced by user code afterwards' 

    end

    it "leaves raised exceptions unmodified (GH-1103)", :if => RUBY_VERSION < '2.5' 


    context "with --dry-run" do
      before { RSpec.configuration.dry_run = true }

      it "does not execute any examples or hooks" 

    end
  end

  describe "reporting example_finished" do
    let(:reporter) { RSpec::Core::Reporter.new(RSpec::Core::Configuration.new) }

    def capture_reported_execution_result_for_example(&block)
      reporter = RSpec::Core::Reporter.new(RSpec::Core::Configuration.new)

      reported_execution_result = nil

      listener = double("Listener")
      allow(listener).to receive(:example_finished) do |notification|
        reported_execution_result = notification.example.execution_result.dup
      end

      reporter.register_listener(listener, :example_finished)

      RSpec.describe(&block).run(reporter)

      reported_execution_result
    end

    shared_examples "when skipped or failed" do
      it "fills in the execution result details before reporting a failed example as finished" 


      it "fills in the execution result details before reporting a skipped example as finished" 

    end

    context "from an example" do
      def capture_reported_execution_result_for_example(&block)
        super { it(&block) }
      end

      it "fills in the execution result details before reporting a passed example as finished" 


      it "fills in the execution result details before reporting a pending example as finished" 


      include_examples "when skipped or failed"
    end

    context "from a context hook" do
      def capture_reported_execution_result_for_example(&block)
        super do
          before(:context, &block)
          it { will_never_run }
        end
      end

      include_examples "when skipped or failed"
    end
  end

  describe "#pending" do
    def expect_pending_result(example)
      expect(example).to be_pending
      expect(example.execution_result.status).to eq(:pending)
      expect(example.execution_result.pending_message).to be
    end

    context "in the example" do
      it "sets the example to pending" 


      it "allows post-example processing in around hooks (see https://github.com/rspec/rspec-core/issues/322)" 


      it 'sets the backtrace to the example definition so it can be located by the user' 

    end

    context "in before(:each)" do
      it "sets each example to pending" 


      it 'sets example to pending when failure occurs in before(:each)' 

    end

    context "in before(:all)" do
      it "is forbidden" 


      it "fails with an ArgumentError if a block is provided" 

    end

    context "in around(:each)" do
      it "sets the example to pending" 


      it 'sets example to pending when failure occurs in around(:each)' 

    end

    context "in after(:each)" do
      it "sets each example to pending" 

    end

  end

  describe "#skip" do
    context "in the example" do
      it "sets the example to skipped" 


      it "allows post-example processing in around hooks (see https://github.com/rspec/rspec-core/issues/322)" 


      context "with a message" do
        it "sets the example to skipped with the provided message" 

      end
    end

    context "in before(:each)" do
      it "sets each example to skipped" 

    end

    context "in before(:all)" do
      it "sets each example to skipped" 

    end

    context "in around(:each)" do
      it "sets the example to skipped" 

    end
  end

  describe "timing" do
    it "uses RSpec::Core::Time as to not be affected by changes to time in examples" 

  end

  it "does not interfere with per-example randomness when running examples in a random order" 


  describe "optional block argument" do
    it "contains the example" do |ex|
      expect(ex).to be_an(RSpec::Core::Example)
      expect(ex.description).to match(/contains the example/)
    end
  end

  describe "setting the current example" do
    it "sets RSpec.current_example to the example that is currently running" 

  end

  describe "mock framework integration" do
    it 'verifies mock expectations after each example' 


    it 'skips mock verification if the example has already failed' 


    it 'allows `after(:example)` hooks to satisfy mock expectations, since examples are not complete until their `after` hooks run' 

  end

  describe "exposing the examples reporter" do
    it "returns a null reporter when the example has not run yet" 


    it "returns the reporter used to run the example when executed" 

  end
end

