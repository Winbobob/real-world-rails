# coding: utf-8

require 'spec_helper'
require 'transpec/syntax/rspec_configure'
require 'transpec/rspec_version'

module Transpec
  class Syntax
    describe RSpecConfigure do
      include_context 'parsed objects'
      include_context 'syntax object', RSpecConfigure, :rspec_configure

      let(:record) { rspec_configure.report.records.first }

      context 'when multiple configurations are added' do
        before do
          rspec_configure.stub(:rspec_rails?).and_return(true)
          rspec_configure.expose_dsl_globally = true
          rspec_configure.infer_spec_type_from_file_location!
        end

        let(:source) do
          <<-END
            RSpec.configure do |config|
            end
          END
        end

        let(:expected_source) do
          <<-END
            RSpec.configure do |config|
              # Setting this config option `false` removes rspec-core's monkey patching of the
              # top level methods like `describe`, `shared_examples_for` and `shared_context`
              # on `main` and `Module`. The methods are always available through the `RSpec`
              # module like `RSpec.describe` regardless of this setting.
              # For backwards compatibility this defaults to `true`.
              #
              # https://relishapp.com/rspec/rspec-core/v/3-0/docs/configuration/global-namespace-dsl
              config.expose_dsl_globally = true

              # rspec-rails 3 will no longer automatically infer an example group's spec type
              # from the file location. You can explicitly opt-in to the feature using this
              # config option.
              # To explicitly tag specs without using automatic inference, set the `:type`
              # metadata manually:
              #
              #     describe ThingsController, :type => :controller do
              #       # Equivalent to being in spec/controllers
              #     end
              config.infer_spec_type_from_file_location!
            end
          END
        end

        it 'properly adds them' 

      end

      describe '#convert_deprecated_options!' do
        before do
          rspec_configure.stub(:rspec_version).and_return(RSpecVersion.new('3.0.0'))
          rspec_configure.convert_deprecated_options!
        end

        [
          [:output,                   :output_stream],
          [:out,                      :output_stream],
          [:filename_pattern,         :pattern],
          [:backtrace_cleaner,        :backtrace_formatter],
          [:backtrace_clean_patterns, :backtrace_exclusion_patterns],
          [:warnings,                 :warnings?]
        ].each do |old_config, new_config|
          context "with `c.#{old_config}`" do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  if config.#{old_config} == something
                    do_something
                  end
                end
              END
            end

            let(:expected_source) do
              <<-END
                RSpec.configure do |config|
                  if config.#{new_config} == something
                    do_something
                  end
                end
              END
            end

            it "converts to `c.#{new_config}`" 


            it 'adds record of conversion ' \
               "`RSpec.configure { |c| c.#{old_config} }` -> " \
               "`RSpec.configure { |c| c.#{new_config} }`" do
              record.type.should == :conversion
              record.old_syntax.should == "RSpec.configure { |c| c.#{old_config} }"
              record.new_syntax.should == "RSpec.configure { |c| c.#{new_config} }"
            end
          end
        end

        [
          [:output,                   :output_stream],
          [:out,                      :output_stream],
          [:filename_pattern,         :pattern],
          [:backtrace_clean_patterns, :backtrace_exclusion_patterns],
          [:color_enabled,            :color]
        ].each do |old_config, new_config|
          context "with `c.#{old_config} = something`" do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.#{old_config} = something
                end
              END
            end

            let(:expected_source) do
              <<-END
                RSpec.configure do |config|
                  config.#{new_config} = something
                end
              END
            end

            it "converts to `c.#{new_config} = something`" 


            it 'adds record of conversion ' \
               "`RSpec.configure { |c| c.#{old_config} = something }` -> " \
               "`RSpec.configure { |c| c.#{new_config} = something }`" do
              record.type.should == :conversion
              record.old_syntax.should == "RSpec.configure { |c| c.#{old_config} = something }"
              record.new_syntax.should == "RSpec.configure { |c| c.#{new_config} = something }"
            end
          end
        end

        context 'with `c.color?(io)`' do
          let(:source) do
            <<-END
              RSpec.configure do |config|
                if config.color?($stdout)
                  do_something
                end
              end
            END
          end

          let(:expected_source) do
            <<-END
              RSpec.configure do |config|
                if config.color_enabled?($stdout)
                  do_something
                end
              end
            END
          end

          it 'convertes to `c.color_enabled?(io)`' 

        end
      end

      describe '#expose_dsl_globally=' do
        before do
          rspec_configure.expose_dsl_globally = false
        end

        context 'when #expose_dsl_globally= already exists' do
          context 'and the current value is same as the new value' do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.expose_dsl_globally = false
                end
              END
            end

            it 'does nothing' 


            it 'reports nothing' 

          end

          context 'and the current value is different from the new value' do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.expose_dsl_globally = true
                end
              END
            end

            let(:expected_source) do
              <<-END
                RSpec.configure do |config|
                  config.expose_dsl_globally = false
                end
              END
            end

            it 'rewrites the value' 


            it 'adds record of modification ' \
               '`RSpec.configure { |c| c.expose_dsl_globally = true }` -> ' \
               '`RSpec.configure { |c| c.expose_dsl_globally = false }`' do
              record.type.should == :modification
              record.old_syntax.should == 'RSpec.configure { |c| c.expose_dsl_globally = true }'
              record.new_syntax.should == 'RSpec.configure { |c| c.expose_dsl_globally = false }'
            end
          end
        end

        context 'when #expose_dsl_globally= does not exist' do
          let(:source) do
            <<-END
              RSpec.configure do |config|
              end
            END
          end

          let(:expected_source) do
            <<-END
              RSpec.configure do |config|
                # Setting this config option `false` removes rspec-core's monkey patching of the
                # top level methods like `describe`, `shared_examples_for` and `shared_context`
                # on `main` and `Module`. The methods are always available through the `RSpec`
                # module like `RSpec.describe` regardless of this setting.
                # For backwards compatibility this defaults to `true`.
                #
                # https://relishapp.com/rspec/rspec-core/v/3-0/docs/configuration/global-namespace-dsl
                config.expose_dsl_globally = false
              end
            END
          end

          it 'adds #expose_dsl_globally= statement along with comment' 


          it 'adds record of addition `RSpec.configure { |c| c.expose_dsl_globally = value }`' 

        end

        context 'when there are already some other configurations' do
          let(:source) do
            <<-END
              RSpec.configure do |config|
                config.foo = 1
              end
            END
          end

          let(:expected_source) do
            <<-END
              RSpec.configure do |config|
                config.foo = 1

                # Setting this config option `false` removes rspec-core's monkey patching of the
                # top level methods like `describe`, `shared_examples_for` and `shared_context`
                # on `main` and `Module`. The methods are always available through the `RSpec`
                # module like `RSpec.describe` regardless of this setting.
                # For backwards compatibility this defaults to `true`.
                #
                # https://relishapp.com/rspec/rspec-core/v/3-0/docs/configuration/global-namespace-dsl
                config.expose_dsl_globally = false
              end
            END
          end

          it 'adds the block after a blank line' 

        end
      end

      describe '#infer_spec_type_from_file_location!' do
        context 'in rspec-rails project' do
          before do
            rspec_configure.stub(:rspec_rails?).and_return(true)
            rspec_configure.infer_spec_type_from_file_location!
          end

          context 'when #infer_spec_type_from_file_location! does not exist' do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                end
              END
            end

            let(:expected_source) do
              <<-END
                RSpec.configure do |config|
                  # rspec-rails 3 will no longer automatically infer an example group's spec type
                  # from the file location. You can explicitly opt-in to the feature using this
                  # config option.
                  # To explicitly tag specs without using automatic inference, set the `:type`
                  # metadata manually:
                  #
                  #     describe ThingsController, :type => :controller do
                  #       # Equivalent to being in spec/controllers
                  #     end
                  config.infer_spec_type_from_file_location!
                end
              END
            end

            it 'adds #infer_spec_type_from_file_location! statement along with comment' 


            it 'adds record of addition `RSpec.configure { |c| c.expose_dsl_globally = value }`' 

          end

          context 'when #infer_spec_type_from_file_location! already exists' do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.infer_spec_type_from_file_location!
                end
              END
            end

            it 'does nothing' 


            it 'reports nothing' 

          end
        end

        context 'with runtime information' do
          include_context 'dynamic analysis objects'

          before do
            rspec_configure.infer_spec_type_from_file_location!
          end

          context 'when rspec-rails is loaded in the spec' do
            let(:source) do
              <<-END
                module RSpec
                  module Rails
                  end
                end

                RSpec.configure do |config|
                end
              END
            end

            let(:expected_source) do
              <<-END
                module RSpec
                  module Rails
                  end
                end

                RSpec.configure do |config|
                  # rspec-rails 3 will no longer automatically infer an example group's spec type
                  # from the file location. You can explicitly opt-in to the feature using this
                  # config option.
                  # To explicitly tag specs without using automatic inference, set the `:type`
                  # metadata manually:
                  #
                  #     describe ThingsController, :type => :controller do
                  #       # Equivalent to being in spec/controllers
                  #     end
                  config.infer_spec_type_from_file_location!
                end
              END
            end

            it 'adds #infer_spec_type_from_file_location! statement' 


            context 'when rspec-rails is not loaded in the spec' do
              let(:source) do
                <<-END
                  RSpec.configure do |config|
                  end
                END
              end

              it 'does nothing' 

            end
          end
        end
      end

      shared_examples '#syntaxes' do |framework_block_method|
        describe '#syntaxes' do
          subject { super().syntaxes }

          context 'when :should is enabled' do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.#{framework_block_method} :rspec do |c|
                    c.syntax = :should
                  end
                end
              END
            end

            it 'returns [:should]' 

          end

          context 'when :should and :expect are enabled' do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.#{framework_block_method} :rspec do |c|
                    c.syntax = [:should, :expect]
                  end
                end
              END
            end

            it 'returns [:should, :expect]' 

          end

          context 'when the syntax is specified indirectly with method or variable' do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.#{framework_block_method} :rspec do |c|
                    c.syntax = some_syntax
                  end
                end
              END
            end

            it 'raises error' 

          end

          context "when ##{framework_block_method} block does not exist" do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                end
              END
            end

            it 'returns empty array' 

          end

          context "when ##{framework_block_method} { #syntax= } does not exist" do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.#{framework_block_method} :rspec do |c|
                  end
                end
              END
            end

            it 'returns empty array' 

          end
        end
      end

      shared_examples '#syntaxes=' do |framework_block_method, block_arg_name|
        describe '#syntaxes=' do
          before do
            subject.syntaxes = syntaxes
          end

          let(:source) do
            <<-END
              RSpec.configure do |config|
                config.#{framework_block_method} :rspec do |c|
                  c.syntax = :should
                end
              end
            END
          end

          context 'when :expect is passed' do
            let(:syntaxes) { :expect }

            let(:expected_source) do
              <<-END
              RSpec.configure do |config|
                config.#{framework_block_method} :rspec do |c|
                  c.syntax = :expect
                end
              end
              END
            end

            it 'rewrites syntax specification to `c.syntax = :expect`' 

          end

          context 'when [:should, :expect] is passed' do
            let(:syntaxes) { [:should, :expect] }

            let(:expected_source) do
              <<-END
              RSpec.configure do |config|
                config.#{framework_block_method} :rspec do |c|
                  c.syntax = [:should, :expect]
                end
              end
              END
            end

            it 'rewrites syntax specification to `c.syntax = [:should, :expect]`' 

          end

          context "when ##{framework_block_method} { #syntax= } does not exist" do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.#{framework_block_method} :rspec do |c|
                  end
                end
              END
            end

            let(:syntaxes) { :expect }

            let(:expected_source) do
              <<-END
                RSpec.configure do |config|
                  config.#{framework_block_method} :rspec do |c|
                    c.syntax = :expect
                  end
                end
              END
            end

            it 'adds #syntax= statement' 

          end

          context "when ##{framework_block_method} block does not exist" do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                end
              END
            end

            let(:syntaxes) { :expect }

            let(:expected_source) do
              <<-END
                RSpec.configure do |config|
                  config.#{framework_block_method} :rspec do |#{block_arg_name}|
                    #{block_arg_name}.syntax = :expect
                  end
                end
              END
            end

            it "adds ##{framework_block_method} block " \
               'and #syntax= statement' do
              rewritten_source.should == expected_source
            end

            context 'when there are already some configurations' do
              let(:source) do
                <<-END
                  RSpec.configure do |config|
                    config.foo = 1
                  end
                END
              end

              let(:syntaxes) { :expect }

              let(:expected_source) do
                <<-END
                  RSpec.configure do |config|
                    config.foo = 1

                    config.#{framework_block_method} :rspec do |#{block_arg_name}|
                      #{block_arg_name}.syntax = :expect
                    end
                  end
                END
              end

              it 'adds the block after a blank line' 

            end
          end
        end
      end

      describe '#expectations' do
        subject { rspec_configure.expectations }

        include_examples '#syntaxes', :expect_with
        include_examples '#syntaxes=', :expect_with, :expectations
      end

      describe '#mocks' do
        subject(:mocks) { rspec_configure.mocks }

        include_examples '#syntaxes', :mock_with
        include_examples '#syntaxes=', :mock_with, :mocks

        describe '#yield_receiver_to_any_instance_implementation_blocks=' do
          before do
            mocks.yield_receiver_to_any_instance_implementation_blocks = value
          end

          context 'when #mock_with { #yield_receiver_to_any_instance_implementation_blocks= } exists' do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.mock_with :rspec do |c|
                    c.yield_receiver_to_any_instance_implementation_blocks = foo
                  end
                end
              END
            end

            context 'when true is passed' do
              let(:value) { true }

              let(:expected_source) do
                <<-END
                RSpec.configure do |config|
                  config.mock_with :rspec do |c|
                    c.yield_receiver_to_any_instance_implementation_blocks = true
                  end
                end
                END
              end

              it 'rewrites the setter argument to `true`' 


              # rubocop:disable LineLength
              it 'adds record of modification ' \
                 '`RSpec.configure { |c| c.mock_with :rspec { |m| m.yield_receiver_to_any_instance_implementation_blocks = foo } }` ->' \
                 '`RSpec.configure { |c| c.mock_with :rspec { |m| m.yield_receiver_to_any_instance_implementation_blocks = true } }`' do
                record.type.should == :modification
                record.old_syntax.should == 'RSpec.configure { |c| c.mock_with :rspec { |m| m.yield_receiver_to_any_instance_implementation_blocks = foo } }'
                record.new_syntax.should == 'RSpec.configure { |c| c.mock_with :rspec { |m| m.yield_receiver_to_any_instance_implementation_blocks = true } }'
              end
              # rubocop:enable LineLength
            end

            context 'when false is passed' do
              let(:value) { false }

              let(:expected_source) do
                <<-END
                RSpec.configure do |config|
                  config.mock_with :rspec do |c|
                    c.yield_receiver_to_any_instance_implementation_blocks = false
                  end
                end
                END
              end

              it 'rewrites the setter argument to `false`' 

            end
          end

          context 'when #mock_with { #yield_receiver_to_any_instance_implementation_blocks= } does not exist' do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                  config.mock_with :rspec do |c|
                  end
                end
              END
            end

            let(:value) { true }

            let(:expected_source) do
              <<-END
                RSpec.configure do |config|
                  config.mock_with :rspec do |c|
                    # In RSpec 3, `any_instance` implementation blocks will be yielded the receiving
                    # instance as the first block argument to allow the implementation block to use
                    # the state of the receiver.
                    # In RSpec 2.99, to maintain compatibility with RSpec 3 you need to either set
                    # this config option to `false` OR set this to `true` and update your
                    # `any_instance` implementation blocks to account for the first block argument
                    # being the receiving instance.
                    c.yield_receiver_to_any_instance_implementation_blocks = true
                  end
                end
              END
            end

            it 'adds #yield_receiver_to_any_instance_implementation_blocks= statement along with comment' 


            # rubocop:disable LineLength
            it 'adds record of addition ' \
               '`RSpec.configure { |c| c.mock_with :rspec { |m| m.yield_receiver_to_any_instance_implementation_blocks = true } }`' do
              record.type.should == :addition
              record.new_syntax.should == 'RSpec.configure { |c| c.mock_with :rspec { |m| m.yield_receiver_to_any_instance_implementation_blocks = true } }'
            end
            # rubocop:enable LineLength
          end

          context 'when #mock_with block does not exist' do
            let(:source) do
              <<-END
                RSpec.configure do |config|
                end
              END
            end

            let(:value) { true }

            let(:expected_source) do
              <<-END
                RSpec.configure do |config|
                  config.mock_with :rspec do |mocks|
                    # In RSpec 3, `any_instance` implementation blocks will be yielded the receiving
                    # instance as the first block argument to allow the implementation block to use
                    # the state of the receiver.
                    # In RSpec 2.99, to maintain compatibility with RSpec 3 you need to either set
                    # this config option to `false` OR set this to `true` and update your
                    # `any_instance` implementation blocks to account for the first block argument
                    # being the receiving instance.
                    mocks.yield_receiver_to_any_instance_implementation_blocks = true
                  end
                end
              END
            end

            it 'adds #mock_with block ' \
               'and #yield_receiver_to_any_instance_implementation_blocks= statement along with comment' do
              rewritten_source.should == expected_source
            end

            # rubocop:disable LineLength
            it 'adds record of addition ' \
               '`RSpec.configure { |c| c.mock_with :rspec { |m| m.yield_receiver_to_any_instance_implementation_blocks = true } }`' do
              record.type.should == :addition
              record.new_syntax.should == 'RSpec.configure { |c| c.mock_with :rspec { |m| m.yield_receiver_to_any_instance_implementation_blocks = true } }'
            end
            # rubocop:enable LineLength

            context "when RSpec.configure's block argument name is `mocks`" do
              let(:source) do
                <<-END
                  RSpec.configure do |mocks|
                  end
                END
              end

              let(:expected_source) do
                <<-END
                  RSpec.configure do |mocks|
                    mocks.mock_with :rspec do |config|
                      # In RSpec 3, `any_instance` implementation blocks will be yielded the receiving
                      # instance as the first block argument to allow the implementation block to use
                      # the state of the receiver.
                      # In RSpec 2.99, to maintain compatibility with RSpec 3 you need to either set
                      # this config option to `false` OR set this to `true` and update your
                      # `any_instance` implementation blocks to account for the first block argument
                      # being the receiving instance.
                      config.yield_receiver_to_any_instance_implementation_blocks = true
                    end
                  end
                END
              end

              it 'defines #mock_with block argument name as `config`' 

            end
          end
        end
      end

      context 'when multiple configurations are added' do
        before do
          rspec_configure.expose_dsl_globally = true
          rspec_configure.mocks.yield_receiver_to_any_instance_implementation_blocks = false
        end

        let(:source) do
          <<-END
            RSpec.configure do |config|
            end
          END
        end

        let(:expected_source) do
          <<-END
            RSpec.configure do |config|
              # Setting this config option `false` removes rspec-core's monkey patching of the
              # top level methods like `describe`, `shared_examples_for` and `shared_context`
              # on `main` and `Module`. The methods are always available through the `RSpec`
              # module like `RSpec.describe` regardless of this setting.
              # For backwards compatibility this defaults to `true`.
              #
              # https://relishapp.com/rspec/rspec-core/v/3-0/docs/configuration/global-namespace-dsl
              config.expose_dsl_globally = true

              config.mock_with :rspec do |mocks|
                # In RSpec 3, `any_instance` implementation blocks will be yielded the receiving
                # instance as the first block argument to allow the implementation block to use
                # the state of the receiver.
                # In RSpec 2.99, to maintain compatibility with RSpec 3 you need to either set
                # this config option to `false` OR set this to `true` and update your
                # `any_instance` implementation blocks to account for the first block argument
                # being the receiving instance.
                mocks.yield_receiver_to_any_instance_implementation_blocks = false
              end
            end
          END
        end

        it 'adds them properly' 

      end
    end
  end
end

