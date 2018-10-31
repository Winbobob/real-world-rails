require 'spec_helper'

describe ExtractsPath do
  include described_class
  include RepoHelpers
  include Gitlab::Routing

  let(:project) { double('project') }
  let(:request) { double('request') }

  before do
    @project = project

    repo = double(ref_names: ['master', 'foo/bar/baz', 'v1.0.0', 'v2.0.0',
                              'release/app', 'release/app/v1.0.0'])
    allow(project).to receive(:repository).and_return(repo)
    allow(project).to receive(:full_path)
      .and_return('gitlab/gitlab-ci')
    allow(request).to receive(:format=)
  end

  describe '#assign_ref_vars' do
    let(:ref) { sample_commit[:id] }
    let(:params) { { path: sample_commit[:line_code_path], ref: ref } }

    before do
      @project = create(:project, :repository)
    end

    it "log tree path has no escape sequences" 


    context 'ref contains %20' do
      let(:ref) { 'foo%20bar' }

      it 'is not converted to a space in @id' 

    end

    context 'path contains space' do
      let(:params) { { path: 'with space', ref: '38008cb17ce1466d8fec2dfa6f6ab8dcfe5cf49e' } }

      it 'is not converted to %20 in @path' 

    end

    context 'subclass overrides get_id' do
      it 'uses ref returned by get_id' 

    end

    context 'ref only exists without .atom suffix' do
      context 'with a path' do
        let(:params) { { ref: 'v1.0.0.atom', path: 'README.md' } }

        it 'renders a 404' 

      end

      context 'without a path' do
        let(:params) { { ref: 'v1.0.0.atom' } }

        before do
          assign_ref_vars
        end

        it 'sets the un-suffixed version as @ref' 


        it 'sets the request format to Atom' 

      end
    end

    context 'ref exists with .atom suffix' do
      context 'with a path' do
        let(:params) { { ref: 'master.atom', path: 'README.md' } }

        before do
          repository = @project.repository
          allow(repository).to receive(:commit).and_call_original
          allow(repository).to receive(:commit).with('master.atom').and_return(repository.commit('master'))

          assign_ref_vars
        end

        it 'sets the suffixed version as @ref' 


        it 'does not change the request format' 

      end

      context 'without a path' do
        let(:params) { { ref: 'master.atom' } }

        before do
          repository = @project.repository
          allow(repository).to receive(:commit).and_call_original
          allow(repository).to receive(:commit).with('master.atom').and_return(repository.commit('master'))
        end

        it 'sets the suffixed version as @ref' 


        it 'does not change the request format' 

      end
    end
  end

  describe '#extract_ref' do
    it "returns an empty pair when no @project is set" 


    context "without a path" do
      it "extracts a valid branch" 


      it "extracts a valid tag" 


      it "extracts a valid commit ref without a path" 


      it "falls back to a primitive split for an invalid ref" 


      it "extracts the longest matching ref" 

    end

    context "with a path" do
      it "extracts a valid branch" 


      it "extracts a valid tag" 


      it "extracts a valid commit SHA" 


      it "falls back to a primitive split for an invalid ref" 

    end
  end

  describe '#extract_ref_without_atom' do
    it 'ignores any matching refs suffixed with atom' 


    it 'returns the longest matching ref' 


    it 'returns nil if there are no matching refs' 

  end

  describe '#lfs_blob_ids' do
    shared_examples '#lfs_blob_ids' do
      let(:tag) { @project.repository.add_tag(@project.owner, 'my-annotated-tag', 'master', 'test tag') }
      let(:ref) { tag.target }
      let(:params) { { ref: ref, path: 'README.md' } }

      before do
        @project = create(:project, :repository)
      end

      it 'handles annotated tags' 

    end

    context 'when gitaly is enabled' do
      it_behaves_like '#lfs_blob_ids'
    end

    context 'when gitaly is disabled', :skip_gitaly_mock do
      it_behaves_like '#lfs_blob_ids'
    end
  end
end

