# frozen_string_literal: true

RSpec.describe RuboCop::Formatter::FormatterSet do
  subject(:formatter_set) { described_class.new }

  it 'responds to all formatter API methods' 


  describe 'formatter API method' do
    before do
      formatter_set.add_formatter('simple')
      formatter_set.add_formatter('emacs')
    end

    let(:files) { ['/path/to/file1', '/path/to/file2'] }

    it 'invokes same method of all containing formatters' 

  end

  describe 'add_formatter' do
    it 'adds a formatter to itself' 


    it 'adds a formatter with specified formatter type' 


    it 'can add multiple formatters by being invoked multiple times' 


    context 'when output path is omitted' do
      it 'adds a formatter outputs to $stdout' 

    end

    context 'when output path is specified' do
      it 'adds a formatter outputs to the specified file' 


      context "when parent directories don't exist" do
        let(:tmpdir) { Dir.mktmpdir }

        after { FileUtils.rm_rf(tmpdir) }

        it 'creates them' 

      end
    end
  end

  describe '#close_output_files' do
    before do
      2.times do
        output_path = Tempfile.new('').path
        formatter_set.add_formatter('simple', output_path)
      end
      formatter_set.add_formatter('simple')
    end

    around do |example|
      begin
        $stdout = StringIO.new
        example.run
      ensure
        $stdout = STDOUT
      end
    end

    it 'closes all output files' 


    it 'does not close non file output' 

  end

  describe '#builtin_formatter_class' do
    def builtin_formatter_class(string)
      described_class.new.send(:builtin_formatter_class, string)
    end

    it 'returns class which matches passed alias name exactly' 


    it 'returns class whose first letter of alias name ' \
       'matches passed letter' do
      expect(builtin_formatter_class('s'))
        .to eq(RuboCop::Formatter::SimpleTextFormatter)
    end
  end

  describe '#custom_formatter_class' do
    def custom_formatter_class(string)
      described_class.new.send(:custom_formatter_class, string)
    end

    it 'returns constant represented by the passed string' 


    it 'can handle namespaced constant name' 


    it 'can handle top level namespaced constant name' 


    context 'when non-existent constant name is passed' do
      it 'raises error' 

    end
  end
end

