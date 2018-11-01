require 'spec_helper'

describe Gitlab::Verify::Uploads do
  include GitlabVerifyHelpers

  it_behaves_like 'Gitlab::Verify::BatchVerifier subclass' do
    let(:projects) { create_list(:project, 3, :with_avatar) }
    let!(:objects) { projects.flat_map(&:uploads) }
  end

  describe '#run_batches' do
    let(:project) { create(:project, :with_avatar) }
    let(:failures) { collect_failures }
    let(:failure) { failures[upload] }

    let!(:upload) { project.uploads.first }

    it 'passes uploads with the correct file' 


    it 'fails uploads with a missing file' 


    it 'fails uploads with a mismatched checksum' 


    it 'fails uploads with a missing precalculated checksum' 


    context 'with remote files' do
      let(:file) { double(:file) }

      before do
        stub_uploads_object_storage(AvatarUploader)
        upload.update!(store: ObjectStorage::Store::REMOTE)
      end

      describe 'returned hash object' do
        before do
          expect(CarrierWave::Storage::Fog::File).to receive(:new).and_return(file)
        end

        it 'passes uploads in object storage that exist' 


        it 'fails uploads in object storage that do not exist' 

      end

      describe 'performance' do
        before do
          allow(file).to receive(:exists?)
          allow(CarrierWave::Storage::Fog::File).to receive(:new).and_return(file)
        end

        it "avoids N+1 queries" 


        def perform_task
          described_class.new(batch_size: 100).run_batches { }
        end
      end
    end
  end
end

