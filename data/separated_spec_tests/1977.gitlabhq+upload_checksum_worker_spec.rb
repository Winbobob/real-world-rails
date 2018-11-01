require 'rails_helper'

describe UploadChecksumWorker do
  describe '#perform' do
    subject { described_class.new }

    context 'without a valid record' do
      it 'rescues ActiveRecord::RecordNotFound' 

    end

    context 'with a valid record' do
      let(:upload) { create(:user, :with_avatar).avatar.upload }

      before do
        expect(Upload).to receive(:find).and_return(upload)
        allow(upload).to receive(:foreground_checksumable?).and_return(false)
      end

      it 'calls calculate_checksum!' 


      it 'calls save!' 

    end
  end
end

