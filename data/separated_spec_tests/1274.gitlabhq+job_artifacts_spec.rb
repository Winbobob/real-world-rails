require 'spec_helper'

describe Gitlab::Verify::JobArtifacts do
  include GitlabVerifyHelpers

  it_behaves_like 'Gitlab::Verify::BatchVerifier subclass' do
    let!(:objects) { create_list(:ci_job_artifact, 3, :archive) }
  end

  describe '#run_batches' do
    let(:failures) { collect_failures }
    let(:failure) { failures[artifact] }

    let!(:artifact) { create(:ci_job_artifact, :archive, :correct_checksum) }

    it 'passes artifacts with the correct file' 


    it 'fails artifacts with a missing file' 


    it 'fails artifacts with a mismatched checksum' 


    context 'with remote files' do
      let(:file) { double(:file) }

      before do
        stub_artifacts_object_storage
        artifact.update!(file_store: ObjectStorage::Store::REMOTE)
        expect(CarrierWave::Storage::Fog::File).to receive(:new).and_return(file)
      end

      it 'passes artifacts in object storage that exist' 


      it 'fails artifacts in object storage that do not exist' 

    end
  end
end

