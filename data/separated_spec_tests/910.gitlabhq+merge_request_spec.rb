require 'spec_helper'

describe 'getting merge request information nested in a project' do
  include GraphqlHelpers

  let(:project) { create(:project, :repository, :public) }
  let(:current_user) { create(:user) }
  let(:merge_request_graphql_data) { graphql_data['project']['mergeRequest'] }
  let!(:merge_request) { create(:merge_request, source_project: project) }

  let(:query) do
    graphql_query_for(
      'project',
      { 'fullPath' => project.full_path },
      query_graphql_field('mergeRequest', iid: merge_request.iid)
    )
  end

  it_behaves_like 'a working graphql query' do
    before do
      post_graphql(query, current_user: current_user)
    end
  end

  it 'contains merge request information' 


  # This is a field coming from the `MergeRequestPresenter`
  it 'includes a web_url' 


  context 'permissions on the merge request' do
    it 'includes the permissions for the current user on a public project' 

  end

  context 'when the user does not have access to the merge request' do
    let(:project) { create(:project, :public, :repository) }

    it 'returns nil' 

  end

  context 'when there are pipelines' do
    before do
      pipeline = create(
        :ci_pipeline,
        project: merge_request.source_project,
        ref: merge_request.source_branch,
        sha: merge_request.diff_head_sha
      )
      merge_request.update!(head_pipeline: pipeline)
    end

    it 'has a head pipeline' 


    it 'has pipeline connections' 

  end
end

