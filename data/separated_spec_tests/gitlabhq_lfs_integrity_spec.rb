require 'spec_helper'

describe Gitlab::Checks::LfsIntegrity do
  include ProjectForksHelper

  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:newrev) do
    operations = BareRepoOperations.new(repository.path)

    # Create a commit not pointed at by any ref to emulate being in the
    # pre-receive hook so that `--not --all` returns some objects
    operations.commit_tree('8856a329dd38ca86dfb9ce5aa58a16d88cc119bd', "New LFS objects")
  end

  subject { described_class.new(project, newrev) }

  describe '#objects_missing?' do
    let(:blob_object) { repository.blob_at_branch('lfs', 'files/lfs/lfs_object.iso') }

    context 'with LFS not enabled' do
      it 'skips integrity check' 

    end

    context 'with LFS enabled' do
      before do
        allow(project).to receive(:lfs_enabled?).and_return(true)
      end

      context 'deletion' do
        let(:newrev) { nil }

        it 'skips integrity check' 

      end

      it 'is true if any LFS blobs are missing' 


      it 'is false if LFS objects have already been uploaded' 

    end

    context 'for forked project' do
      let(:parent_project) { create(:project, :repository) }
      let(:project) { fork_project(parent_project, nil, repository: true) }

      before do
        allow(project).to receive(:lfs_enabled?).and_return(true)
      end

      it 'is true parent project is missing LFS objects' 


      it 'is false parent project already conatins LFS objects for the fork' 

    end
  end
end

