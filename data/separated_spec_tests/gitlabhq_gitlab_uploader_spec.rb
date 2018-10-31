require 'rails_helper'
require 'carrierwave/storage/fog'

describe GitlabUploader do
  let(:uploader_class) { Class.new(described_class) }

  subject { uploader_class.new(double) }

  describe '#file_storage?' do
    context 'when file storage is used' do
      before do
        uploader_class.storage(:file)
      end

      it { is_expected.to be_file_storage }
    end

    context 'when is remote storage' do
      before do
        uploader_class.storage(:fog)
      end

      it { is_expected.not_to be_file_storage }
    end
  end

  describe '#file_cache_storage?' do
    context 'when file storage is used' do
      before do
        expect(uploader_class).to receive(:cache_storage) { CarrierWave::Storage::File }
      end

      it { is_expected.to be_file_cache_storage }
    end

    context 'when is remote storage' do
      before do
        expect(uploader_class).to receive(:cache_storage) { CarrierWave::Storage::Fog }
      end

      it { is_expected.not_to be_file_cache_storage }
    end
  end

  describe '#move_to_cache' do
    it 'is true' 

  end

  describe '#move_to_store' do
    it 'is true' 

  end

  describe '#cache!' do
    it 'moves the file from the working directory to the cache directory' 

  end
end

