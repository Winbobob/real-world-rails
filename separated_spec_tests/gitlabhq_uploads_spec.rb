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
      before do
        stub_uploads_object_storage(AvatarUploader)
      end

      it 'skips uploads in object storage' 

    end
  end
end

