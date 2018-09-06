# frozen_string_literal: true

module RuboCop
  class Runner
    attr_writer :errors # Needed only for testing.
  end
end

RSpec.describe RuboCop::Runner, :isolated_environment do
  include FileHelper

  let(:formatter_output_path) { 'formatter_output.txt' }
  let(:formatter_output) { File.read(formatter_output_path) }

  before do
    create_file('example.rb', source)
  end

  describe '#run' do
    subject(:runner) { described_class.new(options, RuboCop::ConfigStore.new) }

    let(:options) { { formatters: [['progress', formatter_output_path]] } }

    context 'if there are no offenses in inspected files' do
      let(:source) { <<-RUBY.strip_indent }
        # frozen_string_literal: true

        def valid_code; end
      RUBY

      it 'returns true' 

    end

    context 'if there is an offense in an inspected file' do
      let(:source) { <<-RUBY.strip_indent }
        # frozen_string_literal: true

        def INVALID_CODE; end
      RUBY

      it 'returns false' 


      it 'sends the offense to a formatter' 

    end

    context 'if a cop crashes' do
      before do
        # The cache responds that it's not valid, which means that new results
        # should normally be collected and saved...
        cache = double('cache', 'valid?' => false)
        # ... but there's a crash in one cop.
        runner.errors = ['An error occurred in ...']

        allow(RuboCop::ResultCache).to receive(:new) { cache }
      end

      let(:source) { '' }

      it 'does not call ResultCache#save' 

    end

    context 'if -s/--stdin is used with an offense' do
      before do
        # Make Style/EndOfLine give same output regardless of platform.
        create_file('.rubocop.yml', <<-YAML.strip_indent)
          Layout/EndOfLine:
            EnforcedStyle: lf
        YAML
      end

      let(:options) do
        {
          formatters: [['progress', formatter_output_path]],
          stdin: <<-RUBY.strip_indent
            # frozen_string_literal: true

            def INVALID_CODE; end
          RUBY
        }
      end
      let(:source) { '' }

      it 'returns false' 


      it 'sends the offense to a formatter' 

    end
  end

  describe '#run with cops autocorrecting each-other' do
    subject(:runner) do
      runner_class = Class.new(RuboCop::Runner) do
        def mobilized_cop_classes(_config)
          RuboCop::Cop::Registry.new(
            [
              RuboCop::Cop::Test::ClassMustBeAModuleCop,
              RuboCop::Cop::Test::ModuleMustBeAClassCop
            ]
          )
        end
      end
      runner_class.new(options, RuboCop::ConfigStore.new)
    end

    let(:options) do
      {
        auto_correct: true,
        formatters: [['progress', formatter_output_path]]
      }
    end

    context 'if there is an offense in an inspected file' do
      let(:source) { <<-RUBY.strip_indent }
        # frozen_string_literal: true
        class Klass
        end
      RUBY

      it 'aborts because of an infinite loop' 

    end
  end
end

