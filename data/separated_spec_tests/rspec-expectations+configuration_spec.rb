module RSpec
  module Expectations
    RSpec.describe Configuration do
      let(:config) { Configuration.new }

      describe "#backtrace_formatter" do
        let(:original_backtrace) { %w[ clean-me/a.rb other/file.rb clean-me/b.rb ] }
        let(:cleaned_backtrace)  { %w[ other/file.rb ] }

        let(:formatted_backtrace) do
          config.backtrace_formatter.format_backtrace(original_backtrace)
        end

        before do
          @old_patterns = RSpec.configuration.backtrace_exclusion_patterns
          @orig_full_backtrace = RSpec.configuration.full_backtrace?
          RSpec.configuration.full_backtrace = false
          RSpec.configuration.backtrace_exclusion_patterns = [/clean-me/]
        end

        after do
          RSpec.configuration.backtrace_exclusion_patterns = @old_patterns
          RSpec.configuration.full_backtrace = @orig_full_backtrace
        end

        it "defaults to rspec-core's backtrace formatter when rspec-core is loaded" 


        it "defaults to a null formatter when rspec-core is not loaded" 


        it "can be set to another backtrace formatter" 

      end

      context 'on an interpreter that does not provide BasicObject', :uses_should, :unless => defined?(::BasicObject) do
        def with_delegate
          in_sub_process_if_possible do
            require 'delegate'
            RSpec::Expectations::Syntax.disable_should(Delegator)
            yield
          end
        end

        let(:klass) do
          Class.new(SimpleDelegator) do
            def delegated?; true; end
          end
        end

        let(:instance) { klass.new(Object.new) }

        it 'provides a means to manually add it Delegator' 

      end

      describe "#include_chain_clauses_in_custom_matcher_descriptions?" do
        it "is false by default" 


        it "can be set to true" 


        it "can be set back to false" 

      end

      describe "#max_formatted_output_length=" do
        before do
          @orig_max_formatted_output_length = RSpec::Support::ObjectFormatter.default_instance.max_formatted_output_length
        end

        after do
          config.max_formatted_output_length = @orig_max_formatted_output_length
        end

        let(:object_with_large_inspect_string) { Struct.new(:value).new("a"*300) }

        it "sets the maximum object formatter length" 


        it "formats the entire object when set to nil" 

      end

      describe "#warn_about_potential_false_positives?" do
        it "is true by default" 


        it "can be set to false" 


        it "can be set back to true" 

      end

      describe '#on_potential_false_positives' do
        it 'is set to :warn by default' 


        it 'can be set to :nothing' 


        it 'can be set back to :warn' 


        it 'can be set to :raise' 

      end

      shared_examples "configuring the expectation syntax" do
        before do
          @orig_syntax = RSpec::Matchers.configuration.syntax
        end

        after do
          configure_syntax(@orig_syntax)
        end

        it 'can limit the syntax to :should' 


        it 'is a no-op when configured to :should twice' 


        it 'can limit the syntax to :expect' 


        it 'is a no-op when configured to :expect twice' 


        describe "`:should` being enabled by default deprecation" do
          before { configure_default_syntax }

          it "warns when the should syntax is called by default" 


          it "includes the call site in the deprecation warning by default" 


          it "does not warn when only the should syntax is explicitly configured" 


          it "does not warn when both the should and expect syntaxes are explicitly configured" 

        end

        it 'can re-enable the :should syntax' 


        it 'can re-enable the :expect syntax' 

      end

      def configure_default_syntax
        RSpec::Matchers.configuration.reset_syntaxes_to_default
      end

      describe "configuring rspec-expectations directly" do
        it_behaves_like "configuring the expectation syntax" do
          def configure_syntax(syntax)
            RSpec::Matchers.configuration.syntax = syntax
          end

          def configured_syntax
            RSpec::Matchers.configuration.syntax
          end
        end
      end

      describe "configuring using the rspec-core config API" do
        it_behaves_like "configuring the expectation syntax" do
          def configure_syntax(syntax)
            RSpec.configure do |rspec|
              rspec.expect_with :rspec do |c|
                c.syntax = syntax
              end
            end
          end


          def configured_syntax
            RSpec.configure do |rspec|
              rspec.expect_with :rspec do |c|
                return c.syntax
              end
            end
          end
        end
      end

      it 'enables both syntaxes by default' 

    end
  end
end

