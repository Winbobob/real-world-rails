require 'spec_helper'

describe 'getting project information' do
  include GraphqlHelpers

  let(:project) { create(:project, :repository) }
  let(:current_user) { create(:user) }

  let(:query) do
    graphql_query_for('project', 'fullPath' => project.full_path)
  end

  context 'when the user has access to the project' do
    before do
      project.add_developer(current_user)
    end

    it 'includes the project' 


    it_behaves_like 'a working graphql query' do
      before do
        post_graphql(query, current_user: current_user)
      end
    end

    context 'when there are pipelines present' do
      before do
        create(:ci_pipeline, project: project)
      end

      it 'is included in the pipelines connection' 

    end
  end

  context 'when the user does not have access to the project' do
    it 'returns an empty field' 


    it_behaves_like 'a working graphql query' do
      before do
        post_graphql(query, current_user: current_user)
      end
    end
  end
end

