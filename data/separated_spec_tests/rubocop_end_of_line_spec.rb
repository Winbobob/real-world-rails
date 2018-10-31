# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::EndOfLine, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'all configurations' do
    it 'accepts an empty file' 

  end

  shared_examples 'iso-8859-15' do |eol|
    it 'can inspect non-UTF-8 encoded source with proper encoding comment' 

  end

  context 'when EnforcedStyle is native' do
    let(:cop_config) { { 'EnforcedStyle' => 'native' } }
    let(:messages) do
      ['Carriage return character ' \
        "#{RuboCop::Platform.windows? ? 'missing' : 'detected'}."]
    end

    it 'registers an offense for an incorrect EOL' 

  end

  context 'when EnforcedStyle is crlf' do
    let(:cop_config) { { 'EnforcedStyle' => 'crlf' } }
    let(:messages) { ['Carriage return character missing.'] }

    include_examples 'all configurations'

    it 'registers an offense for CR+LF' 


    it 'highlights the whole offending line' 


    it 'does not register offense for no CR at end of file' 


    it 'does not register offenses after __END__' 


    context 'and there are many lines ending with LF' do
      it 'registers only one offense' 


      include_examples 'iso-8859-15', ''
    end

    context 'and the default external encoding is US_ASCII' do
      around do |example|
        orig_encoding = Encoding.default_external
        Encoding.default_external = Encoding::US_ASCII
        example.run
        Encoding.default_external = orig_encoding
      end

      it 'does not crash on UTF-8 encoded non-ascii characters' 


      include_examples 'iso-8859-15', ''
    end

    context 'and source is a string' do
      it 'registers an offense' 

    end
  end

  context 'when EnforcedStyle is lf' do
    let(:cop_config) { { 'EnforcedStyle' => 'lf' } }

    include_examples 'all configurations'

    it 'registers an offense for CR+LF' 


    it 'highlights the whole offending line' 


    it 'registers an offense for CR at end of file' 


    it 'does not register offenses after __END__' 


    context 'and there are many lines ending with CR+LF' do
      it 'registers only one offense' 


      include_examples 'iso-8859-15', "\r"
    end

    context 'and the default external encoding is US_ASCII' do
      around do |example|
        orig_encoding = Encoding.default_external
        Encoding.default_external = Encoding::US_ASCII
        example.run
        Encoding.default_external = orig_encoding
      end

      it 'does not crash on UTF-8 encoded non-ascii characters' 


      include_examples 'iso-8859-15', "\r"
    end

    context 'and source is a string' do
      it 'registers an offense' 

    end
  end
end

