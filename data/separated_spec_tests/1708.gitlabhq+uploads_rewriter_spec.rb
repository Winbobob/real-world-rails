require 'spec_helper'

describe Gitlab::Gfm::UploadsRewriter do
  let(:user) { create(:user) }
  let(:old_project) { create(:project) }
  let(:new_project) { create(:project) }
  let(:rewriter) { described_class.new(text, old_project, user) }

  context 'text contains links to uploads' do
    let(:image_uploader) do
      build(:file_uploader, project: old_project)
    end

    let(:zip_uploader) do
      build(:file_uploader, project: old_project,
                            fixture: 'ci_build_artifacts.zip')
    end

    let(:text) do
      "Text and #{image_uploader.markdown_link} and #{zip_uploader.markdown_link}"
    end

    shared_examples "files are accessible" do
      describe '#rewrite' do
        let!(:new_text) { rewriter.rewrite(new_project) }

        let(:old_files) { [image_uploader, zip_uploader] }
        let(:new_files) do
          described_class.new(new_text, new_project, user).files
        end

        let(:old_paths) { old_files.map(&:path) }
        let(:new_paths) { new_files.map(&:path) }

        it 'rewrites content' 


        it 'copies files' 


        it 'does not remove old files' 


        it 'generates a new secret for each file' 

      end
    end

    context "file are stored locally" do
      include_examples "files are accessible"
    end

    context "files are stored remotely" do
      before do
        stub_uploads_object_storage(FileUploader)

        old_files.each do |file|
          file.migrate!(ObjectStorage::Store::REMOTE)
        end
      end

      include_examples "files are accessible"
    end

    describe '#needs_rewrite?' do
      subject { rewriter.needs_rewrite? }
      it { is_expected.to eq true }
    end

    describe '#files' do
      subject { rewriter.files }
      it { is_expected.to be_an(Array) }
    end
  end
end

