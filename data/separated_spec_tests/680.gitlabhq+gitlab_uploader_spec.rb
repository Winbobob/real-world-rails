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

  describe '#open' do
    context 'when trace is stored in File storage' do
      context 'when file exists' do
        let(:file) do
          fixture_file_upload('spec/fixtures/trace/sample_trace', 'text/plain')
        end

        before do
          subject.store!(file)
        end

        it 'returns io stream' 


        it 'when passing block it yields' 

      end

      context 'when file does not exist' do
        it 'returns nil' 


        it 'when passing block it does not yield' 

      end
    end

    context 'when trace is stored in Object storage' do
      before do
        allow(subject).to receive(:file_storage?) { false }
      end

      context 'when file exists' do
        before do
          allow(subject).to receive(:url) { 'http://object_storage.com/trace' }
        end

        it 'returns http io stream' 


        it 'when passing block it yields' 

      end

      context 'when file does not exist' do
        it 'returns nil' 


        it 'when passing block it does not yield' 

      end
    end
  end
end

