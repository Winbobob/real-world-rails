# frozen_string_literal: true

RSpec.describe RuboCop::FileFinder, :isolated_environment do
  include FileHelper

  subject(:finder) { Class.new.include(described_class).new }

  before do
    create_file('file', '')
    create_file(File.join('dir', 'file'), '')
  end

  describe '#find_file_upwards' do
    it 'returns a file to be found upwards' 


    it 'returns nil when file is not found' 


    context 'when given `use_home` option' do
      before { create_file(File.join(Dir.home, 'file2'), '') }

      context 'and a file exists in home directory' do
        it 'returns the file' 

      end

      context 'but no `HOME` in `ENV`' do
        before { ENV.delete('HOME') }

        it 'returns nil' 

      end
    end
  end

  describe '#find_files_upwards' do
    it 'returns an array of files to be found upwards' 


    it 'returns an empty array when file is not found' 


    context 'when given `use_home` option' do
      before { create_file(File.join(Dir.home, 'file'), '') }

      context 'and a file exists in home directory' do
        it 'returns an array including the file' 

      end

      context 'but no `HOME` in `ENV`' do
        before { ENV.delete('HOME') }

        it 'returns an array not including the file' 

      end
    end
  end
end

