require 'spec_helper'

describe Gitlab::ImportExport::MergeRequestParser do
  include ProjectForksHelper

  let(:user) { create(:user) }
  let!(:project) { create(:project, :repository, name: 'test-repo-restorer', path: 'test-repo-restorer') }
  let(:forked_project) { fork_project(project) }

  let!(:merge_request) do
    create(:merge_request, source_project: forked_project, target_project: project)
  end

  let(:parsed_merge_request) do
    described_class.new(project,
                        'abcd',
                        merge_request,
                        merge_request.as_json).parse!
  end

  after do
    FileUtils.rm_rf(project.repository.path_to_repo)
  end

  it 'has a source branch' 


  it 'has a target branch' 


  it 'parses a MR that has no source branch' 

end

