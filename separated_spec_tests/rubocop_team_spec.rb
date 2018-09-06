# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Team do
  subject(:team) { described_class.new(cop_classes, config, options) }

  let(:cop_classes) { RuboCop::Cop::Cop.non_rails }
  let(:config) { RuboCop::ConfigLoader.default_configuration }
  let(:options) { nil }
  let(:ruby_version) { RuboCop::Config::KNOWN_RUBIES.last }

  before do
    RuboCop::ConfigLoader.default_configuration = nil
  end

  context 'when incompatible cops are correcting together' do
    include FileHelper

    let(:options) { { formatters: [], auto_correct: true } }
    let(:runner) { RuboCop::Runner.new(options, RuboCop::ConfigStore.new) }
    let(:file_path) { 'example.rb' }

    it 'auto corrects without SyntaxError', :isolated_environment do
      source = <<-'RUBY'.strip_indent
        foo.map{ |a| a.nil? }

        'foo' +
          'bar' +
          "#{baz}"

        i=i+1

        def a
          self::b
        end
      RUBY
      corrected = <<-'RUBY'.strip_indent
        foo.map(&:nil?)

        'foo' \
          'bar' \
          "#{baz}"

        i += 1

        def a
          b
        end
      RUBY

      create_file(file_path, source)
      runner.run([])
      expect(File.read(file_path)).to eq(corrected)
    end
  end

  describe '#autocorrect?' do
    subject { team.autocorrect? }

    context 'when the option argument of .new is omitted' do
      subject { described_class.new(cop_classes, config).autocorrect? }

      it { is_expected.to be_falsey }
    end

    context 'when { auto_correct: true } is passed to .new' do
      let(:options) { { auto_correct: true } }

      it { is_expected.to be_truthy }
    end
  end

  describe '#debug?' do
    subject { team.debug? }

    context 'when the option argument of .new is omitted' do
      subject { described_class.new(cop_classes, config).debug? }

      it { is_expected.to be_falsey }
    end

    context 'when { debug: true } is passed to .new' do
      let(:options) { { debug: true } }

      it { is_expected.to be_truthy }
    end
  end

  describe '#inspect_file', :isolated_environment do
    include FileHelper

    let(:file_path) { '/tmp/example.rb' }
    let(:offenses) do
      source = RuboCop::ProcessedSource.from_file(file_path, ruby_version)
      team.inspect_file(source)
    end

    before do
      create_file(file_path, [
                    '#' * 90,
                    'puts test;'
                  ])
    end

    it 'returns offenses' 


    context 'when Parser reports non-fatal warning for the file' do
      before do
        create_file(file_path, ['#' * 90, 'puts *test'])
      end

      let(:cop_names) { offenses.map(&:cop_name) }

      it 'returns Parser warning offenses' 


      it 'returns offenses from cops' 

    end

    context 'when autocorrection is enabled' do
      let(:options) { { auto_correct: true } }

      before do
        create_file(file_path, 'puts "string"')
      end

      it 'does autocorrection' 


      it 'still returns offenses' 

    end
  end

  describe '#cops' do
    subject(:cops) { team.cops }

    it 'returns cop instances' 


    context 'when only some cop classes are passed to .new' do
      let(:cop_classes) do
        RuboCop::Cop::Registry.new(
          [RuboCop::Cop::Lint::Void, RuboCop::Cop::Metrics::LineLength]
        )
      end

      it 'returns only instances of the classes' 

    end

    context 'when some classes are disabled with config' do
      let(:disabled_config) do
        %w[
          Lint/Void
          Metrics/LineLength
        ].each_with_object(RuboCop::Config.new) do |cop_name, accum|
          accum[cop_name] = { 'Enabled' => false }
        end
      end
      let(:config) do
        RuboCop::ConfigLoader.merge_with_default(disabled_config, '')
      end
      let(:cop_names) { cops.map(&:name) }

      it 'does not return instances of the classes' 

    end
  end

  describe '#forces' do
    subject(:forces) { team.forces }

    let(:cop_classes) { RuboCop::Cop::Cop.non_rails }

    it 'returns force instances' 


    context 'when a cop joined a force' do
      let(:cop_classes) do
        RuboCop::Cop::Registry.new([RuboCop::Cop::Lint::UselessAssignment])
      end

      it 'returns the force' 

    end

    context 'when multiple cops joined a same force' do
      let(:cop_classes) do
        RuboCop::Cop::Registry.new(
          [
            RuboCop::Cop::Lint::UselessAssignment,
            RuboCop::Cop::Lint::ShadowingOuterLocalVariable
          ]
        )
      end

      it 'returns only one force instance' 

    end

    context 'when no cops joined force' do
      let(:cop_classes) do
        RuboCop::Cop::Registry.new([RuboCop::Cop::Style::For])
      end

      it 'returns nothing' 

    end
  end
end

