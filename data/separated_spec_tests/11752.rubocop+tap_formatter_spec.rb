# frozen_string_literal: true

RSpec.describe RuboCop::Formatter::TapFormatter do
  subject(:formatter) { described_class.new(output) }

  let(:output) { StringIO.new }

  let(:files) do
    %w[lib/rubocop.rb spec/spec_helper.rb exe/rubocop].map do |path|
      File.expand_path(path)
    end
  end

  describe '#file_finished' do
    before do
      formatter.started(files)
      formatter.file_started(files.first, {})
      formatter.file_finished(files.first, offenses)
    end

    context 'when no offenses are detected' do
      let(:offenses) { [] }

      it 'prints "ok"' 

    end

    context 'when any offenses are detected' do
      let(:offenses) { [double('offense').as_null_object] }

      it 'prints "not ok"' 

    end
  end

  describe '#finished' do
    before do
      formatter.started(files)
    end

    context 'when any offenses are detected' do
      before do
        source_buffer = Parser::Source::Buffer.new('test', 1)
        source = Array.new(9) do |index|
          "This is line #{index + 1}."
        end
        source_buffer.source = source.join("\n")
        line_length = source[0].length + 1

        formatter.file_started(files[0], {})
        formatter.file_finished(
          files[0],
          [
            RuboCop::Cop::Offense.new(
              :convention,
              Parser::Source::Range.new(source_buffer,
                                        line_length + 2,
                                        line_length + 3),
              'foo',
              'Cop'
            )
          ]
        )

        formatter.file_started(files[1], {})
        formatter.file_finished(files[1], [])

        formatter.file_started(files[2], {})
        formatter.file_finished(
          files[2],
          [
            RuboCop::Cop::Offense.new(
              :error,
              Parser::Source::Range.new(source_buffer,
                                        4 * line_length + 1,
                                        4 * line_length + 2),
              'bar',
              'Cop'
            ),
            RuboCop::Cop::Offense.new(
              :convention,
              Parser::Source::Range.new(source_buffer,
                                        5 * line_length,
                                        5 * line_length + 1),
              'foo',
              'Cop'
            )
          ]
        )
      end

      it 'reports all detected offenses for all failed files' 

    end

    context 'when no offenses are detected' do
      before do
        files.each do |file|
          formatter.file_started(file, {})
          formatter.file_finished(file, [])
        end
      end

      it 'does not report offenses' 

    end
  end
end

