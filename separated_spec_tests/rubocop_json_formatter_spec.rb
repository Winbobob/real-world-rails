# frozen_string_literal: true

RSpec.describe RuboCop::Formatter::JSONFormatter do
  subject(:formatter) { described_class.new(output) }

  let(:output) { StringIO.new }
  let(:files) { %w[/path/to/file1 /path/to/file2] }
  let(:location) do
    source_buffer = Parser::Source::Buffer.new('test', 1)
    source_buffer.source = %w[a b cdefghi].join("\n")
    Parser::Source::Range.new(source_buffer, 2, 10)
  end
  let(:offense) do
    RuboCop::Cop::Offense.new(:convention, location,
                              'This is message', 'CopName', :corrected)
  end

  describe '#started' do
    let(:summary) { formatter.output_hash[:summary] }

    it 'sets target file count in summary' 

  end

  describe '#file_finished' do
    before do
      count = 0
      allow(formatter).to receive(:hash_for_file) do
        count += 1
      end
    end

    let(:summary) { formatter.output_hash[:summary] }

    it 'adds detected offense count in summary' 


    it 'adds value of #hash_for_file to #output_hash[:files]' 

  end

  describe '#finished' do
    let(:summary) { formatter.output_hash[:summary] }

    it 'sets inspected file count in summary' 


    it 'outputs #output_hash as JSON' 

  end

  describe '#hash_for_file' do
    subject(:hash) { formatter.hash_for_file(file, offenses) }

    let(:file) { File.expand_path('spec/spec_helper.rb') }
    let(:offenses) { [double('offense1'), double('offense2')] }

    it 'sets relative file path for :path key' 


    before do
      count = 0
      allow(formatter).to receive(:hash_for_offense) do
        count += 1
      end
    end

    it 'sets an array of #hash_for_offense values for :offenses key' 

  end

  describe '#hash_for_offense' do
    subject(:hash) { formatter.hash_for_offense(offense) }

    it 'sets Offense#severity value for :severity key' 


    it 'sets Offense#message value for :message key' 


    it 'sets Offense#cop_name value for :cop_name key' 


    it 'sets Offense#corrected? value for :corrected key' 


    it 'sets value of #hash_for_location for :location key' 

  end

  describe '#hash_for_location' do
    subject(:hash) { formatter.hash_for_location(offense) }

    it 'sets line value for :line key' 


    it 'sets column value for :column key' 


    it 'sets length value for :length key' 

  end
end

