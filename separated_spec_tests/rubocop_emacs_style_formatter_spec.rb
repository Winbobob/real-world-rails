# frozen_string_literal: true

RSpec.describe RuboCop::Formatter::EmacsStyleFormatter do
  subject(:formatter) { described_class.new(output) }

  let(:output) { StringIO.new }

  describe '#file_finished' do
    it 'displays parsable text' 


    context 'when the offense is automatically corrected' do
      let(:file) { '/path/to/file' }

      let(:offense) do
        RuboCop::Cop::Offense.new(:convention, location,
                                  'This is a message.', 'CopName', status)
      end

      let(:location) do
        source_buffer = Parser::Source::Buffer.new('test', 1)
        source_buffer.source = "a\n"
        Parser::Source::Range.new(source_buffer, 0, 1)
      end

      let(:status) { :corrected }

      it 'prints [Corrected] along with message' 

    end

    context 'when the offense message contains a newline' do
      let(:file) { '/path/to/file' }

      let(:offense) do
        RuboCop::Cop::Offense.new(:error, location,
                                  "unmatched close parenthesis: /\n   world " \
                                  "# Some comment containing a )\n/",
                                  'CopName', :uncorrected)
      end

      let(:location) do
        source_buffer = Parser::Source::Buffer.new('test', 1)
        source_buffer.source = "a\n"
        Parser::Source::Range.new(source_buffer, 0, 1)
      end

      it 'strips newlines out of the error message' 

    end
  end

  describe '#finished' do
    it 'does not report summary' 

  end
end

