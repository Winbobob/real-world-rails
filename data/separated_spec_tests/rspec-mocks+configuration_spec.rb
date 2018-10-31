module RSpec
  module Mocks
    RSpec.describe Configuration do
      let(:config) { Configuration.new }
      let(:mod_1)  { Module.new }
      let(:mod_2)  { Module.new }

      def instance_methods_of(_mod)
        mod_1.instance_methods.map(&:to_sym)
      end

      it 'adds stub and should_receive to the given modules' 


      shared_examples "configuring the syntax" do
        def sandboxed
          orig_syntax = RSpec::Mocks.configuration.syntax
          yield
        ensure
          configure_syntax(orig_syntax)
        end

        around(:each) { |ex| sandboxed(&ex) }
        let(:dbl) { double }
        let(:should_methods)       { [:should_receive, :stub, :should_not_receive] }
        let(:should_class_methods) { [:any_instance] }
        let(:expect_methods)      { [:receive, :allow, :expect_any_instance_of, :allow_any_instance_of] }

        it 'defaults to enabling both the :should and :expect syntaxes' 


        context 'when configured to :expect' do
          before { configure_syntax :expect }

          it 'removes the should methods from every object' 


          it 'removes `any_instance` from every class' 


          it 'adds the expect methods to the example group context' 


          it 'reports that the syntax is :expect' 


          it 'is a no-op when configured a second time' 

        end

        context 'when configured to :should' do
          before { configure_syntax :should }

          it 'adds the should methods to every object' 


          it 'adds `any_instance` to every class' 


          it 'removes the expect methods from the example group context' 


          it 'reports that the syntax is :should' 


          it "does not warn about the should syntax" 


          it 'is a no-op when configured a second time' 

        end

        context 'when configured to [:should, :expect]' do
          before { configure_syntax [:should, :expect] }

          it 'adds the should methods to every object' 


          it 'adds `any_instance` to every class' 


          it 'adds the expect methods to the example group context' 


          it 'reports that both syntaxes are enabled' 


          it "does not warn about the should syntax" 

        end
      end

      describe "configuring rspec-mocks directly" do
        it_behaves_like "configuring the syntax" do
          def configure_syntax(syntax)
            RSpec::Mocks.configuration.syntax = syntax
          end

          def configured_syntax
            RSpec::Mocks.configuration.syntax
          end

          def configure_default_syntax
            RSpec::Mocks.configuration.reset_syntaxes_to_default
          end
        end
      end

      describe "configuring using the rspec-core config API" do
        it_behaves_like "configuring the syntax" do
          def configure_syntax(syntax)
            RSpec.configure do |rspec|
              rspec.mock_with :rspec do |c|
                c.syntax = syntax
              end
            end
          end

          def configured_syntax
            RSpec.configure do |rspec|
              rspec.mock_with :rspec do |c|
                return c.syntax
              end
            end
          end

          def configure_default_syntax
            RSpec.configure do |rspec|
              rspec.mock_with :rspec do |c|
                c.reset_syntaxes_to_default
              end
            end
          end
        end
      end

      describe "#when_declaring_verifying_double" do
        include_context 'with isolated configuration'

        it "captures the supplied blocks" 

      end
    end
  end
end

