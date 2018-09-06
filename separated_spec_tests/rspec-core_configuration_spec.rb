require 'tmpdir'
require 'rspec/support/spec/in_sub_process'

module RSpec::Core
  RSpec.describe Configuration do
    include RSpec::Support::InSubProcess

    let(:config) { Configuration.new }
    let(:exclusion_filter) { config.exclusion_filter.rules }
    let(:inclusion_filter) { config.inclusion_filter.rules }

    before { config.world = RSpec.world }

    shared_examples_for "warning of deprecated `:example_group` during filtering configuration" do |method, *args|
      it "issues a deprecation warning when filtering by `:example_group`" 

    end

    describe '#on_example_group_definition' do
      before do
        RSpec.configure do |c|
          c.on_example_group_definition do |example_group|
            example_group.examples.first.metadata[:new_key] = :new_value
          end
        end
      end

      it 'successfully invokes the block' 

    end

    describe "#fail_fast" do
      it "defaults to `nil`" 

    end

    describe 'fail_if_no_examples' do
      it 'defaults to false' 


      it 'can be set to true' 


      it 'can be set to false' 

    end

    describe '#deprecation_stream' do
      it 'defaults to standard error' 


      it 'is configurable' 


      context 'when the reporter has already been initialized' do
        before do
          config.reporter
          allow(config).to receive(:warn)
        end

        it 'prints a notice indicating the reconfigured output_stream will be ignored' 


        it 'does not change the value of `deprecation_stream`' 


        it 'does not print a warning if set to the value it already has' 

      end
    end

    describe "#output_stream" do
      it 'defaults to standard output' 

    end

    describe "#output_stream=" do
      it 'is configurable' 


      context 'when the reporter has already been initialized' do
        before do
          config.reporter
          allow(config).to receive(:warn)
        end

        it 'prints a notice indicating the reconfigured output_stream will be ignored' 


        it 'does not change the value of `output_stream`' 


        it 'does not print a warning if set to the value it already has' 

      end
    end

    describe "#requires=" do
      def absolute_path_to(dir)
        File.expand_path("../../../../#{dir}", __FILE__)
      end

      it 'adds `lib` to the load path' 


      it 'adds the configured `default_path` to the load path' 


      it 'stores the required files' 


      context "when `default_path` refers to a file rather than a directory" do
        it 'does not add it to the load path' 

      end
    end

    describe "#load_spec_files" do
      it "loads files using load" 


      it "loads each file once, even if duplicated in list" 

    end

    describe "#mock_framework" do
      it "defaults to :rspec" 


      context "when rspec-mocks is not installed" do
        it 'gracefully falls back to :nothing' 

      end
    end

    describe "#mock_framework="do
      it "delegates to mock_with" 

    end

    shared_examples "a configurable framework adapter" do |m|
      it "yields a config object if the framework_module supports it" 


      it "raises if framework module doesn't support configuration" 

    end

    describe "#mock_with" do
      before { allow(config).to receive(:require) }

      it_behaves_like "a configurable framework adapter", :mock_with

      it "allows rspec-mocks to be configured with a provided block" 


      context "with a module" do
        it "sets the mock_framework_adapter to that module" 

      end

      it 'uses the named adapter' 


      it "uses the null adapter when given :nothing" 


      it "raises an error when given an unknown key" 


      it "raises an error when given another type of object" 


      context 'when there are already some example groups defined' do
        before { allow(RSpec::Support).to receive(:require_rspec_core) }

        it 'raises an error since this setting must be applied before any groups are defined' 


        it 'does not raise an error if the default `mock_with :rspec` is re-configured' 


        it 'does not raise an error if re-setting the same config' 

      end
    end

    describe "#expectation_frameworks" do
      it "defaults to :rspec" 


      context "when rspec-expectations is not installed" do
        def an_anonymous_module
          name = RUBY_VERSION.to_f < 1.9 ? '' : nil
          an_object_having_attributes(:class => Module, :name => name)
        end

        it 'gracefully falls back to an anonymous module' 

      end
    end

    describe "#expectation_framework=" do
      it "delegates to expect_with" 

    end

    def stub_expectation_adapters
      stub_const("Test::Unit::Assertions", Module.new)
      stub_const("Minitest::Assertions", Module.new)
      stub_const("RSpec::Core::TestUnitAssertionsAdapter", Module.new)
      stub_const("RSpec::Core::MinitestAssertionsAdapter", Module.new)
      allow(config).to receive(:require)
    end

    describe "#expect_with" do
      before do
        stub_expectation_adapters
      end

      it_behaves_like "a configurable framework adapter", :expect_with

      context "with :rspec" do
        it "requires rspec/expectations" 


        it "sets the expectation framework to ::RSpec::Matchers" 

      end

      context "with :test_unit" do
        it "requires rspec/core/test_unit_assertions_adapter" 


        it "sets the expectation framework to ::Test::Unit::Assertions" 

      end

      context "with :minitest" do
        it "requires rspec/core/minitest_assertions_adapter" 


        it "sets the expectation framework to ::Minitest::Assertions" 

      end

      it "supports multiple calls" 


      it "raises if block given with multiple args" 


      it "raises ArgumentError if framework is not supported" 


      context 'when there are already some example groups defined' do
        it 'raises an error since this setting must be applied before any groups are defined' 


        it 'does not raise an error if the default `expect_with :rspec` is re-configured' 


        it 'does not raise an error if re-setting the same config' 

      end
    end

    describe "#files_to_run" do
      it "loads files not following pattern if named explicitly" 


      it "prevents repetition of dir when start of the pattern" 


      it "does not prevent repetition of dir when later of the pattern" 


      it "supports patterns starting with ./" 


      it "supports absolute path patterns", :failing_on_appveyor,
        :pending => false,
        :skip => (ENV['APPVEYOR'] ? "Failing on AppVeyor but :pending isn't working for some reason" : false) do
        dir = File.expand_path("../resources", __FILE__)
        config.pattern = File.join(dir, "**/*_spec.rb")
        assign_files_or_directories_to_run "spec"

        expect(config.files_to_run).to contain_files(
          "./spec/rspec/core/resources/acceptance/foo_spec.rb",
          "./spec/rspec/core/resources/a_spec.rb"
        )
      end

      it "supports relative path patterns for an alternate directory from `spec`" 


      it "does not attempt to treat the pattern relative to `.` if it uses `**` in the first path segment as that would cause it load specs from vendored gems" 


      it 'reloads when `files_or_directories_to_run` is reassigned' 


      it 'attempts to load the provided file names' 


      it 'does not attempt to load a file at the `default_path`' 


      context "with <path>:<line_number>" do
        it "overrides inclusion filters set before config" 


        it "clears exclusion filters set before config" 

      end

      context "with default pattern" do
        it "loads files named _spec.rb" 


        it "loads files in Windows", :if => RSpec::Support::OS.windows? do
          assign_files_or_directories_to_run "C:\\path\\to\\project\\spec\\sub\\foo_spec.rb"
          expect(config.files_to_run).to contain_files("C:/path/to/project/spec/sub/foo_spec.rb")
        end

        it "loads files in Windows when directory is specified", :failing_on_appveyor, :if => RSpec::Support::OS.windows? do
          assign_files_or_directories_to_run "spec\\rspec\\core\\resources"
          expect(config.files_to_run).to contain_files("spec/rspec/core/resources/a_spec.rb")
        end

        it_behaves_like "handling symlinked directories when loading spec files" do
          def loaded_files
            assign_files_or_directories_to_run "spec"
            config.files_to_run
          end
        end
      end

      context "with default default_path" do
        it "loads files in the default path when run by rspec" 


        it "loads files in the default path when run with DRB (e.g., spork)" 


        it "does not load files in the default path when run by ruby" 

      end

      it 'loads files in passed directories in alphabetical order to avoid OS-specific file-globbing non-determinism' 


      it 'respects the user-specified order of files and directories passed at the command line' 


      it 'deduplicates spec files that are listed individually and present in a passed dir' 


      def define_dirs(dirs_hash)
        allow(File).to receive(:directory?) do |path|
          !path.end_with?(".rb")
        end

        allow(Dir).to receive(:[]).and_return([])

        dirs_hash.each do |dir, sequential_glob_return_values|
          allow(Dir).to receive(:[]).with(
            a_string_including(dir, config.pattern)
          ).and_return(*sequential_glob_return_values)
        end
      end

      def file_at(relative_path)
        eq(relative_path).or eq(File.expand_path(relative_path))
      end
    end

    describe "#pattern" do
      context "with single pattern" do
        before { config.pattern = "**/*_foo.rb" }

        it "loads all explicitly specified files, even those that do not match the pattern" 


        it "loads files in directories following pattern" 


        it "does not load files in directories not following pattern" 


        it "ignores pattern if files are specified" 

      end

      context "with multiple patterns" do
        it "supports comma separated values" 


        it "supports comma separated values with spaces" 


        it "supports curly braces glob syntax" 

      end

      context "after files have already been loaded" do
        it 'warns that it will have no effect' 


        it 'does not warn if reset is called after load_spec_files' 

      end

      context "after `files_to_run` has been accessed but before files have been loaded" do
        it 'still takes affect' 

      end
    end

    describe "#exclude_pattern" do
      context "with single pattern" do
        before { config.exclude_pattern = "**/*_foo.rb" }

        it "does not load files in directories following exclude pattern" 


        it "loads files in directories not following exclude pattern" 


        it "ignores exclude_pattern if files are specified" 

      end

      context "with multiple patterns" do
        it "supports comma separated values" 


        it "supports comma separated values with spaces" 


        it "supports curly braces glob syntax" 

      end

      context "after files have already been loaded" do
        it 'warns that it will have no effect' 


        it 'does not warn if reset is called after load_spec_files' 

      end

      context "after `files_to_run` has been accessed but before files have been loaded" do
        it 'still takes affect' 

      end
    end

    context "with full_description set" do
      it "overrides filters" 


      it 'is possible to access the full description regular expression' 

    end

    context "without full_description having been set" do
      it 'returns nil from #full_description' 

    end

    context "with line number" do
      it "assigns the file and line number as a location filter" 


      it "assigns multiple files with line numbers as location filters" 


      it "assigns files with multiple line numbers as location filters" 

    end

    context "with multiple line numbers" do
      it "assigns the file and line numbers as a location filter" 

    end

    it "allows file names with brackets" 


    context "with an example id" do
      it "assigns the file and id as an ids filter" 

    end

    context "with a single file with multiple example ids" do
      it "assigns the file and ids as an ids filter" 


      it "ignores whitespace between scoped ids" 

    end

    context "with multiple files with ids" do
      it "assigns all of them to the ids filter" 

    end

    context "with the same file specified multiple times with different scoped ids" do
      it "unions all the ids" 

    end

    it "assigns the example name as the filter on description" 


    it "assigns the example names as the filter on description if description is an array" 


    it 'is possible to access the full description regular expression' 


    describe "#default_path" do
      it 'defaults to "spec"' 


      it 'adds to the `project_source_dirs`' 

    end

    config_methods = %w[ include extend ]
    config_methods << "prepend" if RSpec::Support::RubyFeatures.module_prepends_supported?
    config_methods.each do |config_method|
      it "raises an immediate `TypeError` when you attempt to `config.#{config_method}` with something besides a module" 

    end

    describe "#include_context" do
      context "with no metadata filters" do
        it 'includes the named shared example group in all groups' 

      end

      context "with metadata filters" do
        it 'includes the named shared example group in matching groups' 


        it 'includes the named shared example group in the singleton class of matching examples' 

      end
    end

    describe "#include" do
      include_examples "warning of deprecated `:example_group` during filtering configuration", :include, Enumerable

      module InstanceLevelMethods
        def you_call_this_a_blt?
          "egad man, where's the mayo?!?!?"
        end
      end

      it_behaves_like "metadata hash builder" do
        def metadata_hash(*args)
          config.include(InstanceLevelMethods, *args)
          config.instance_variable_get(:@include_modules).items_and_filters.last.last
        end
      end

      context "with no filter" do
        it "includes the given module into each example group" 


        it "includes the given module into each existing example group" 

      end

      context "with a filter" do
        it "includes the given module into each matching example group" 


        it "includes in example groups that match a deprecated `:example_group` filter" 


        it "includes the given module into each existing matching example group" 


        it "includes the given module into the singleton class of matching examples" 


        it "ensures that `before` hooks have access to the module methods, even when only included in the singleton class of one example" 


        it "does not include the module in an example's singleton class when it has already been included in the group" 

      end
    end

    describe "#extend" do
      include_examples "warning of deprecated `:example_group` during filtering configuration", :extend, Enumerable

      module ThatThingISentYou
        def that_thing
        end
      end

      it_behaves_like "metadata hash builder" do
        def metadata_hash(*args)
          config.extend(ThatThingISentYou, *args)
          config.instance_variable_get(:@extend_modules).items_and_filters.last.last
        end
      end

      it "extends the given module into each matching example group" 


      it "extends the given module into each existing matching example group" 

    end

    describe "#prepend", :if => RSpec::Support::RubyFeatures.module_prepends_supported? do
      include_examples "warning of deprecated `:example_group` during filtering configuration", :prepend, Enumerable

      module SomeRandomMod
        def foo
          "foobar"
        end
      end

      it_behaves_like "metadata hash builder" do
        def metadata_hash(*args)
          config.prepend(SomeRandomMod, *args)
          config.instance_variable_get(:@prepend_modules).items_and_filters.last.last
        end
      end

      context "with no filter" do
        it "prepends the given module into each example group" 


        it "prepends the given module into each existing example group" 

      end

      context "with a filter" do
        it "prepends the given module into each matching example group" 


        it "prepends the given module into each existing matching example group" 

      end

    end

    describe "#run_all_when_everything_filtered?" do

      it "defaults to false" 


      it "can be queried with question method" 

    end

    describe "#color_mode" do
      context ":automatic" do
        before do
          config.color_mode = :automatic
        end

        context "with output.tty?" do
          it "sets color_enabled?" 

        end

        context "with !output.tty?" do
          it "sets !color_enabled?" 

        end
      end

      context ":on" do
        before do
          config.color_mode = :on
        end

        context "with output.tty?" do
          it "sets color_enabled?" 

        end

        context "with !output.tty?" do
          it "sets color_enabled?" 

        end
      end

      context ":off" do
        before do
          config.color_mode = :off
        end

        context "with output.tty?" do
          it "sets !color_enabled?" 

        end

        context "with !output.tty?" do
          it "sets !color_enabled?" 

        end

        it "prefers incoming cli_args" 

      end
    end

    describe "#color_enabled?" do
      it "allows overriding instance output stream with an argument" 

    end

    describe "#color=" do
      before { config.color_mode = :automatic }

      context "given false" do
        before { config.color = false }

        context "with config.tty? and output.tty?" do
          it "sets color_enabled?" 

        end

        context "with config.tty? and !output.tty?" do
          it "does not set color_enabled?" 

        end

        context "with !config.tty? and output.tty?" do
          it "sets color_enabled?" 

        end

        context "with !config.tty? and !output.tty?" do
          it "does not set color_enabled?" 

        end
      end

      context "given true" do
        before { config.color = true }

        context "with config.tty? and output.tty?" do
          it "sets color_enabled?" 

        end

        context "with config.tty? and !output.tty?" do
          it "sets color_enabled?" 

        end

        context "with !config.tty? and output.tty?" do
          it "sets color_enabled?" 

        end

        context "with !config.tty? and !output.tty?" do
          it "does not set color_enabled?" 

        end
      end

      it "prefers incoming cli_args" 

    end

    describe "#bisect_runner_class" do
      if RSpec::Support::RubyFeatures.fork_supported?
        it 'defaults to the faster `Bisect::ForkRunner` since fork is supported on this platform' 

      else
        it 'defaults to the slower `Bisect::ShellRunner` since fork is not supported on this platform' 

      end

      it "returns `Bisect::ForkRunner` when `bisect_runner == :fork" 


      it "returns `Bisect::ShellRunner` when `bisect_runner == :shell" 


      it "raises a clear error when `bisect_runner` is configured to an unrecognized value" 


      it 'cannot be changed after the runner is in use' 


      it 'can be set to the same value after the runner is in use' 

    end

    %w[formatter= add_formatter].each do |config_method|
      describe "##{config_method}" do
        it "delegates to formatters#add" 

      end
    end

    describe "#formatters" do
      it "returns a dup of the formatter_loader formatters" 

    end

    describe '#reporter' do
      before do
        config.output_stream = StringIO.new
        config.deprecation_stream = StringIO.new
      end

      it 'does not immediately trigger formatter setup' 


      it 'buffers deprecations until the reporter is ready' 


      it 'allows registering listeners without doubling up formatters' 


      it 'still configures a default formatter when none specified' 

    end

    describe "#default_formatter" do
      it 'defaults to `progress`' 


      it 'remembers changes' 


      context 'when another formatter has been set' do
        it 'does not get used' 

      end

      context 'when no other formatter has been set' do
        before do
          config.output_stream = StringIO.new
        end

        it 'gets used' 

      end

      context 'using a legacy formatter as default' do
        # Generating warnings during formatter initialisation triggers the
        # ProxyReporter code path.
        it 'remembers changes' 

      end

      def used_formatters
        config.reporter # to force freezing of formatters
        config.formatters
      end
    end

    describe "#filter_run_including" do
      it_behaves_like "metadata hash builder" do
        def metadata_hash(*args)
          config.filter_run_including(*args)
          config.inclusion_filter.rules
        end
      end

      include_examples "warning of deprecated `:example_group` during filtering configuration", :filter_run_including

      it "sets the filter with a hash" 


      it "sets the filter with a symbol" 


      it "merges with existing filters" 

    end

    describe "#filter_run_excluding" do
      it_behaves_like "metadata hash builder" do
        def metadata_hash(*args)
          config.filter_run_excluding(*args)
          config.exclusion_filter.rules
        end
      end

      include_examples "warning of deprecated `:example_group` during filtering configuration", :filter_run_excluding

      it "sets the filter" 


      it "sets the filter using a symbol" 


      it "merges with existing filters" 

    end

    shared_examples_for "a spec filter" do |type|
      describe "##{type}" do
        it "returns {} even if set to nil" 

      end

      describe "##{type}=" do
        it "treats symbols as hash keys with true values when told to" 


        it "overrides any #{type} set on the command line or in configuration files" 


        include_examples "warning of deprecated `:example_group` during filtering configuration", :"#{type}="
      end
    end
    it_behaves_like "a spec filter", :inclusion_filter
    it_behaves_like "a spec filter", :exclusion_filter

    describe "#treat_symbols_as_metadata_keys_with_true_values=" do
      it 'is deprecated' 

    end

    describe "#full_backtrace=" do
      it "doesn't impact other instances of config" 

    end

    describe "#backtrace_exclusion_patterns=" do
      it "actually receives the new filter values" 

    end

    describe 'full_backtrace' do
      it 'returns true when backtrace patterns is empty' 


      it 'returns false when backtrace patterns isnt empty' 

    end

    describe "#backtrace_exclusion_patterns" do
      it "can be appended to" 

    end

    describe "#backtrace_inclusion_patterns" do
      before { config.backtrace_exclusion_patterns << /.*/ }

      it 'can be assigned to' 


      it 'can be appended to' 

    end

    describe "#filter_gems_from_backtrace" do
      def exclude?(line)
        config.backtrace_formatter.exclude?(line)
      end

      it 'filters the named gems from the backtrace' 

    end

    describe "#profile_examples" do
      it "defaults to false" 


      it "can be set to an integer value" 


      it "returns 10 when set simply enabled" 

    end

    describe "#libs=" do
      it "adds directories to the LOAD_PATH" 

    end

    describe "libs" do
      it 'records paths added to the load path' 

    end

    describe "#define_derived_metadata" do
      include_examples "warning of deprecated `:example_group` during filtering configuration", :define_derived_metadata

      it 'allows the provided block to mutate example group metadata' 


      it 'allows the provided block to mutate example metadata' 


      it 'allows multiple configured blocks to be applied, in order of definition' 


      it "derives metadata before the group or example blocks are eval'd so their logic can depend on the derived metadata" 


      it 'registers top-level groups before invoking the callback so the logic can configure already registered groups' 


      it 'registers nested groups before invoking the callback so the logic can configure already registered groups' 


      it 'registers examples before invoking the callback so the logic can configure already registered groups' 


      context "when passed a metadata filter" do
        it 'only applies to the groups and examples that match that filter' 


        it 'applies if any of multiple filters apply (to align with module inclusion semantics)' 


        it 'allows a metadata filter to be passed as a raw symbol' 

      end
    end

    describe "#when_first_matching_example_defined" do
      include_examples "warning of deprecated `:example_group` during filtering configuration", :when_first_matching_example_defined

      it "runs the block when the first matching example is defined" 


      it "does not fire when later matching examples are defined" 


      it "does not run the block if no matching examples are defined" 


      it 'does not run the block if groups match the metadata but no examples do' 


      it "still runs after the first matching example even if there is a group that matches earlier" 


      context "when a group is defined with matching metadata" do
        it "runs the callback after the first example in the group is defined" 

      end

      context 'when the value of the registered metadata is a Proc' do
        it 'does not fire when later matching examples are defined' 

      end

      context 'when a matching example group with other registered metadata has been defined' do
        it 'does not fire when later matching examples with the other metadata are defined' 

      end
    end

    describe "#add_setting" do
      describe "with no modifiers" do
        context "with no additional options" do
          before do
            config.add_setting :custom_option
          end

          it "defaults to nil" 


          it "adds a predicate" 


          it "can be overridden" 

        end

        context "with :default => 'a value'" do
          before do
            config.add_setting :custom_option, :default => 'a value'
          end

          it "defaults to 'a value'" 


          it "returns true for the predicate" 


          it "can be overridden with a truthy value" 


          it "can be overridden with nil" 


          it "can be overridden with false" 

        end
      end

      context "with :alias_with => " do
        before do
          config.add_setting :custom_option, :alias_with => :another_custom_option
        end

        it "delegates the getter to the other option" 


        it "delegates the setter to the other option" 


        it "delegates the predicate to the other option" 

      end
    end

    describe "#configure_group" do
      it "extends with 'extend'" 


      it "includes with 'include'" 


      it "requires only one matching filter" 


      module IncludeExtendOrPrependMeOnce
        def self.included(host)
          raise "included again" if host.instance_methods.include?(:foobar)
          host.class_exec { def foobar; end }
        end

        def self.extended(host)
          raise "extended again" if host.respond_to?(:foobar)
          def host.foobar; end
        end

        def self.prepended(host)
          raise "prepended again" if host.instance_methods.include?(:barbaz)
          host.class_exec { def barbaz; end }
        end
      end

      it "doesn't include a module when already included in ancestor" 


      it "doesn't extend when ancestor is already extended with same module" 


      it "doesn't prepend a module when already present in ancestor chain",
        :if => RSpec::Support::RubyFeatures.module_prepends_supported? do
        config.prepend(IncludeExtendOrPrependMeOnce, :foo => :bar)

        group = RSpec.describe("group", :foo => :bar)
        child = group.describe("child")

        config.configure_group(group)
        config.configure_group(child)
      end
    end

    describe "#alias_example_group_to" do
      after do
        RSpec::Core::DSL.example_group_aliases.delete(:my_group_method)

        RSpec.module_exec do
          class << self
            undef :my_group_method if method_defined? :my_group_method
          end
        end

        RSpec::Core::ExampleGroup.module_exec do
          class << self
            undef :my_group_method if method_defined? :my_group_method
          end
        end

        Module.class_exec do
          undef :my_group_method if method_defined? :my_group_method
        end
      end

      it_behaves_like "metadata hash builder" do
        def metadata_hash(*args)
          config.alias_example_group_to :my_group_method, *args
          group = ExampleGroup.my_group_method("a group")
          group.metadata
        end
      end

      it 'overrides existing definitions of the aliased method name without issueing warnings' 


      it "allows adding additional metadata" 


      it "passes `nil` as the description arg when no args are given" 


      context 'when the aliased method is used' do
        it_behaves_like "metadata hash builder" do
          def metadata_hash(*args)
            config.alias_example_group_to :my_group_method
            group = ExampleGroup.my_group_method("a group", *args)
            group.metadata
          end
        end
      end
    end

    describe "#alias_example_to" do
      it_behaves_like "metadata hash builder" do
        after do
          RSpec::Core::ExampleGroup.module_exec do
            class << self
              undef :my_example_method if method_defined? :my_example_method
            end
          end
        end
        def metadata_hash(*args)
          config.alias_example_to :my_example_method, *args
          group = RSpec.describe("group")
          example = group.my_example_method("description")
          example.metadata
        end
      end
    end

    describe "#reset" do
      it "clears the reporter" 


      it "clears the formatters" 


      it "clears the output wrapper" 

    end

    describe "#reset_reporter" do
      it "clears the reporter" 


      it "clears the formatters" 


      it "clears the output wrapper" 

    end

    def example_numbered(num)
      instance_double(Example, :id => "./foo_spec.rb[1:#{num}]")
    end

    describe "#force" do
      context "for ordering options" do
        let(:list) { 1.upto(4).map { |i| example_numbered(i) } }
        let(:ordering_strategy) { config.ordering_registry.fetch(:global) }
        let(:shuffled) { Ordering::Random.new(config).order list }

        specify "CLI `--order defined` takes precedence over `config.order = rand`" do
          config.force :order => "defined"
          config.order = "rand"

          expect(ordering_strategy.order(list)).to eq(list)
        end

        specify "CLI `--order rand:37` takes precedence over `config.order = defined`" do
          config.force :order => "rand:37"
          config.order = "defined"

          expect(ordering_strategy.order(list)).to eq(shuffled)
        end

        specify "CLI `--seed 37` forces order and seed" do
          config.force :seed => 37
          config.order = "defined"
          config.seed  = 145

          expect(ordering_strategy.order(list)).to eq(shuffled)
          expect(config.seed).to eq(37)
        end

        specify "CLI `--order defined` takes precedence over `config.register_ordering(:global)`" do
          config.force :order => "defined"
          config.register_ordering(:global, &:reverse)
          expect(ordering_strategy.order(list)).to eq(list)
        end
      end

      it "forces 'false' value" 

    end

    describe '#seed' do
      it 'returns the seed as an int' 

    end

    describe "#seed_used?" do
      def use_seed_on(registry)
        registry.fetch(:random).order([example_numbered(1), example_numbered(2)])
      end

      it 'returns false if neither ordering registry used the seed' 


      it 'returns true if the ordering registry used the seed' 

    end

    describe '#order=' do
      context 'given "random"' do
        before do
          config.seed = 7654
          config.order = 'random'
        end

        it 'does not change the seed' 


        it 'sets up random ordering' 

      end

      context 'given "random:123"' do
        before { config.order = 'random:123' }

        it 'sets seed to 123' 


        it 'sets up random ordering' 

      end

      context 'given "defined"' do
        before do
          config.order = 'rand:123'
          config.order = 'defined'
        end

        it "does not change the seed" 


        it 'clears the random ordering' 

      end
    end

    describe "#register_ordering" do
      def register_reverse_ordering
        config.register_ordering(:reverse, &:reverse)
      end

      it 'stores the ordering for later use' 


      it 'can register an ordering object' 

    end

    describe '#warnings' do
      around do |example|
        original_setting = $VERBOSE
        example.run
        $VERBOSE = original_setting
      end

      it "sets verbose to true when true" 


      it "sets verbose to false when true" 


      it 'returns the verbosity setting' 


      it 'is loaded from config by #force' 

    end

    describe '#raise_on_warning=(value)' do
      around do |example|
        original_setting = RSpec::Support.warning_notifier
        example.run
        RSpec::Support.warning_notifier = original_setting
      end

      it 'causes warnings to raise errors when true' 


      it 'causes warnings to default to warning when false' 

    end

    describe "#raise_errors_for_deprecations!" do
      it 'causes deprecations to raise errors rather than printing to the deprecation stream' 

    end

    describe "#expose_current_running_example_as" do
      before { stub_const(Configuration::ExposeCurrentExample.name, Module.new) }

      it 'exposes the current example via the named method' 
          it "works" 

        end.run

        expect(value_1).to be_an(RSpec::Core::Example)
        expect(value_1.description).to eq("works")
        expect(value_2).to be(value_1)
      end
    end

    describe '#disable_monkey_patching!' do
      let!(:config) { RSpec.configuration }
      let!(:expectations) { RSpec::Expectations }
      let!(:mocks) { RSpec::Mocks }

      def in_fully_monkey_patched_rspec_environment
        in_sub_process do
          config.expose_dsl_globally = true
          mocks.configuration.syntax = [:expect, :should]
          mocks.configuration.patch_marshal_to_support_partial_doubles = true
          expectations.configuration.syntax = [:expect, :should]

          yield
        end
      end

      it 'stops exposing the DSL methods globally' 


      it 'stops using should syntax for expectations' 


      it 'stops using should syntax for mocks' 


      it 'stops patching of Marshal' 


      context 'when user did not configure mock framework' do
        def emulate_not_configured_mock_framework
          in_fully_monkey_patched_rspec_environment do
            allow(config).to receive(:rspec_mocks_loaded?).and_return(false, true)
            config.instance_variable_set :@mock_framework, nil
            ExampleGroup.send :remove_class_variable, :@@example_groups_configured

            yield
          end
        end

        it 'disables monkey patching after example groups being configured' 

      end

      context 'when user did not configure expectation framework' do
        def emulate_not_configured_expectation_framework
          in_fully_monkey_patched_rspec_environment do
            allow(config).to receive(:rspec_expectations_loaded?).and_return(false, true)
            config.instance_variable_set :@expectation_frameworks, []
            ExampleGroup.send :remove_class_variable, :@@example_groups_configured

            yield
          end
        end

        it 'disables monkey patching after example groups being configured' 

      end
    end

    describe 'recording spec start time (for measuring load)' do
      it 'returns a time' 


      it 'is configurable' 

    end

    describe "hooks" do
      include_examples "warning of deprecated `:example_group` during filtering configuration", :before, :each
    end

    describe '#threadsafe', :threadsafe => true do
      it 'defaults to false' 


      it 'can be configured to true or false' 

    end

    describe '#max_displayed_failure_line_count' do
      it 'defaults to 10' 


      it 'is configurable' 

    end

    describe "#shared_context_metadata_behavior" do
      it "defaults to :trigger_inclusion for backwards compatibility" 


      it "can be set to :apply_to_host_groups" 


      it "can be set to :trigger_inclusion explicitly" 


      it "cannot be set to any other values" 

    end

    # assigns files_or_directories_to_run and triggers post-processing
    # via `files_to_run`.
    def assign_files_or_directories_to_run(*value)
      config.files_or_directories_to_run = value
      config.files_to_run
    end
  end
end

