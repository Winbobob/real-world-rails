# encoding: utf-8

module RSpec::Core
  RSpec.describe ExampleGroup do
    it_behaves_like "metadata hash builder" do
      def metadata_hash(*args)
        group = RSpec.describe('example description', *args)
        group.metadata
      end
    end

    %w[ expect double spy ].each do |method|
      context "when calling `#{method}`, an example API, on an example group" do
        it "tells the user they are in the wrong scope for that API" 

      end
    end

    %w[ describe context let before it it_behaves_like ].each do |method|
      context "when calling `#{method}`, an example group API, from within an example" do
        it "tells the user they are in the wrong scope for that API" 

      end
    end

    it "surfaces NameError from an example group for other missing APIs, like normal" 


    it "surfaces NameError from an example for other missing APIs, like normal" 


    context "when RSpec.configuration.format_docstrings is set to a block" do
      it "formats the description with that block" 

    end

    it 'does not treat the first argument as a metadata key even if it is a symbol' 


    it 'treats the first argument as part of the description when it is a symbol' 


    describe "constant naming" do
      around do |ex|
        before_constants = RSpec::ExampleGroups.constants
        ex.run
        after_constants = RSpec::ExampleGroups.constants

        (after_constants - before_constants).each do |name|
          RSpec::ExampleGroups.send(:remove_const, name)
        end
      end

      if RUBY_VERSION == "1.9.2"
        RSpec::Matchers.define :have_class_const do |class_name|
          match do |group|
            class_name.gsub!('::','_::')
            class_name << '_'
            group.name == "RSpec::ExampleGroups::#{class_name}" &&
            group == class_name.split('::').inject(RSpec::ExampleGroups) do |mod, name|
              mod.const_get(name)
            end
          end
        end
      else
        RSpec::Matchers.define :have_class_const do |class_name, _|
          match do |group|
            group.name == "RSpec::ExampleGroups::#{class_name}" &&
            group == class_name.split('::').inject(RSpec::ExampleGroups) do |mod, name|
              mod.const_get(name)
            end
          end
        end
      end

      it 'gives groups friendly human readable class names' 


      it 'nests constants to match the group nesting' 


      it 'removes non-ascii characters from the const name since some rubies barf on that' 


      it 'prefixes the const name with "Nested" if needed to make a valid const' 


      it 'does not warn when defining a Config example group (since RbConfig triggers warnings when Config is referenced)' 


      it 'ignores top level constants that have the same name' 


      it 'disambiguates name collisions by appending a number', :unless => RUBY_VERSION == '1.9.2' 


      it 'identifies unnamed groups as "Anonymous"' 


      it 'assigns the const before evaling the group so error messages include the name' 


      it "assigns the const before including shared contexts via metadata so error messages from eval'ing the context include the name" 


      it 'does not have problems with example groups named "Core"', :unless => RUBY_VERSION == '1.9.2' 


      it 'does not have problems with example groups named "RSpec"', :unless => RUBY_VERSION == '1.9.2' 

    end

    describe "ordering" do
      context "when tagged with `:order => :defined`" do
        it 'orders the subgroups and examples in defined order regardless of global order' 

      end

      context "when tagged with an unrecognized ordering" do
        let(:run_order) { [] }
        let(:definition_line) { __LINE__ + 4 }
        let(:group) do
          order = self.run_order

          RSpec.describe "group", :order => :unrecognized do
            example { order << :ex_1 }
            example { order << :ex_2 }
          end
        end

        before do
          RSpec.configuration.register_ordering(:global, &:reverse)
          allow(self.group).to receive(:warn)
        end

        it 'falls back to the global ordering' 


        it 'prints a warning so users are notified of their mistake' 

      end

      context "when tagged with a custom ordering" do
        def ascending_numbers
          lambda { |g| Integer(g.description[/\d+/]) }
        end

        it 'uses the custom orderings' 

      end
    end

    describe "top level group" do
      it "runs its children" 


      context "with a failure in the top level group" do
        it "runs its children " 

      end

      describe "descendants" do
        it "returns self + all descendants" 

      end
    end

    describe "child" do
      it "is known by parent" 


      it "is not registered in world" 

    end

    describe "filtering" do
      let(:world) { World.new }
      before { allow(RSpec).to receive_messages(:world => self.world) }

      shared_examples "matching filters" do
        context "inclusion" do
          before do
            filter_manager = FilterManager.new
            filter_manager.include filter_metadata
            allow(self.world).to receive_messages(:filter_manager => filter_manager)
          end

          it "includes examples in groups matching filter" 


          it "includes examples directly matching filter" 

        end

        context "exclusion" do
          before do
            filter_manager = FilterManager.new
            filter_manager.exclude filter_metadata
            allow(self.world).to receive_messages(:filter_manager => filter_manager)
          end

          it "excludes examples in groups matching filter" 


          it "excludes examples directly matching filter" 

        end
      end

      context "matching false" do
        let(:spec_metadata)    { { :awesome => false }}

        context "against false" do
          let(:filter_metadata)  { { :awesome => false }}
          include_examples "matching filters"
        end

        context "against 'false'" do
          let(:filter_metadata)  { { :awesome => 'false' }}
          include_examples "matching filters"
        end

        context "against :false" do
          let(:filter_metadata)  { { :awesome => :false }}
          include_examples "matching filters"
        end
      end

      context "matching true" do
        let(:spec_metadata)    { { :awesome => true }}

        context "against true" do
          let(:filter_metadata)  { { :awesome => true }}
          include_examples "matching filters"
        end

        context "against 'true'" do
          let(:filter_metadata)  { { :awesome => 'true' }}
          include_examples "matching filters"
        end

        context "against :true" do
          let(:filter_metadata)  { { :awesome => :true }}
          include_examples "matching filters"
        end
      end

      context "matching a string" do
        let(:spec_metadata)    { { :type => 'special' }}

        context "against a string" do
          let(:filter_metadata)  { { :type => 'special' }}
          include_examples "matching filters"
        end

        context "against a symbol" do
          let(:filter_metadata)  { { :type => :special }}
          include_examples "matching filters"
        end
      end

      context "matching a symbol" do
        let(:spec_metadata)    { { :type => :special }}

        context "against a string" do
          let(:filter_metadata)  { { :type => 'special' }}
          include_examples "matching filters"
        end

        context "against a symbol" do
          let(:filter_metadata)  { { :type => :special }}
          include_examples "matching filters"
        end
      end

      context "with no filters" do
        it "returns all" 

      end

      context "with no examples or groups that match filters" do
        it "returns none" 

      end
    end

    describe '#described_class' do

      context "with a constant as the first parameter" do
        it "is that constant" 

      end

      context "with a string as the first parameter" do
        it "is nil" 

      end

      context "with a constant in an outer group" do
        context "and a string in an inner group" do
          it "is the top level constant" 

        end

        context "and metadata redefinition after `described_class` call" do
          it "is the redefined level constant" 

        end
      end

      context "in a nested group" do
        it "inherits the described class/module from the outer group" 


        context "when a class is passed" do
          def described_class_value
            value = nil

            RSpec.describe(String) do
              yield if block_given?
              describe Array do
                example { value = described_class }
              end
            end.run

            value
          end

          it "overrides the described class" 


          it "overrides the described class even when described_class is referenced in the outer group" 

        end
      end

      context "for `describe(SomeClass)` within a `describe 'some string' group" do
        def define_and_run_group(define_outer_example = false)
          outer_described_class = inner_described_class = nil

          RSpec.describe("some string") do
            example { outer_described_class = described_class } if define_outer_example

            describe Array do
              example { inner_described_class = described_class }
            end
          end.run

          return outer_described_class, inner_described_class
        end

        it "has a `nil` described_class in the outer group" 


        it "has the inner described class as the described_class of the inner group" 

      end
    end

    describe '#described_class' do
      it "is the same as described_class" 

    end

    describe '#description' do
      it "grabs the description from the metadata" 

    end

    describe '#metadata' do
      it "adds the third parameter to the metadata" 


      it "adds the the file_path to metadata" 


      it "has a reader for file_path" 


      it "adds the line_number to metadata" 

    end

    [:focus, :fexample, :fit, :fspecify].each do |example_alias|
      describe ".#{example_alias}" do
        let(:focused_example) { RSpec.describe.send example_alias, "a focused example" }

        it 'defines an example that can be filtered with :focus => true' 

      end
    end

    describe "#before, after, and around hooks" do
      describe "scope aliasing" do
        it "aliases the `:context` hook scope to `:all` for before-hooks" 


        it "aliases the `:example` hook scope to `:each` for before-hooks" 


        it "aliases the `:context` hook scope to `:all` for after-hooks" 


        it "aliases the `:example` hook scope to `:each` for after-hooks" 


        describe "#currently_executing_a_context_hook?" do
          it "sets currently_executing_a_context_hook? to false initially" 


          it "sets currently_executing_a_context_hook? during before(:context) execution" 


          it "does not set currently_executing_a_context_hook? outside of before(:context) execution" 


          it "sets currently_executing_a_context_hook? during after(:context) execution" 


          it "unsets currently_executing_a_context_hook? after an after(:context) hook is done" 

        end
      end

      it "runs the before alls in order" 


      it "does not set RSpec.world.wants_to_quit in case of an error in before all (without fail_fast?)" 


      it "runs the before eachs in order" 


      it "runs the after eachs in reverse order" 


      it "runs the after alls in reverse order" 


      it "only runs before/after(:all) hooks from example groups that have specs that run" 


      it "runs before_all_defined_in_config, before all, before each, example, after each, after all, after_all_defined_in_config in that order" 


      context "after(:all)" do
        let(:outer) { RSpec.describe }
        let(:inner) { outer.describe }

        it "has access to state defined before(:all)" 


        it "cleans up ivars in after(:all)" 

      end

      it "treats an error in before(:each) as a failure" 


      it "treats an error in before(:all) as a failure" 


      it "exposes instance variables set in before(:all) from after(:all) even if a before(:all) error occurs" 


      it "treats an error in before(:all) as a failure for a spec in a nested group" 


      context "when an error occurs in an after(:all) hook" do
        hooks_run = []

        before(:each) do
          hooks_run = []
          allow(RSpec.configuration.reporter).to receive(:message)
        end

        let(:group) do
          RSpec.describe do
            after(:all) { hooks_run << :one; raise "An error in an after(:all) hook" }
            after(:all) { hooks_run << :two; raise "A different hook raising an error" }
            it("equality") { expect(1).to eq(1) }
          end
        end

        it "allows the example to pass" 


        it "rescues any error(s) and prints them out" 


        it "still runs both after blocks" 


        it "sets `world.non_example_failure` so the exit status will be non-zero" 

      end
    end

    describe ".pending" do
      let(:group) { RSpec.describe { pending { fail } } }

      it "generates a pending example" 


      it "sets the pending message" 


      it 'sets the backtrace to the example definition so it can be located by the user' 


      it 'generates a pending example when no block is provided' 

    end

    describe "pending with metadata" do
      let(:group) { RSpec.describe {
        example("unimplemented", :pending => true) { fail }
      } }

      it "generates a pending example" 


      it "sets the pending message" 

    end

    describe "pending with message in metadata" do
      let(:group) { RSpec.describe {
        example("unimplemented", :pending => 'not done') { fail }
      } }

      it "generates a pending example" 


      it "sets the pending message" 

    end

    describe ".skip" do
      let(:group) { RSpec.describe { skip("skip this") { } } }

      it "generates a skipped example" 


      it "sets the pending message" 

    end

    describe "skip with metadata" do
      let(:group) { RSpec.describe {
        example("skip this", :skip => true) { }
      } }

      it "generates a skipped example" 


      it "sets the pending message" 

    end

    describe "skip with message in metadata" do
      let(:group) { RSpec.describe {
        example("skip this", :skip => 'not done') { }
      } }

      it "generates a skipped example" 


      it "sets the pending message" 

    end

    %w[xit xspecify xexample].each do |method_name|
      describe ".#{method_name}" do
        let(:group) { RSpec.describe.tap {|x|
          x.send(method_name, "is pending") { }
        }}

        it "generates a skipped example" 


        it "sets the pending message" 

      end
    end

    %w[ xdescribe xcontext ].each do |method_name|
      describe ".#{method_name}" do
        def extract_execution_results(group)
          group.examples.map do |ex|
            ex.metadata.fetch(:execution_result)
          end
        end

        it 'generates a pending example group' 

      end
    end

    %w[ fdescribe fcontext ].each do |method_name|
      describe ".#{method_name}" do
        def executed_examples_of(group)
          examples = group.examples.select { |ex| ex.execution_result.started_at }
          group.children.inject(examples) { |exs, child| exs + executed_examples_of(child) }
        end

        it "generates an example group that can be filtered with :focus" 

      end
    end

    describe "setting pending metadata in parent" do
      def extract_execution_results(group)
        group.examples.map do |ex|
          ex.metadata.fetch(:execution_result)
        end
      end

      it 'marks every example as pending' 

    end

    describe "adding examples" do

      it "allows adding an example using 'it'" 


      it "exposes all examples at examples" 


      it "maintains the example order" 


    end

    describe Object, "describing nested example_groups", :little_less_nested => 'yep' do

      describe "A sample nested group", :nested_describe => "yep" do
        it "sets the described class to the nearest described class" do |ex|
          expect(ex.example_group.described_class).to eq(Object)
        end

        it "sets the description to 'A sample nested describe'" do |ex|
          expect(ex.example_group.description).to eq('A sample nested group')
        end

        it "has top level metadata from the example_group and its parent groups" do |ex|
          expect(ex.example_group.metadata).to include(:little_less_nested => 'yep', :nested_describe => 'yep')
        end

        it "exposes the parent metadata to the contained examples" do |ex|
          expect(ex.metadata).to include(:little_less_nested => 'yep', :nested_describe => 'yep')
        end
      end

    end

    describe "#run_examples" do
      let(:reporter) { RSpec::Core::NullReporter }

      it "returns true if all examples pass" 


      it "returns false if any of the examples fail" 


      it "runs all examples, regardless of any of them failing" 

    end

    describe "how instance variables are inherited" do
      before(:all) do
        @before_all_top_level = 'before_all_top_level'
      end

      before(:each) do
        @before_each_top_level = 'before_each_top_level'
      end

      it "can access a before each ivar at the same level" 


      it "can access a before all ivar at the same level" 


      it "can access the before all ivars in the before_all_ivars hash", :ruby => 1.8 do |ex|
        expect(ex.example_group.before_context_ivars).to include('@before_all_top_level' => 'before_all_top_level')
      end

      it "can access the before all ivars in the before_all_ivars hash", :ruby => 1.9 do |ex|
        expect(ex.example_group.before_context_ivars).to include(:@before_all_top_level => 'before_all_top_level')
      end

      describe "but now I am nested" do
        it "can access a parent example groups before each ivar at a nested level" 


        it "can access a parent example groups before all ivar at a nested level" 


        it "changes to before all ivars from within an example do not persist outside the current describe" 


        describe "accessing a before_all ivar that was changed in a parent example_group" do
          it "does not have access to the modified version" 

        end
      end

    end

    describe "ivars are not shared across examples" do
      it "(first example)" 


      it "(second example)" 

    end


    describe "#top_level_description" do
      it "returns the description from the outermost example group" 

    end

    describe "#run" do
      context "with `fail_fast` set to `nil`" do
        before { RSpec.configuration.fail_fast = nil }
        let(:group) { RSpec.describe }
        let(:reporter) { Reporter.new(RSpec.configuration) }

        it "does not run abort due to failures" 

      end

      context "with fail_fast enabled" do
        before { RSpec.configuration.fail_fast = true }
        let(:group) { RSpec.describe }
        let(:reporter) { Reporter.new(RSpec.configuration) }

        it "does not run examples after the failed example" 


        it "sets RSpec.world.wants_to_quit flag if encountering an exception in before(:all)" 

      end

      context "with fail_fast set to 3" do
        before { RSpec.configuration.fail_fast = 3 }
        let(:group) { RSpec.describe }
        let(:reporter) { Reporter.new(RSpec.configuration) }

        it "does not run examples after 3 failed examples" 


        it "does not set RSpec.world.wants_to_quit flag if encountering an exception in before(:all) causing less than 3 failures" 


        it "sets RSpec.world.wants_to_quit flag if encountering an exception in before(:all) causing at least 3 failures" 

      end

      let(:reporter) { double("reporter").as_null_object }

      context "with RSpec.world.wants_to_quit=true" do
        let(:group) { RSpec.describe }

        before do
          RSpec.world.wants_to_quit = true
        end

        it "returns without starting the group" 

      end

      context "with all examples passing" do
        it "returns true" 
            it "does something" 

            describe "nested" do
              it "does something else" 

            end
          end

          expect(group.run(reporter)).to be_truthy
        end
      end

      context "with top level example failing" do
        it "returns false" 
            it "does something (wrong - fail)" 

            describe "nested" do
              it "does something else" 

            end
          end

          expect(group.run(reporter)).to be_falsey
        end
      end

      context "with nested example failing" do
        it "returns true" 
            it "does something" 

            describe "nested" do
              it "does something else (wrong -fail)" 

            end
          end

          expect(group.run(reporter)).to be_falsey
        end
      end
    end

    describe "#update_inherited_metadata" do
      it "updates the group metadata with the provided hash" 


      it "does not overwrite existing metadata originating from that level" 


      it "overwrites metadata originating from a parent" 


      it "does not replace the existing metadata object with a new one or change its default proc" 


      it "propogates metadata updates to previously declared child examples" 


      it "propogates metadata updates to previously declared child group" 


      it "applies new metadata-based config items based on the update" 


      it "does not cause duplicate hooks to be added when re-configuring the group" 

    end

    %w[include_examples include_context].each do |name|
      describe "##{name}" do
        let(:group) { RSpec.describe }
        before do
          self.group.shared_examples "named this" do
            example("does something") {}
          end
        end

        it "includes the named examples" 


        it "raises a helpful error message when shared content is not found" 


        it "raises a helpful error message when shared content is accessed recursively" 


        it "leaves RSpec's thread metadata unchanged" 


        it "leaves RSpec's thread metadata unchanged, even when an error occurs during evaluation" 


        it "passes parameters to the shared content" 


        it "adds shared instance methods to the group" 


        it "evals the shared example group only once" 


        it "evals the block when given" 

      end
    end

    describe "#it_should_behave_like" do
      it "creates a nested group" 


      it "creates a nested group for a class" 


      it "adds shared examples to nested group" 


      it "adds shared instance methods to nested group" 


      it "adds shared class methods to nested group" 


      it "passes parameters to the shared example group" 


      it "adds shared instance methods to nested group" 


      it "evals the shared example group only once" 


      context "given a block" do
        it "evaluates the block in nested group" 

      end

      it "raises a helpful error message when shared context is not found" 


      it "leaves RSpec's thread metadata unchanged" 


      it "leaves RSpec's thread metadata unchanged, even when an error occurs during evaluation" 

    end

    it 'minimizes the number of methods that users could inadvertantly overwrite' 


    it 'prevents defining nested isolated contexts' 


    it 'prevents defining nested isolated shared contexts' 


    describe 'inspect output', :unless => RUBY_VERSION == '1.9.2' do
      context 'when there is no inspect output provided' do
        it "uses '(no description provided)' instead" 

      end

      context 'when an example has a description' do
        it 'includes description and location' 

      end

      context 'when an example does not have a description' do
        it 'includes fallback description' 

      end

      it 'handles before context hooks' 


      it 'handles after context hooks' 


      it "does not pollute an example's `inspect` output with the inspect ivar from `before(:context)`" 

    end

    def group_ids group
      ids = []
      ['descendant_filtered_examples', 'descendants',
       'parent_groups', 'declaration_locations', 'before_context_ivars'].each do |method|
        ids << group.send(method).object_id
      end
      ids
    end

    it 'allows adding examples' 


    it 'allows removing examples' 

  end
end

