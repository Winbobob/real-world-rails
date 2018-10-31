require 'spec_helper'

describe Gitlab::Verify::LfsObjects do
  include GitlabVerifyHelpers

  it_behaves_like 'Gitlab::Verify::BatchVerifier subclass' do
    let!(:objects) { create_list(:lfs_object, 3, :with_file) }
  end

  describe '#run_batches' do
    let(:failures) { collect_failures }
    let(:failure) { failures[lfs_object] }

    let!(:lfs_object) { create(:lfs_object, :with_file, :correct_oid) }

    it 'passes LFS objects with the correct file' 


    it 'fails LFS objects with a missing file' 


    it 'fails LFS objects with a mismatched oid' 


    context 'with remote files' do
      let(:file) { double(:file) }

      before do
        stub_lfs_object_storage
        lfs_object.update!(file_store: ObjectStorage::Store::REMOTE)
        expect(CarrierWave::Storage::Fog::File).to receive(:new).and_return(file)
      end

      it 'passes LFS objects in object storage that exist' 


      it 'fails LFS objects in object storage that do not exist' 

    end
  end
end

