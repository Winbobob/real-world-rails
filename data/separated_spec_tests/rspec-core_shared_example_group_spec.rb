require 'rspec/support/spec/in_sub_process'

module RandomTopLevelModule
  def self.setup!
    RSpec.shared_examples_for("top level in module") {}
  end
end

module RSpec
  module Core
    RSpec.describe SharedExampleGroup do
      include RSpec::Support::InSubProcess
      let(:registry) { RSpec.world.shared_example_group_registry }

      ExampleModule = Module.new
      ExampleClass  = Class.new

      it 'does not add a bunch of private methods to Module' 


      before do
        # this is a work around as SharedExampleGroup is not world safe
        RandomTopLevelModule.setup!
      end

      RSpec::Matchers.define :have_example_descriptions do |*descriptions|
        match do |example_group|
          example_group.examples.map(&:description) == descriptions
        end

        failure_message do |example_group|
          actual = example_group.examples.map(&:description)
          "expected #{example_group.name} to have descriptions: #{descriptions.inspect} but had #{actual.inspect}"
        end
      end

      %w[shared_examples shared_examples_for shared_context].each do |shared_method_name|
        describe shared_method_name do
          let(:group) { RSpec.describe('example group') }

          before do
            RSpec.configuration.shared_context_metadata_behavior = :apply_to_host_groups
          end

          define_method :define_shared_group do |*args, &block|
            group.send(shared_method_name, *args, &block)
          end

          define_method :define_top_level_shared_group do |*args, &block|
            RSpec.send(shared_method_name, *args, &block)
          end

          def find_implementation_block(registry, scope, name)
            registry.find([scope], name).definition
          end

          it "is exposed to the global namespace when expose_dsl_globally is enabled" 


          it "is not exposed to the global namespace when monkey patching is disabled" 


          it "displays a warning when adding an example group without a block", :unless => RUBY_VERSION == '1.8.7' 


          it "displays a warning when adding an example group without a block", :if => RUBY_VERSION == '1.8.7' 


          it 'displays a warning when adding a second shared example group with the same name' 


          it 'displays a helpful message when you define a shared example group in *_spec.rb file' 


          it 'works with top level defined examples in modules' 


          it 'generates a named (rather than anonymous) module' 


          ["name", :name, ExampleModule, ExampleClass].each do |object|
            type = object.class.name.downcase
            context "given a #{type}" do
              it "captures the given #{type} and block in the collection of shared example groups" 

            end
          end

          context "when `config.shared_context_metadata_behavior == :trigger_inclusion`" do
            before do
              RSpec.configuration.shared_context_metadata_behavior = :trigger_inclusion
            end

            context "given a hash" do
              it "includes itself in matching example groups" 

            end

            context "given a string and a hash" do
              it "captures the given string and block in the World's collection of shared example groups" 


              it "delegates include on configuration" 

            end

            it "displays a warning when adding a second shared example group with the same name" 

          end

          context "when `config.shared_context_metadata_behavior == :apply_to_host_groups`" do
            before do
              RSpec.configuration.shared_context_metadata_behavior = :apply_to_host_groups
            end

            it "does not auto-include the shared group based on passed metadata" 


            it "adds passed metadata to including groups and examples" 


            it "requires a valid name" 


            it "does not overwrite existing metadata values set at that level when included via `include_context`" 


            it "overwrites existing metadata values set at a parent level when included via `include_context`" 


            it "propagates conflicted metadata to examples defined in the shared group when included via `it_behaves_like` since it makes a nested group" 

          end

          context "when the group is included via `config.include_context` and matching metadata" do
            before do
              # To ensure we don't accidentally include shared contexts the
              # old way in this context, we disable the option here.
              RSpec.configuration.shared_context_metadata_behavior = :apply_to_host_groups
            end

            describe "when it has a `let` and applies to an individual example via metadata" do
              it 'defines the `let` method correctly' 

            end

            describe "hooks for individual examples that have matching metadata" do
              before do
                skip "These specs pass in 2.0 mode on JRuby 1.7.8 but fail on " \
                     "1.7.15 when the entire spec suite runs. They pass on " \
                     "1.7.15 when this one spec file is run or if we filter to " \
                     "just them. Given that 2.0 support on JRuby 1.7 is " \
                     "experimental, we're just skipping these specs."
              end if RUBY_VERSION == "2.0.0" && RSpec::Support::Ruby.jruby?

              it 'runs them' 


              it 'runs the `after(:context)` hooks even if the `before(:context)` hook raises an error' 

            end
          end

          context "when called at the top level" do
            before do
              RSpec.__send__(shared_method_name, "shared context") do
                example "shared spec"
              end
            end

            it 'is available for inclusion from a top level group' 


            it 'is available for inclusion from a nested example group' 


            it 'is trumped by a shared group with the same name that is defined in the including context' 


            it 'is trumped by a shared group with the same name that is defined in a parent group' 

          end

          context "when called from within an example group" do
            define_method :in_group_with_shared_group_def do |&block|
              RSpec.describe "an example group" do
                __send__ shared_method_name, "shared context" do
                  example "shared spec"
                end

                module_exec(&block)
              end
            end

            it 'is available for inclusion within that group' 


            it 'is available for inclusion in a child group' 


            it 'is not available for inclusion in a different top level group' 


            it 'is not available for inclusion in a nested group of a different top level group' 


            it 'trumps a shared group with the same name defined at the top level' 


            it 'is trumped by a shared group with the same name that is defined in the including context' 


            it 'is trumped by a shared group with the same name that is defined in nearer parent group' 

          end
        end
      end
    end
  end
end

