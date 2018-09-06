# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Cop do
  subject(:cop) { described_class.new }

  let(:location) do
    source_buffer = Parser::Source::Buffer.new('test', 1)
    source_buffer.source = "a\n"
    Parser::Source::Range.new(source_buffer, 0, 1)
  end

  it 'initially has 0 offenses' 


  describe '.qualified_cop_name' do
    before do
      $stderr = StringIO.new
    end

    after do
      $stderr = STDERR
    end

    it 'adds namespace if the cop name is found in exactly one namespace' 


    it 'returns the given cop name if it is not found in any namespace' 


    it 'returns the given cop name if it already has a namespace' 


    it 'returns the cop name in a different namespace if the provided ' \
       'namespace is incorrect' do
      expect(described_class.qualified_cop_name('Style/LineLength', '--only'))
        .to eq('Metrics/LineLength')
    end

    it 'raises an error if the cop name is in more than one namespace' 


    it 'returns the given cop name if it already has a namespace even when ' \
       'the cop exists in multiple namespaces' do
      qualified_cop_name =
        described_class.qualified_cop_name('Style/SafeNavigation', '--only')

      expect(qualified_cop_name).to eq('Style/SafeNavigation')
    end
  end

  it 'keeps track of offenses' 


  it 'will report registered offenses' 


  it 'will set default severity' 


  it 'will set custom severity if present' 


  it 'will warn if custom severity is invalid' 


  it 'registers offense with its name' 


  describe 'setting of Offense#corrected attribute' do
    context 'when cop does not support autocorrection' do
      before do
        allow(cop).to receive(:support_autocorrect?).and_return(false)
      end

      it 'is not specified (set to nil)' 

    end

    context 'when cop supports autocorrection' do
      let(:cop) { RuboCop::Cop::Style::Alias.new }

      context 'when offense was corrected' do
        before do
          allow(cop).to receive(:autocorrect?).and_return(true)
          allow(cop).to receive(:autocorrect).and_return(->(_corrector) {})
        end

        it 'is set to true' 

      end

      context 'when autocorrection is not needed' do
        before do
          allow(cop).to receive(:autocorrect?).and_return(false)
        end

        it 'is set to false' 

      end

      context 'when offense was not corrected because of an error' do
        before do
          allow(cop).to receive(:autocorrect?).and_return(true)
          allow(cop).to receive(:autocorrect).and_return(false)
        end

        it 'is set to false' 

      end
    end
  end

  context 'with no submodule' do
    subject(:cop) { described_class }

    it('has right name') { expect(cop.cop_name).to eq('Cop/Cop') }
    it('has right department') { expect(cop.department).to eq(:Cop) }
  end

  context 'with style cops' do
    subject(:cop) { RuboCop::Cop::Style::For }

    it('has right name') { expect(cop.cop_name).to eq('Style/For') }
    it('has right department') { expect(cop.department).to eq(:Style) }
  end

  context 'with lint cops' do
    subject(:cop) { RuboCop::Cop::Lint::Loop }

    it('has right name') { expect(cop.cop_name).to eq('Lint/Loop') }
    it('has right department') { expect(cop.department).to eq(:Lint) }
  end

  context 'with rails cops' do
    subject(:cop) { RuboCop::Cop::Rails::Validation }

    it('has right name') { expect(cop.cop_name).to eq('Rails/Validation') }
    it('has right department') { expect(cop.department).to eq(:Rails) }
  end

  describe 'Registry' do
    context '#departments' do
      subject(:departments) { described_class.registry.departments }

      it('has departments') { expect(departments.length).not_to eq(0) }
      it { is_expected.to include(:Lint) }
      it { is_expected.to include(:Rails) }
      it { is_expected.to include(:Style) }

      it 'contains every value only once' 

    end

    context '#with_department' do
      let(:departments) { described_class.registry.departments }

      it 'has at least one cop per department' 


      it 'has each cop in exactly one type' 


      it 'returns 0 for an invalid type' 

    end
  end

  describe '#autocorrect?' do
    # dummy config for a generic cop instance
    subject { cop.autocorrect? }

    let(:config) { RuboCop::Config.new({}) }
    let(:cop) { described_class.new(config, options) }
    let(:support_autocorrect) { true }

    before do
      allow(cop).to receive(:support_autocorrect?) { support_autocorrect }
    end

    context 'when the option is not given' do
      let(:options) { {} }

      it { is_expected.to be(false) }
    end

    context 'when the option is given' do
      let(:options) { { auto_correct: true } }

      it { is_expected.to be(true) }

      context 'when cop does not support autocorrection' do
        let(:support_autocorrect) { false }

        it { is_expected.to be(false) }
      end

      context 'when the cop is set to not autocorrect' do
        let(:config) do
          RuboCop::Config.new('Cop/Cop' => { 'AutoCorrect' => false })
        end

        it { is_expected.to be(false) }
      end
    end
  end
end

