require 'spec_helper'

describe Rack::Test::UploadedFile do
  def test_file_path
    File.dirname(__FILE__) + '/../../fixtures/foo.txt'
  end

  it 'returns an instance of `Rack::Test::UploadedFile`' 


  it 'responds to things that Tempfile responds to' 


  it "creates Tempfiles with original file's extension" 


  it 'creates Tempfiles with a path that includes a single extension' 


  context 'it should call its destructor' do
    it 'calls the destructor' 

  end

  describe '#initialize' do
    context 'with an IO object' do
      let(:stringio) { StringIO.new('I am content') }
      let(:uploaded_file) { described_class.new(stringio, original_filename: original_filename) }
      subject { -> { uploaded_file } }

      context 'with an original filename' do
        let(:original_filename) { 'content.txt' }

        it 'sets the specified filename' 

      end
    end
  end
end

