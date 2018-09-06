# frozen_string_literal: true

RSpec.describe RuboCop::Formatter::ClangStyleFormatter do
  subject(:formatter) { described_class.new(output) }

  let(:output) { StringIO.new }

  describe '#report_file' do
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

    it 'displays text containing the offending source line' 


    context 'when the source line is blank' do
      it 'does not display offending source line' 

    end

    context 'when the offending source spans multiple lines' do
      it 'displays the first line with ellipses' 

    end

    context 'when the offense is not corrected' do
      let(:status) { :uncorrected }

      it 'prints message as-is' 

    end

    context 'when the offense is automatically corrected' do
      let(:status) { :corrected }

      it 'prints [Corrected] along with message' 

    end
  end
end

