# coding: utf-8

require 'spec_helper'
require 'transpec/cli'

module Transpec
  describe CLI do
    include FileHelper

    subject(:cli) { CLI.new }

    describe '.run' do
      it 'invokes #run' 

    end

    describe '#run' do
      include_context 'isolated environment'

      subject { cli.run(args) }

      let(:args) { [file_path] }
      let(:file_path) { 'spec/example_spec.rb' }
      let(:file_content) do
        <<-END
          describe 'something' do
            it 'is 1' 

          end
        END
      end

      before do
        cli.stub(:puts)
        cli.stub(:warn)
        DynamicAnalyzer.any_instance.stub(:analyze).and_return(DynamicAnalyzer::RuntimeData.new)
        create_file(file_path, file_content)
      end

      shared_examples 'rewrites files' do
        it 'rewrites files' 


        it 'returns true' 

      end

      shared_examples 'aborts processing' do
        it 'aborts processing' 

      end

      shared_examples 'generates commit message' do
        it 'generates commit message to .git/COMMIT_EDITMSG' 

      end

      shared_examples 'does not generate commit message' do
        it 'does not generate commit message' 

      end

      context 'when git is available' do
        before { Git.stub(:command_available?).and_return(true) }

        context 'and inside of a repository' do
          include_context 'inside of git repository'

          context 'and the repository is not clean' do
            before { Git.stub(:clean?).and_return(false) }

            context 'and --force option is not specified' do
              include_examples 'aborts processing'
              include_examples 'does not generate commit message'

              it 'warns and suggests the use of -f/--force option' 

            end

            context 'and --force option is specified' do
              before { args << '--force' }
              include_examples 'rewrites files'
              include_examples 'generates commit message'
            end
          end

          context 'and the repository is clean' do
            before { Git.stub(:clean?).and_return(true) }

            include_examples 'rewrites files'
            include_examples 'generates commit message'

            context 'and no conversion is done' do
              let(:file_content) { '' }
              include_examples 'does not generate commit message'
            end
          end
        end

        context 'and not inside of a repository' do
          include_examples 'rewrites files'
          include_examples 'does not generate commit message'
        end
      end

      context 'when git is not available' do
        before { Git.stub(:command_available?).and_return(false) }
        include_examples 'rewrites files'
        include_examples 'does not generate commit message'
      end

      context "when the project's RSpec dependency is older than the required version" do
        before do
          cli.project.stub(:rspec_version).and_return(RSpecVersion.new('2.13.0'))
        end

        include_examples 'aborts processing'

        it 'warns of the RSpec version' 

      end

      context 'when the project has a Gemfile but no Gemfile.lock' do
        before do
          create_file('Gemfile', '')
        end

        include_examples 'aborts processing'

        it 'warns of the missing Gemfile.lock' 

      end

      context 'when analysis error is raised in the dynamic analysis' do
        before do
          DynamicAnalyzer.any_instance.stub(:analyze).and_raise(DynamicAnalyzer::AnalysisError)
        end

        include_examples 'aborts processing'
      end

      context 'when a syntax error is raised while processing files' do
        let(:args) { [invalid_syntax_file_path, valid_syntax_file_path] }
        let(:invalid_syntax_file_path) { 'spec/invalid_example.rb' }
        let(:valid_syntax_file_path) { 'spec/valid_example.rb' }

        before do
          create_file(invalid_syntax_file_path, 'This is invalid syntax <')
          create_file(valid_syntax_file_path, 'this_is_valid_syntax')
        end

        it 'warns of the error' 


        it 'continues processing files' 

      end

      context 'when an encoding error is raised while processing files' do
        let(:args) { [invalid_encoding_file_path, valid_encoding_file_path] }
        let(:invalid_encoding_file_path) { 'spec/invalid_example.rb' }
        let(:valid_encoding_file_path) { 'spec/valid_example.rb' }

        before do
          create_file(invalid_encoding_file_path, <<-END)
            # coding: utf-8
            \xff
          END

          create_file(valid_encoding_file_path, 'this_is_valid_encoding')
        end

        it 'warns of the error' 


        it 'continues processing files' 

      end

      context 'when any other error is raised while running' do
        let(:args) { ['non-existent-file'] }

        it 'does not catch the error' 

      end

      context 'when -s/--skip-dynamic-analysis option is specified' do
        let(:args) { ['--skip-dynamic-analysis', file_path] }

        it 'skips dynamic analysis' 

      end

      context 'when -c/--rspec-command option is specified' do
        include_context 'inside of git repository'

        let(:args) { ['--force', '--rspec-command', 'rspec --profile'] }

        it 'passes the command to DynamicAnalyzer' 

      end
    end

    describe '#convert_spec' do
      include_context 'isolated environment'

      let(:processed_source) do
        path = 'example.rb'
        create_file(path, source)
        ProcessedSource.from_file(path)
      end

      let(:spec_suite) { SpecSuite.new }

      before do
        cli.stub(:puts)
      end

      context 'when the source has a monkey-patched expectation outside of example group context' do
        let(:source) do
          <<-END
            describe 'example group' do
              class Klass
                def some_method
                  1.should == 1
                end
              end

              it 'is an example' 

            end
          END
        end

        it 'warns of the conversion error' 

      end

      context 'when it did a less accurate conversion due to a lack of runtime information' do
        let(:source) do
          <<-END
            describe 'example group' do
              it 'is an example' 

            end
          END
        end

        it 'warns of less accurate conversion' 

      end

      context 'when both conversion errors and less accurate records are reported' do
        let(:source) do
          <<-END
            describe 'example group' do
              it 'is first' 


              class Klass
                def second
                  2.should == 2
                end
              end

              it 'is an example' 


              it 'is third' 

            end
          END
        end

        it 'displays them in order of line number' 

      end
    end
  end
end

