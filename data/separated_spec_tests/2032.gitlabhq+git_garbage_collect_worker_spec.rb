require 'fileutils'

require 'spec_helper'

describe GitGarbageCollectWorker do
  include GitHelpers

  let(:project) { create(:project, :repository) }
  let(:shell) { Gitlab::Shell.new }
  let!(:lease_uuid) { SecureRandom.uuid }
  let!(:lease_key) { "project_housekeeping:#{project.id}" }

  subject { described_class.new }

  describe "#perform" do
    context 'with active lease_uuid' do
      before do
        allow(subject).to receive(:get_lease_uuid).and_return(lease_uuid)
      end

      it "flushes ref caches when the task if 'gc'" 


      it 'handles gRPC errors' 

    end

    context 'with different lease than the active one' do
      before do
        allow(subject).to receive(:get_lease_uuid).and_return(SecureRandom.uuid)
      end

      it 'returns silently' 

    end

    context 'with no active lease' do
      before do
        allow(subject).to receive(:get_lease_uuid).and_return(false)
      end

      context 'when is able to get the lease' do
        before do
          allow(subject).to receive(:try_obtain_lease).and_return(SecureRandom.uuid)
        end

        it "flushes ref caches when the task if 'gc'" 

      end

      context 'when no lease can be obtained' do
        before do
          expect(subject).to receive(:try_obtain_lease).and_return(false)
        end

        it 'returns silently' 

      end
    end

    context "repack_full" do
      before do
        expect(subject).to receive(:get_lease_uuid).and_return(lease_uuid)
      end

      it "calls Gitaly" 

    end

    context "repack_incremental" do
      before do
        expect(subject).to receive(:get_lease_uuid).and_return(lease_uuid)
      end

      it "calls Gitaly" 

    end

    shared_examples 'gc tasks' do
      before do
        allow(subject).to receive(:get_lease_uuid).and_return(lease_uuid)
        allow(subject).to receive(:bitmaps_enabled?).and_return(bitmaps_enabled)
      end

      it 'incremental repack adds a new packfile' 


      it 'full repack consolidates into 1 packfile' 


      it 'gc consolidates into 1 packfile and updates packed-refs' 


      it 'cleans up repository after finishing' 

    end

    context 'with bitmaps enabled' do
      let(:bitmaps_enabled) { true }

      include_examples 'gc tasks'
    end

    context 'with bitmaps disabled' do
      let(:bitmaps_enabled) { false }

      include_examples 'gc tasks'
    end
  end

  # Create a new commit on a random new branch
  def create_objects(project)
    rugged = rugged_repo(project.repository)
    old_commit = rugged.branches.first.target
    new_commit_sha = Rugged::Commit.create(
      rugged,
      message: "hello world #{SecureRandom.hex(6)}",
      author: Gitlab::Git.committer_hash(email: 'foo@bar', name: 'baz'),
      committer: Gitlab::Git.committer_hash(email: 'foo@bar', name: 'baz'),
      tree: old_commit.tree,
      parents: [old_commit]
    )
    rugged.references.create("refs/heads/#{SecureRandom.hex(6)}", new_commit_sha)
  end

  def packs(project)
    Gitlab::GitalyClient::StorageSettings.allow_disk_access do
      Dir["#{project.repository.path_to_repo}/objects/pack/*.pack"]
    end
  end

  def packed_refs(project)
    path = "#{project.repository.path_to_repo}/packed-refs"
    FileUtils.touch(path)
    File.read(path)
  end

  def bitmap_path(pack)
    pack.sub(/\.pack\z/, '.bitmap')
  end
end

