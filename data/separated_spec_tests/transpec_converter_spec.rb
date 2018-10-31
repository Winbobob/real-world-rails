# coding: utf-8

require 'spec_helper'
require 'transpec/converter'

module Transpec
  describe Converter do
    subject(:converter) { Converter.new(spec_suite, config) }
    let(:spec_suite) { double('spec_suite', project: project, runtime_data: nil).as_null_object }
    let(:project) { Project.new }
    let(:config) { Config.new }
    let(:rspec_version) { Transpec.required_rspec_version }

    before do
      converter.stub(:rspec_version).and_return(rspec_version)
    end

    describe '#convert_file!' do
      include_context 'isolated environment'

      let(:file_path) { 'sample_spec.rb' }

      before do
        File.write(file_path, 'This is a spec')
        File.utime(0, 0, file_path)
        converter.stub(:rewrite).and_return('This is the converted spec')
      end

      context 'when a file path is passed' do
        it 'overwrites the file' 

      end

      context 'when a processed source is passed' do
        let(:processed_source) { ProcessedSource.from_file(file_path) }

        it 'overwrites the file that the processed source was derived from' 

      end

      context 'when the source is not needed to be converted' do
        before do
          converter.stub(:rewrite).and_return('This is a spec')
        end

        it 'does not touch the file' 

      end
    end

    describe '#convert_source' do
      subject { converter.convert_source(source) }

      let(:source) do
        <<-END
          describe 'example group' do
            it 'is an example' 

          end
        END
      end

      it 'dispatches conversion target standalone syntax objects to each handler method' 


      it 'dispatches conversion target non-standalone syntax objects to each handler method' 


      context 'when the source is invalid' do
        let(:source) { '<' }

        it 'raises Parser::SyntaxError' 

      end

      context 'when the source has overlapped conversion targets', rspec: 2 do
        let(:source) do
          <<-END
            describe 'example group' do
              it 'is an example' 

            end
          END
        end

        let(:expected_source) do
          <<-END
            describe 'example group' do
              it 'is an example' 

            end
          END
        end

        before do
          config.conversion[:stub_with_hash] = true
        end

        it 'converts all targets properly' 


        it 'adds records for only completed conversions' 

      end

      context 'when the source has a monkey-patched expectation outside of example group context' do
        before do
          config.conversion[:should] = true
          converter.stub(:warn)
        end

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

        it 'does not convert the expectation to non-monkey-patch syntax' 


        it 'adds the conversion error to the report' 

      end
    end

    describe '#process_should' do
      let(:should_object) { double('should_object', raise_error_matcher: raise_error_object).as_null_object }
      let(:raise_error_object) { double('raise_error_object').as_null_object }

      context 'when Config#convert_should? is true' do
        before { config.conversion[:should] = true }

        context 'and Config#negative_form_of_to is "not_to"' do
          before { config.negative_form_of_to = 'not_to' }

          it 'invokes Should#expectize! with "not_to"' 

        end

        context 'and Config#negative_form_of_to is "to_not"' do
          before { config.negative_form_of_to = 'to_not' }

          it 'invokes Should#expectize! with "to_not"' 

        end
      end

      context 'when Config#convert_should? is false' do
        before { config.conversion[:should] = false }

        it 'does not invoke Should#expectize!' 

      end
    end

    describe '#process_oneliner_should' do
      let(:should_object) do
        double(
          'oneliner_should_object',
          raise_error_matcher: raise_error_object,
                 have_matcher: have_object
        ).as_null_object
      end

      let(:raise_error_object) { double('raise_error_object').as_null_object }
      let(:have_object) { double('have_object').as_null_object }

      shared_examples 'does nothing' do
        it 'does nothing' 

      end

      shared_examples 'invokes OnelinerShould#expectize! if available' do
        context 'and RSpecVersion#oneliner_is_expected_available? returns true' do
          before { rspec_version.stub(:oneliner_is_expected_available?).and_return(true) }

          it 'invokes OnelinerShould#expectize!' 

        end

        context 'and RSpecVersion#oneliner_is_expected_available? returns false' do
          before { rspec_version.stub(:oneliner_is_expected_available?).and_return(false) }
          include_examples 'does nothing'
        end
      end

      shared_examples 'converts to standard expecatations' do
        context 'and Config#convert_should? is true' do
          before { config.conversion[:should] = true }

          it 'invokes OnelinerShould#convert_have_items_to_standard_expect!' 

        end

        context 'and Config#convert_should? is false' do
          before { config.conversion[:should] = false }

          it 'invokes OnelinerShould#convert_have_items_to_standard_should!' 

        end
      end

      context 'when Config#convert_oneliner? is true' do
        before { config.conversion[:oneliner] = true }

        context 'and the #have matcher is conversion target' do
          before do
            have_object.stub(:conversion_target?).and_return(true)
          end

          context 'and Config#convert_have_items? is true' do
            before { config.conversion[:have_items] = true }
            include_examples 'converts to standard expecatations'
          end

          context 'and Config#convert_have_items? is false' do
            before { config.conversion[:have_items] = false }
            include_examples 'invokes OnelinerShould#expectize! if available'
          end
        end

        context 'and the #have matcher is not conversion target' do
          before do
            have_object.stub(:conversion_target?).and_return(false)
          end

          context 'and Config#convert_have_items? is true' do
            before { config.conversion[:have_items] = true }
            include_examples 'invokes OnelinerShould#expectize! if available'
          end

          context 'and Config#convert_have_items? is false' do
            before { config.conversion[:have_items] = false }
            include_examples 'invokes OnelinerShould#expectize! if available'
          end
        end
      end

      context 'when Config#convert_oneliner? is false' do
        before { config.conversion[:oneliner] = false }

        context 'and the #have matcher is conversion target' do
          before do
            have_object.stub(:conversion_target?).and_return(true)
          end

          context 'and Config#convert_have_items? is true' do
            before { config.conversion[:have_items] = true }
            include_examples 'converts to standard expecatations'
          end

          context 'and Config#convert_have_items? is false' do
            before { config.conversion[:have_items] = false }
            include_examples 'does nothing'
          end
        end

        context 'and the #have matcher is not conversion target' do
          before do
            have_object.stub(:conversion_target?).and_return(false)
          end

          context 'and Config#convert_have_items? is true' do
            before { config.conversion[:have_items] = true }
            include_examples 'does nothing'
          end

          context 'and Config#convert_have_items? is false' do
            before { config.conversion[:have_items] = false }
            include_examples 'does nothing'
          end
        end
      end
    end

    describe '#process_should_receive' do
      let(:should_receive_object) { double('should_receive_object').as_null_object }

      shared_examples 'does nothing' do
        it 'does nothing' 

      end

      context 'when ShouldReceive#useless_expectation? returns true' do
        before { should_receive_object.stub(:useless_expectation?).and_return(true) }

        context 'and Config#convert_deprecated_method? is true' do
          before { config.conversion[:deprecated] = true }

          context 'and Config#convert_stub? is true' do
            before { config.conversion[:stub] = true }

            [true, false].each do |convert_should_receive|
              context "and Config#convert_should_receive? is #{convert_should_receive}" do
                before { config.conversion[:should_receive] = convert_should_receive }

                context 'and Config#negative_form_of_to is "not_to"' do
                  before { config.negative_form_of_to = 'not_to' }

                  it 'invokes ShouldReceive#allowize_useless_expectation! with "not_to"' 

                end

                context 'and Config#negative_form_of_to is "to_not"' do
                  before { config.negative_form_of_to = 'to_not' }

                  it 'invokes ShouldReceive#allowize_useless_expectation! with "to_not"' 

                end
              end
            end
          end

          context 'and Config#convert_stub? is false' do
            before { config.conversion[:stub] = false }

            [true, false].each do |convert_should_receive|
              context "and Config#convert_should_receive? is #{convert_should_receive}" do
                before { config.conversion[:should_receive] = convert_should_receive }

                it 'invokes ShouldReceive#stubize_useless_expectation!' 

              end
            end
          end
        end

        context 'and Config#convert_deprecated_method? is false' do
          before { config.conversion[:deprecated] = false }

          [true, false].each do |convert_stub|
            context "and Config#convert_stub? is #{convert_stub}" do
              before { config.conversion[:stub] = convert_stub }

              context 'and Config#convert_should_receive? is true' do
                before { config.conversion[:should_receive] = true }

                context 'and Config#negative_form_of_to is "not_to"' do
                  before { config.negative_form_of_to = 'not_to' }

                  it 'invokes ShouldReceive#expectize! with "not_to"' 

                end

                context 'and Config#negative_form_of_to is "to_not"' do
                  before { config.negative_form_of_to = 'to_not' }

                  it 'invokes ShouldReceive#expectize! with "to_not"' 

                end
              end

              context 'and Config#convert_should_receive? is false' do
                before { config.conversion[:should_receive] = false }

                include_examples 'does nothing'
              end
            end
          end
        end
      end

      context 'when ShouldReceive#useless_expectation? returns false' do
        before { should_receive_object.stub(:useless_expectation?).and_return(false) }

        context 'and Config#convert_should_receive? is true' do
          before { config.conversion[:should_receive] = true }

          [true, false].each do |convert_deprecated_method|
            context "and Config#convert_deprecated_method? is #{convert_deprecated_method}" do
              before { config.conversion[:deprecated] = convert_deprecated_method }

              [true, false].each do |convert_stub|
                context "and Config#convert_stub? is #{convert_stub}" do
                  before { config.conversion[:stub] = convert_stub }

                  context 'and Config#negative_form_of_to is "not_to"' do
                    before { config.negative_form_of_to = 'not_to' }

                    it 'invokes ShouldReceive#expectize! with "not_to"' 

                  end

                  context 'and Config#negative_form_of_to is "to_not"' do
                    before { config.negative_form_of_to = 'to_not' }

                    it 'invokes ShouldReceive#expectize! with "to_not"' 

                  end
                end
              end
            end
          end
        end

        context 'and Config#convert_should_receive? is false' do
          before { config.conversion[:should_receive] = false }

          [true, false].each do |convert_deprecated_method|
            context "and Config#convert_deprecated_method? is #{convert_deprecated_method}" do
              before { config.conversion[:deprecated] = convert_deprecated_method }

              [true, false].each do |convert_stub|
                context "and Config#convert_stub? is #{convert_stub}" do
                  before { config.conversion[:stub] = convert_stub }

                  include_examples 'does nothing'
                end
              end
            end
          end
        end
      end
    end

    describe '#process_method_stub' do
      let(:method_stub_object) { double('method_stub_object').as_null_object }

      shared_examples 'invokes MethodStub#allowize!' do
        it 'invokes MethodStub#allowize!' 

      end

      shared_examples 'does not invoke MethodStub#allowize!' do
        it 'does not invoke MethodStub#allowize!' 

      end

      shared_examples 'invokes MethodStub#convert_deprecated_method!' do
        it 'invokes MethodStub#convert_deprecated_method!' 

      end

      shared_examples 'does not invoke MethodStub#convert_deprecated_method!' do
        it 'does not invoke MethodStub#convert_deprecated_method!' 

      end

      shared_examples 'invokes MethodStub#remove_no_message_allowance!' do
        it 'invokes MethodStub#remove_no_message_allowance!' 

      end

      shared_examples 'does not invoke MethodStub#remove_no_message_allowance!' do
        it 'does not invoke MethodStub#remove_no_message_allowance!' 

      end

      context 'when Config#convert_stub? is true' do
        before { config.conversion[:stub] = true }

        context 'and Config#convert_deprecated_method? is true' do
          before { config.conversion[:deprecated] = true }

          context 'and MethodStub#hash_arg? is false' do
            before { method_stub_object.stub(:hash_arg?).and_return(false) }
            include_examples 'invokes MethodStub#allowize!'
            include_examples 'does not invoke MethodStub#convert_deprecated_method!'
            include_examples 'invokes MethodStub#remove_no_message_allowance!'
          end

          context 'and MethodStub#hash_arg? is true' do
            before { method_stub_object.stub(:hash_arg?).and_return(true) }

            context 'and Config#convert_stub_with_hash? is true' do
              before { config.conversion[:stub_with_hash] = true }

              context 'and RSpecVersion#receive_messages_available? is true' do
                before { rspec_version.stub(:receive_messages_available?).and_return(true) }
                include_examples 'invokes MethodStub#allowize!'
                include_examples 'does not invoke MethodStub#convert_deprecated_method!'
                include_examples 'invokes MethodStub#remove_no_message_allowance!'
              end

              context 'and RSpecVersion#receive_messages_available? is false' do
                before { rspec_version.stub(:receive_messages_available?).and_return(false) }
                include_examples 'invokes MethodStub#allowize!'
                include_examples 'does not invoke MethodStub#convert_deprecated_method!'
                include_examples 'invokes MethodStub#remove_no_message_allowance!'
              end
            end

            context 'and Config#convert_stub_with_hash? is false' do
              before { config.conversion[:stub_with_hash] = false }

              context 'and RSpecVersion#receive_messages_available? is true' do
                before { rspec_version.stub(:receive_messages_available?).and_return(true) }
                include_examples 'invokes MethodStub#allowize!'
                include_examples 'does not invoke MethodStub#convert_deprecated_method!'
                include_examples 'invokes MethodStub#remove_no_message_allowance!'
              end

              context 'and RSpecVersion#receive_messages_available? is false' do
                before { rspec_version.stub(:receive_messages_available?).and_return(false) }
                include_examples 'does not invoke MethodStub#allowize!'
                include_examples 'invokes MethodStub#convert_deprecated_method!'
                include_examples 'invokes MethodStub#remove_no_message_allowance!'
              end
            end
          end
        end

        context 'and Config#convert_deprecated_method? is false' do
          before do
            config.conversion[:deprecated] = false
            method_stub_object.stub(:hash_arg?).and_return(false)
          end

          include_examples 'invokes MethodStub#allowize!'
          include_examples 'does not invoke MethodStub#convert_deprecated_method!'
          include_examples 'does not invoke MethodStub#remove_no_message_allowance!'
        end
      end

      context 'when Config#convert_stub? is false' do
        before { config.conversion[:stub] = false }

        context 'and Config#convert_deprecated_method? is true' do
          before { config.conversion[:deprecated] = true }

          include_examples 'does not invoke MethodStub#allowize!'
          include_examples 'invokes MethodStub#convert_deprecated_method!'
          include_examples 'invokes MethodStub#remove_no_message_allowance!'
        end

        context 'and Config#convert_deprecated_method? is false' do
          before { config.conversion[:deprecated] = false }

          include_examples 'does not invoke MethodStub#allowize!'
          include_examples 'does not invoke MethodStub#convert_deprecated_method!'
          include_examples 'does not invoke MethodStub#remove_no_message_allowance!'
        end
      end
    end

    describe '#process_double' do
      let(:double_object) { double('double_object').as_null_object }

      context 'when Config#convert_deprecated_method? is true' do
        before { config.conversion[:deprecated] = true }

        it 'invokes Double#convert_to_double!' 

      end

      context 'when Config#convert_deprecated_method? is false' do
        before { config.conversion[:deprecated] = false }

        it 'does nothing' 

      end
    end

    describe '#process_operator' do
      let(:operator_object) { double('operator_object').as_null_object }

      context 'when Config#convert_should? is true' do
        before { config.conversion[:should] = true }

        context 'and Config#parenthesize_matcher_arg is true' do
          before { config.parenthesize_matcher_arg = true }

          it 'invokes Operator#convert_operator! with true' 

        end

        context 'and Config#parenthesize_matcher_arg is false' do
          before { config.parenthesize_matcher_arg = false }

          it 'invokes Should#expectize! with false as second argument' 

        end

        context 'and the expectation is one-liner should' do
          before do
            operator_object.stub(:expectation).and_return(Syntax::OnelinerShould.new(nil))
          end

          context 'and RSpecVersion#oneliner_is_expected_available? returns true' do
            before { rspec_version.stub(:oneliner_is_expected_available?).and_return(true) }

            it 'invokes Operator#convert_operator!' 

          end

          context 'and RSpecVersion#oneliner_is_expected_available? returns false' do
            before { rspec_version.stub(:oneliner_is_expected_available?).and_return(false) }

            it 'does not invoke Operator#convert_operator!' 

          end
        end
      end

      context 'when Config#convert_should? is false' do
        before { config.conversion[:should] = false }

        it 'does not invoke Operator#convert_operator!' 

      end
    end

    describe '#process_be_boolean' do
      let(:be_boolean_object) { double('be_boolean_object').as_null_object }

      context 'when RSpecVersion#be_truthy_available? returns true' do
        before { rspec_version.stub(:be_truthy_available?).and_return(true) }

        context 'and Config#convert_deprecated_method? is true' do
          before { config.conversion[:deprecated] = true }

          context 'and Config#boolean_matcher_type is :conditional' do
            before { config.boolean_matcher_type = :conditional }

            context 'and Config#form_of_be_falsey is "be_falsey"' do
              before { config.form_of_be_falsey = 'be_falsey' }

              it 'invokes BeBoolean#convert_to_conditional_matcher! with "be_falsey"' 

            end

            context 'and Config#form_of_be_falsey is "be_falsy"' do
              before { config.form_of_be_falsey = 'be_falsy' }

              it 'invokes BeBoolean#convert_to_conditional_matcher! with "be_falsy"' 

            end
          end

          context 'and Config#boolean_matcher_type is :exact' do
            before { config.boolean_matcher_type = :exact }

            it 'invokes BeBoolean#convert_to_exact_matcher!' 

          end
        end

        context 'and Config#convert_deprecated_method? is false' do
          before { config.conversion[:deprecated] = false }

          it 'does nothing' 

        end
      end

      context 'when RSpecVersion#be_truthy_available? returns true' do
        before { rspec_version.stub(:be_truthy_available?).and_return(false) }

        it 'does nothing' 

      end
    end

    describe '#process_be_close' do
      let(:be_close_object) { double('be_close_object').as_null_object }

      context 'when Config#convert_deprecated_method? is true' do
        before { config.conversion[:deprecated] = true }

        it 'invokes BeClose#convert_to_be_within!' 

      end

      context 'when Config#convert_deprecated_method? is false' do
        before { config.conversion[:deprecated] = false }

        it 'does nothing' 

      end
    end

    describe '#process_have' do
      let(:have_object) { double('have_object').as_null_object }

      context 'when Config#convert_have_items? is true' do
        before { config.conversion[:have_items] = true }

        context 'and Config#parenthesize_matcher_arg is true' do
          before { config.parenthesize_matcher_arg = true }

          it 'invokes Have#convert_to_standard_expectation! with true' 

        end

        context 'and Config#parenthesize_matcher_arg is false' do
          before { config.parenthesize_matcher_arg = false }

          it 'invokes Have#convert_to_standard_expectation! with false' 

        end
      end

      context 'when Config#convert_have_items? is false' do
        before { config.conversion[:have_items] = false }

        it 'does not invoke Have#convert_to_standard_expectation!' 

      end
    end

    describe '#process_hook' do
      let(:hook_object) { double('hook_object').as_null_object }

      context 'when Config#convert_hook_scope? is true' do
        before { config.conversion[:hook_scope] = true }

        context 'when RSpecVersion#hook_scope_alias_available? returns true' do
          before { rspec_version.stub(:hook_scope_alias_available?).and_return(true) }

          it 'invokes Hook#convert_scope_name!' 

        end

        context 'when RSpecVersion#hook_scope_alias_available? returns false' do
          before { rspec_version.stub(:hook_scope_alias_available?).and_return(false) }

          it 'does nothing' 

        end
      end

      context 'when Config#convert_hook_scope? is false' do
        before { config.conversion[:hook_scope] = false }

        context 'when RSpecVersion#hook_scope_alias_available? returns true' do
          before { rspec_version.stub(:hook_scope_alias_available?).and_return(true) }

          it 'does nothing' 

        end
      end
    end

    describe '#process_raise_error' do
      let(:raise_error_object) { double('raise_error_object').as_null_object }

      context 'when Config#convert_deprecated_method? is true' do
        before { config.conversion[:deprecated] = true }

        it 'invokes RaiseError#remove_error_specification_with_negative_expectation!' 

      end

      context 'when Config#convert_deprecated_method? is false' do
        before { config.conversion[:deprecated] = false }

        it 'does nothing' 

      end
    end

    describe '#process_its' do
      let(:its_object) { double('its_object').as_null_object }

      context 'when Config#convert_its? is true' do
        before { config.conversion[:its] = true }

        it 'invokes Its#convert_to_describe_subject_it!' 

      end

      context 'when Config#convert_its? is false' do
        before { config.conversion[:its] = false }

        it 'does nothing' 

      end
    end

    describe '#process_example' do
      let(:example_object) { double('example_object').as_null_object }

      shared_examples 'does nothing' do
        it 'does nothing' 

      end

      context 'when RSpecVersion#rspec_2_99? returns true' do
        before { rspec_version.stub(:rspec_2_99?).and_return(true) }

        context 'and Config#convert_pending? returns true' do
          before { config.conversion[:pending] = true }

          it 'invokes Example#convert_pending_to_skip!' 

        end

        context 'and Config#convert_pending? returns false' do
          before { config.conversion[:pending] = false }
          include_examples 'does nothing'
        end
      end

      context 'when RSpecVersion#rspec_2_99? returns false' do
        before { rspec_version.stub(:rspec_2_99?).and_return(false) }

        context 'and Config#convert_pending? returns true' do
          before { config.conversion[:pending] = true }
          include_examples 'does nothing'
        end

        context 'and Config#convert_pending? returns false' do
          before { config.conversion[:pending] = false }
          include_examples 'does nothing'
        end
      end
    end

    describe '#process_pending' do
      let(:pending_object) { double('pending_object').as_null_object }

      shared_examples 'does nothing' do
        it 'does nothing' 

      end

      context 'when RSpecVersion#rspec_2_99? returns true' do
        before { rspec_version.stub(:rspec_2_99?).and_return(true) }

        context 'and Config#convert_pending? returns true' do
          before { config.conversion[:pending] = true }

          it 'invokes Example#convert_deprecated_syntax!' 

        end

        context 'and Config#convert_pending? returns false' do
          before { config.conversion[:pending] = false }
          include_examples 'does nothing'
        end
      end

      context 'when RSpecVersion#rspec_2_99? returns false' do
        before { rspec_version.stub(:rspec_2_99?).and_return(false) }

        context 'and Config#convert_pending? returns true' do
          before { config.conversion[:pending] = true }
          include_examples 'does nothing'
        end

        context 'and Config#convert_pending? returns false' do
          before { config.conversion[:pending] = false }
          include_examples 'does nothing'
        end
      end
    end

    describe '#process_current_example' do
      let(:current_example_object) { double('current_example_object').as_null_object }

      context 'when RSpecVersion#yielded_example_available? returns true' do
        before { rspec_version.stub(:yielded_example_available?).and_return(true) }

        context 'and Config#convert_deprecated_method? is true' do
          before { config.conversion[:deprecated] = true }

          it 'invokes CurrentExample#convert!' 

        end

        context 'and Config#convert_deprecated_method? is false' do
          before { config.conversion[:deprecated] = false }

          it 'does nothing' 

        end
      end

      context 'when RSpecVersion#yielded_example_available? returns false' do
        before { rspec_version.stub(:yielded_example_available?).and_return(false) }

        context 'and Config#convert_deprecated_method? is true' do
          before { config.conversion[:deprecated] = true }

          it 'does nothing' 

        end
      end
    end

    describe '#process_matcher_definition' do
      let(:matcher_definition) { double('matcher_definition').as_null_object }

      context 'when RSpecVersion#non_should_matcher_protocol_available? returns true' do
        before { rspec_version.stub(:non_should_matcher_protocol_available?).and_return(true) }

        context 'and Config#convert_deprecated_method? is true' do
          before { config.conversion[:deprecated] = true }

          it 'invokes MatcherDefinition#convert_deprecated_method!' 

        end

        context 'and Config#convert_deprecated_method? is false' do
          before { config.conversion[:deprecated] = false }

          it 'does nothing' 

        end
      end

      context 'when RSpecVersion#non_should_matcher_protocol_available? returns false' do
        before { rspec_version.stub(:non_should_matcher_protocol_available?).and_return(false) }

        context 'and Config#convert_deprecated_method? is true' do
          before { config.conversion[:deprecated] = true }

          it 'does nothing' 

        end
      end
    end

    describe '#process_example_group' do
      let(:example_group) { double('example_group').as_null_object }

      context 'when RSpecVersion#non_monkey_patch_example_group_available? returns true' do
        before { rspec_version.stub(:non_monkey_patch_example_group_available?).and_return(true) }

        context 'and Config#convert_example_group? is true' do
          before { config.conversion[:example_group] = true }

          it 'invokes ExampleGroup#convert_to_non_monkey_patch!' 

        end

        context 'and Config#convert_example_group? is false' do
          before { config.conversion[:example_group] = false }

          it 'does nothing' 

        end
      end

      context 'when RSpecVersion#non_monkey_patch_example_group_available? returns false' do
        before { rspec_version.stub(:non_monkey_patch_example_group_available?).and_return(false) }

        context 'and Config#convert_example_group? is true' do
          before { config.conversion[:example_group] = true }

          it 'does nothing' 

        end
      end

      context 'when RSpecVersion#implicit_spec_type_disablement_available? returns true' do
        before { rspec_version.stub(:implicit_spec_type_disablement_available?).and_return(true) }

        context 'and Config#add_explicit_type_metadata_to_example_group? is true' do
          before { config.add_explicit_type_metadata_to_example_group = true }

          it 'invokes ExampleGroup#add_explicit_type_metadata!' 

        end

        context 'and Config#add_explicit_type_metadata_to_example_group? is false' do
          before { config.add_explicit_type_metadata_to_example_group = false }

          it 'does nothing' 

        end
      end

      context 'when RSpecVersion#implicit_spec_type_disablement_available? returns false' do
        before { rspec_version.stub(:implicit_spec_type_disablement_available?).and_return(false) }

        context 'and Config#add_explicit_type_metadata_to_example_group? is true' do
          before { config.add_explicit_type_metadata_to_example_group = true }

          it 'does nothing' 

        end
      end
    end

    describe '#process_rspec_configure' do
      let(:rspec_configure) do
        double(
          'rspec_configure',
          expectations: double('expectations').as_null_object,
                 mocks: double('mocks').as_null_object
        ).as_null_object
      end

      context 'when Config#convert_deprecated_method? returns true' do
        before { config.conversion[:deprecated] = true }

        it 'invokes RSpecConfigure#convert_deprecated_options!' 

      end

      context 'when Config#convert_deprecated_method? returns false' do
        before { config.conversion[:deprecated] = false }

        it 'does not invoke RSpecConfigure#convert_deprecated_options!' 

      end

      context 'when RSpecVersion#rspec_2_99? returns true' do
        before do
          rspec_version.stub(:rspec_2_99?).and_return(true)
        end

        context 'and Config#convert_deprecated_method? returns true' do
          before { config.conversion[:deprecated] = true }

          context 'and SpecSuite#main_rspec_configure_node? returns true' do
            before do
              spec_suite.stub(:main_rspec_configure_node?).and_return(true)
            end

            context 'and SpecSuite#need_to_modify_yield_receiver_..._config? return true' do
              before do
                spec_suite.stub(:need_to_modify_yield_receiver_to_any_instance_implementation_blocks_config?)
                  .and_return(true)
              end

              context 'and Config#add_receiver_arg_to_any_instance_implementation_block? returns true' do
                before { config.add_receiver_arg_to_any_instance_implementation_block = true }

                it 'invokes RSpecConfigure.mocks.yield_receiver_to_any_instance_implementation_blocks= with true' 

              end

              context 'and Config#add_receiver_arg_to_any_instance_implementation_block? returns false' do
                before { config.add_receiver_arg_to_any_instance_implementation_block = false }

                it 'invokes RSpecConfigure.mocks.yield_receiver_to_any_instance_implementation_blocks= with false' 

              end
            end
          end

          context 'and SpecSuite#need_to_modify_yield_receiver_..._config? return false' do
            before do
              spec_suite.stub(:need_to_modify_yield_receiver_to_any_instance_implementation_blocks_config?)
                .and_return(false)
            end

            context 'and Config#add_receiver_arg_to_any_instance_implementation_block? returns true' do
              before { config.add_receiver_arg_to_any_instance_implementation_block = true }

              it 'does not invoke RSpecConfigure.mocks.yield_receiver_to_any_instance_implementation_blocks=' 

            end
          end

          context 'and SpecSuite#main_rspec_configure_node? returns false' do
            before do
              spec_suite.stub(:main_rspec_configure_node?).and_return(false)
            end

            context 'and Config#add_receiver_arg_to_any_instance_implementation_block? returns true' do
              before { config.add_receiver_arg_to_any_instance_implementation_block = true }

              it 'does not invoke RSpecConfigure.mocks.yield_receiver_to_any_instance_implementation_blocks=' 

            end
          end
        end

        context 'and Config#convert_deprecated_method? returns false' do
          before { config.conversion[:deprecated] = false }

          it 'does not invoke RSpecConfigure.mocks.yield_receiver_to_any_instance_implementation_blocks=' 

        end
      end

      context 'when RSpecVersion#rspec_2_99? returns false' do
        before do
          rspec_version.stub(:rspec_2_99?).and_return(false)
        end

        it 'does not invoke RSpecConfigure.mocks.yield_receiver_to_any_instance_implementation_blocks=' 

      end

      context 'when RSpecVersion#non_monkey_patch_example_group_available? returns true' do
        before { rspec_version.stub(:non_monkey_patch_example_group_available?).and_return(true) }

        context 'and Config#convert_example_group? is true' do
          before { config.conversion[:example_group] = true }

          it 'invokes RSpecConfigure#expose_dsl_globally= with false' 

        end

        context 'and Config#convert_example_group? is false' do
          before { config.conversion[:example_group] = false }

          it 'does nothing' 

        end
      end

      context 'when RSpecVersion#non_monkey_patch_example_group_available? returns false' do
        before { rspec_version.stub(:non_monkey_patch_example_group_available?).and_return(false) }

        context 'and Config#convert_example_group? is true' do
          before { config.conversion[:example_group] = true }

          it 'does nothing' 

        end
      end
    end

    describe '#process_useless_and_return' do
      let(:messaging_host) { double('messaging host').as_null_object }

      context 'when Config#convert_deprecated_method? returns true' do
        before { config.conversion[:deprecated] = true }

        it 'invokes #remove_useless_and_return!' 

      end

      context 'when Config#convert_deprecated_method? returns false' do
        before { config.conversion[:deprecated] = false }

        it 'does nothing' 

      end
    end

    describe '#process_any_instance_block' do
      let(:messaging_host) { double('messaging host').as_null_object }

      context 'when RSpecVersion#rspec_2_99? returns true' do
        before do
          rspec_version.stub(:rspec_2_99?).and_return(true)
        end

        context 'and Config#convert_deprecated_method? returns true' do
          before { config.conversion[:deprecated] = true }

          context 'and Config#add_receiver_arg_to_any_instance_implementation_block? returns true' do
            before { config.add_receiver_arg_to_any_instance_implementation_block = true }

            it 'invokes #add_receiver_arg_to_any_instance_implementation_block!' 

          end

          context 'and Config#add_receiver_arg_to_any_instance_implementation_block? returns false' do
            before { config.add_receiver_arg_to_any_instance_implementation_block = false }

            it 'does nothing' 

          end
        end

        context 'and Config#convert_deprecated_method? returns false' do
          before { config.conversion[:deprecated] = false }

          context 'and Config#add_receiver_arg_to_any_instance_implementation_block? returns true' do
            before { config.add_receiver_arg_to_any_instance_implementation_block = true }

            it 'does nothing' 

          end
        end
      end

      context 'when RSpecVersion#rspec_2_99? returns false' do
        before do
          rspec_version.stub(:rspec_2_99?).and_return(false)
        end

        it 'does nothing' 

      end
    end
  end
end

