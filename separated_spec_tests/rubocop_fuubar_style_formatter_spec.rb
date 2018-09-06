# frozen_string_literal: true

RSpec.describe RuboCop::Formatter::FuubarStyleFormatter do
  subject(:formatter) { described_class.new(output) }

  let(:output) { StringIO.new }

  let(:files) do
    %w[lib/rubocop.rb spec/spec_helper.rb].map do |path|
      File.expand_path(path)
    end
  end

  describe '#with_color' do
    around do |example|
      original_state = formatter.rainbow.enabled

      begin
        example.run
      ensure
        formatter.rainbow.enabled = original_state
      end
    end

    context 'when color is enabled' do
      before do
        formatter.rainbow.enabled = true
      end

      it 'outputs coloring sequence code at the beginning and the end' 

    end

    context 'when color is enabled' do
      before do
        formatter.rainbow.enabled = false
      end

      it 'outputs nothing' 

    end
  end

  describe '#progressbar_color' do
    before do
      formatter.started(files)
    end

    def offense(severity, status = :uncorrected)
      source_range = double('source_range').as_null_object
      RuboCop::Cop::Offense.new(
        severity, source_range,
        'message', 'Cop', status
      )
    end

    context 'initially' do
      it 'is green' 

    end

    context 'when no offenses are detected in a file' do
      before do
        formatter.file_finished(files[0], [])
      end

      it 'is still green' 

    end

    context 'when a convention offense is detected in a file' do
      before do
        formatter.file_finished(files[0], [offense(:convention)])
      end

      it 'is yellow' 

    end

    context 'when an error offense is detected in a file' do
      before do
        formatter.file_finished(files[0], [offense(:error)])
      end

      it 'is red' 


      context 'and then a convention offense is detected in the next file' do
        before do
          formatter.file_finished(files[1], [offense(:convention)])
        end

        it 'is still red' 

      end
    end

    context 'when convention and error offenses are detected in a file' do
      before do
        offenses = [offense(:convention), offense(:error)]
        formatter.file_finished(files[0], offenses)
      end

      it 'is red' 

    end

    context 'when a offense is detected in a file and auto-corrected' do
      before do
        formatter.file_finished(files[0], [offense(:convention, :corrected)])
      end

      it 'is green' 

    end
  end
end

