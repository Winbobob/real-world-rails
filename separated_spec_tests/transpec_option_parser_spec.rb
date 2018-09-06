# coding: utf-8

require 'spec_helper'
require 'transpec/cli/option_parser'

module Transpec
  class CLI
    describe OptionParser do
      subject(:parser) { OptionParser.new(config) }
      let(:config) { Config.new }

      describe '#parse' do
        subject { parser.parse(args) }
        let(:args) { ['some_file', '--negative-form', 'to_not', 'some_dir'] }

        it 'return non-option arguments' 


        it 'does not mutate the passed array' 


        describe '-f/--force option' do
          let(:args) { ['--force'] }

          it 'sets Config#forced? true' 

        end

        describe '-s/--skip-dynamic-analysis option' do
          let(:args) { ['--skip-dynamic-analysis'] }

          it 'sets Config#skip_dynamic_analysis? true' 

        end

        describe '-k/--keep option' do
          [
            'should',
            'oneliner',
            'should_receive',
            'stub',
            'have_items',
            'its',
            'pending',
            'deprecated'
          ].each do |type|
            context "when #{type.inspect} is specified" do
              let(:args) { ['--keep', type] }

              it "sets Config#convert? with :#{type} false" 

            end
          end

          context 'when multiple types are specified with comma' do
            let(:args) { ['--keep', 'should_receive,deprecated'] }

            it 'handles all of them' 

          end

          context 'when unknown type is specified' do
            let(:args) { ['--keep', 'unknown'] }

            it 'raises error' 

          end
        end

        describe '-v/--convert option' do
          [
            'example_group',
            'hook_scope',
            'stub_with_hash'
          ].each do |type|
            context "when #{type.inspect} is specified" do
              let(:args) { ['--convert', type] }

              it "sets Config#convert? with :#{type} true" 

            end
          end

          context 'when unknown type is specified' do
            let(:args) { ['--convert', 'unknown'] }

            it 'raises error' 

          end
        end

        describe '--convert-only option' do
          let(:args) { ['--convert-only', 'example_group'] }

          it 'enables specified conversion and disabled all other conversions' 


          context 'when unknown type is specified' do
            let(:args) { ['--convert-only', 'unknown'] }

            it 'raises error' 

          end
        end

        describe '-n/--negative-form option' do
          ['not_to', 'to_not'].each do |form|
            context "when #{form.inspect} is specified" do
              let(:args) { ['--negative-form', form] }

              it "sets Config#negative_form_of_to #{form.inspect}" 

            end
          end
        end

        describe '-b/--boolean-matcher option' do
          [
            ['truthy,falsey', :conditional, 'be_falsey'],
            ['truthy,falsy',  :conditional, 'be_falsy'],
            ['true,false',    :exact,       'be_falsey']
          ].each do |cli_type, config_type, form_of_be_falsey|
            context "when #{cli_type.inspect} is specified" do
              let(:args) { ['--boolean-matcher', cli_type] }

              it "sets Config#boolean_matcher_type #{config_type.inspect}" 


              it "sets Config#form_of_be_falsey #{form_of_be_falsey.inspect}" 

            end
          end

          ['', 'truthy', 'true', 'foo'].each do |cli_type|
            context "when #{cli_type.inspect} is specified" do
              let(:args) { ['--boolean-matcher', cli_type] }

              it 'raises error' 

            end
          end
        end

        describe '-a/--no-yield-any-instance option' do
          let(:args) { ['--no-yield-any-instance'] }

          it 'sets Config#add_receiver_arg_to_any_instance_implementation_block? false' 

        end

        describe '-e/--explicit-spec-type option' do
          let(:args) { ['--explicit-spec-type'] }

          it 'sets Config#add_explicit_type_metadata_to_example_group? true' 

        end

        describe '-p/--no-parens-matcher-arg option' do
          let(:args) { ['--no-parens-matcher-arg'] }

          it 'sets Config#parenthesize_matcher_arg? false' 

        end

        describe '--no-parentheses-matcher-arg option' do
          let(:args) { ['--no-parentheses-matcher-arg'] }

          before do
            parser.stub(:warn)
          end

          it 'sets Config#parenthesize_matcher_arg? false' 


          it 'is deprecated' 

        end

        describe '--no-color option' do
          before do
            Rainbow.enabled = true
          end

          let(:args) { ['--no-color'] }

          it 'disables color in the output' 

        end

        describe '--version option' do
          before do
            parser.stub(:puts)
            parser.stub(:exit)
          end

          let(:args) { ['--version'] }

          it 'shows version' 


          it 'exits' 

        end
      end

      describe 'help text' do
        subject(:help_text) do
          parser.help
        end

        it 'does not exceed 100 characters in each line' 


        def description_for_option(option)
          description_lines = parser.send(:descriptions)[option]
          description_lines.map { |line| parser.send(:highlight_text, line) }
        end

        def conversion_types_for_option(option)
          section = description_for_option(option)

          section.each_with_object([]) do |line, types|
            match = line.match(/^[ ]{2}([a-z_]+)/)
            next unless match
            types << match.captures.first
          end
        end

        it 'describes all conversion types for -k/--keep option' 


        it 'describes all conversion types for -v/--convert option' 

      end
    end
  end
end

