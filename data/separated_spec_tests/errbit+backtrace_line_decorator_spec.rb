describe BacktraceLineDecorator, type: :decorator do
  let(:backtrace_line) do
    described_class.new(
      number: 884,
      file:   '/path/to/file/ea315ea4.rb',
      method: :instance_eval)
  end
  let(:backtrace_line_in_app) do
    described_class.new(
      number: 884,
      file:   '[PROJECT_ROOT]/path/to/file/ea315ea4.rb',
      method: :instance_eval)
  end
  let(:backtrace_line_no_file) do
    described_class.new(number: 884, method: :instance_eval)
  end
  let(:backtrace_line_no_object) do
    described_class.new(nil)
  end
  let(:app) { Fabricate(:app, github_repo: 'foo/bar') }

  describe '#to_s' do
    it 'returns a nice string representation of the first line' 

  end

  describe '#file' do
    it 'returns "" when there is no file' 


    it 'returns "" when there is no object' 

  end

  describe '#in_app?' do
    it 'returns false when there is no file' 

  end

  describe '#path' do
    it 'returns "" when there is no file' 

  end

  describe '#link_to_source_file' do
    it 'adds a link to the source file' 

  end
end

