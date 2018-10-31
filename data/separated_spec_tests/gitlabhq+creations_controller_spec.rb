require 'spec_helper'

describe Projects::MergeRequests::CreationsController do
  let(:project) { create(:project, :repository) }
  let(:user)    { project.owner }
  let(:fork_project) { create(:forked_project_with_submodules) }
  let(:get_diff_params) do
    {
      namespace_id: fork_project.namespace.to_param,
      project_id: fork_project,
      merge_request: {
        source_branch: 'remove-submodule',
        target_branch: 'master'
      }
    }
  end

  before do
    fork_project.add_maintainer(user)
    Projects::ForkService.new(project, user).execute(fork_project)
    sign_in(user)
  end

  describe 'GET new' do
    context 'merge request that removes a submodule' do
      it 'renders new merge request widget template' 

    end

    context 'merge request with some commits' do
      render_views

      let(:large_diff_params) do
        {
          namespace_id: fork_project.namespace.to_param,
          project_id: fork_project,
          merge_request: {
            source_branch: 'master',
            target_branch: 'fix'
          }
        }
      end

      describe 'with artificial limits' do
        before do
          # Load MergeRequestdiff so stub_const won't override it with its own definition
          # See https://github.com/rspec/rspec-mocks/issues/1079
          stub_const("#{MergeRequestDiff}::COMMITS_SAFE_SIZE", 2)
        end

        it 'limits total commits' 

      end

      it 'shows total commits' 

    end
  end

  describe 'GET diffs' do
    context 'when merge request cannot be created' do
      it 'does not assign diffs var' 

    end
  end

  describe 'GET pipelines' do
    before do
      create(:ci_pipeline, sha: fork_project.commit('remove-submodule').id,
                           ref: 'remove-submodule',
                           project: fork_project)
    end

    it 'renders JSON including serialized pipelines' 

  end

  describe 'GET diff_for_path' do
    def diff_for_path(extra_params = {})
      params = {
        namespace_id: project.namespace.to_param,
        project_id: project,
        format: 'json'
      }

      get :diff_for_path, params.merge(extra_params)
    end

    let(:existing_path) { 'files/ruby/feature.rb' }

    context 'when both branches are in the same project' do
      it 'disables diff notes' 


      it 'only renders the diffs for the path given' 

    end

    context 'when the source branch is in a different project to the target' do
      let(:other_project) { create(:project, :repository) }

      before do
        other_project.add_maintainer(user)
      end

      context 'when the path exists in the diff' do
        it 'disables diff notes' 


        it 'only renders the diffs for the path given' 

      end

      context 'when the path does not exist in the diff' do
        before do
          diff_for_path(old_path: 'files/ruby/nopen.rb', new_path: 'files/ruby/nopen.rb', merge_request: { source_project: other_project, source_branch: 'feature', target_branch: 'master' })
        end

        it 'returns a 404' 

      end
    end
  end

  describe 'GET #branch_to' do
    before do
      allow(Ability).to receive(:allowed?).and_call_original
    end

    it 'fetches the commit if a user has access' 


    it 'does not load the commit when the user cannot read the project' 

  end
end

