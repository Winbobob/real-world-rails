# frozen_string_literal: true

RSpec.describe RuboCop::Formatter::BaseFormatter do
  include FileHelper

  describe 'how the API methods are invoked', :isolated_environment do
    subject(:formatter) { double('formatter').as_null_object }

    let(:runner) { RuboCop::Runner.new({}, RuboCop::ConfigStore.new) }
    let(:output) { $stdout.string }

    before do
      create_file('1_offense.rb', '#' * 90)

      create_file('4_offenses.rb', ['puts x ', 'test;', 'top;', '#' * 90])

      create_file('no_offense.rb', '# frozen_string_literal: true')

      allow(RuboCop::Formatter::SimpleTextFormatter)
        .to receive(:new).and_return(formatter)
      $stdout = StringIO.new
      # avoid intermittent failure caused when another test set global
      # options on ConfigLoader
      RuboCop::ConfigLoader.clear_options
    end

    after do
      $stdout = STDOUT
    end

    def run
      runner.run([])
    end

    describe 'invocation order' do
      subject(:formatter) do
        formatter = double('formatter')
        %i[started file_started file_finished finished output]
          .each do |message|
          allow(formatter).to receive(message) do
            puts message.to_s unless message == :output
          end
        end
        formatter
      end

      it 'is called in the proper sequence' 

    end

    shared_examples 'receives all file paths' do |method_name|
      it 'receives all file paths' 


      describe 'the passed files paths' do
        it 'is frozen' 

      end
    end

    describe '#started' do
      include_examples 'receives all file paths', :started
    end

    describe '#finished' do
      context 'when RuboCop finished inspecting all files normally' do
        include_examples 'receives all file paths', :started
      end

      context 'when RuboCop is interrupted by user' do
        it 'receives only processed file paths' 

      end
    end

    shared_examples 'receives a file path' do |method_name|
      it 'receives a file path' 


      describe 'the passed path' do
        it 'is frozen' 

      end
    end

    describe '#file_started' do
      include_examples 'receives a file path', :file_started

      it 'receives file specific information hash' 

    end

    describe '#file_finished' do
      include_examples 'receives a file path', :file_finished

      it 'receives an array of detected offenses for the file' 

    end
  end
end

