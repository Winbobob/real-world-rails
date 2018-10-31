require 'spec_helper'

describe DiffFileEntity do
  include RepoHelpers

  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:commit) { project.commit(sample_commit.id) }
  let(:diff_refs) { commit.diff_refs }
  let(:diff) { commit.raw_diffs.first }
  let(:diff_file) { Gitlab::Diff::File.new(diff, diff_refs: diff_refs, repository: repository) }
  let(:entity) { described_class.new(diff_file, request: {}) }

  subject { entity.as_json }

  shared_examples 'diff file entity' do
    it 'exposes correct attributes' 


    it 'includes viewer' 


    # Converted diff files from GitHub import does not contain blob file
    # and content sha.
    context 'when diff file does not have a blob and content sha' do
      it 'exposes some attributes as nil' 

    end
  end

  context 'when there is no merge request' do
    it_behaves_like 'diff file entity'
  end

  context 'when there is a merge request' do
    let(:user) { create(:user) }
    let(:request) { EntityRequest.new(project: project, current_user: user) }
    let(:merge_request) { create(:merge_request, source_project: project, target_project: project) }
    let(:entity) { described_class.new(diff_file, request: request, merge_request: merge_request) }
    let(:exposed_urls) { %i(load_collapsed_diff_url edit_path view_path context_lines_path) }

    it_behaves_like 'diff file entity'

    it 'exposes additional attributes' 


    it 'points all urls to merge request target project' 

  end

  context '#parallel_diff_lines' do
    it 'exposes parallel diff lines correctly' 

  end
end

