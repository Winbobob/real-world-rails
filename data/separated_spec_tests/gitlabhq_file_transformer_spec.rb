require "spec_helper"

describe Lfs::FileTransformer do
  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:file_content) { 'Test file content' }
  let(:branch_name) { 'lfs' }
  let(:file_path) { 'test_file.lfs' }

  subject { described_class.new(project, branch_name) }

  describe '#new_file' do
    context 'with lfs disabled' do
      it 'skips gitattributes check' 


      it 'returns untransformed content' 


      it 'returns untransformed encoding' 

    end

    context 'with lfs enabled' do
      before do
        allow(project).to receive(:lfs_enabled?).and_return(true)
      end

      it 'reuses cached gitattributes' 


      it "creates an LfsObject with the file's content" 


      it 'returns an LFS pointer' 


      it 'returns LFS pointer encoding as text' 


      context "when doesn't use LFS" do
        let(:file_path) { 'other.filetype' }

        it "doesn't create LFS pointers" 

      end

      it 'links LfsObjects to project' 


      context 'when LfsObject already exists' do
        let(:lfs_pointer) { Gitlab::Git::LfsPointerFile.new(file_content) }

        before do
          create(:lfs_object, oid: lfs_pointer.sha256, size: lfs_pointer.size)
        end

        it 'links LfsObjects to project' 

      end
    end
  end
end

