require 'spec_helper'

describe Projects::CommitController do
  set(:project)  { create(:project, :repository) }
  set(:user)     { create(:user) }
  let(:commit)   { project.commit("master") }
  let(:master_pickable_sha) { '7d3b0f7cff5f37573aea97cebfd5692ea1689924' }
  let(:master_pickable_commit)  { project.commit(master_pickable_sha) }

  before do
    sign_in(user)
    project.add_maintainer(user)
  end

  describe 'GET show' do
    render_views

    def go(extra_params = {})
      params = {
        namespace_id: project.namespace,
        project_id: project
      }

      get :show, params.merge(extra_params)
    end

    context 'with valid id' do
      it 'responds with 200' 

    end

    context 'with invalid id' do
      it 'responds with 404' 

    end

    it 'handles binary files' 


    shared_examples "export as" do |format|
      it "does generally work" 


      it "generates it" 


      it "renders it" 


      it "does not escape Html" 

    end

    describe "as diff" do
      it "triggers workhorse to serve the request" 

    end

    describe "as patch" do
      it "contains a git diff" 

    end

    context 'commit that removes a submodule' do
      render_views

      let(:fork_project) { create(:forked_project_with_submodules, visibility_level: 20) }
      let(:commit) { fork_project.commit('remove-submodule') }

      it 'renders it' 

    end

    context 'in the context of a merge_request' do
      let(:merge_request) { create(:merge_request, source_project: project) }
      let(:commit) { merge_request.commits.first }

      it 'prepare diff notes in the context of the merge request' 

    end
  end

  describe 'GET branches' do
    it 'contains branch and tags information' 


    it 'returns :limit_exceeded when number of branches/tags reach a threshhold' 

  end

  describe 'POST revert' do
    context 'when target branch is not provided' do
      it 'renders the 404 page' 

    end

    context 'when the revert was successful' do
      it 'redirects to the commits page' 

    end

    context 'when the revert failed' do
      before do
        post(:revert,
            namespace_id: project.namespace,
            project_id: project,
            start_branch: 'master',
            id: commit.id)
      end

      it 'redirects to the commit page' 

    end
  end

  describe 'POST cherry_pick' do
    context 'when target branch is not provided' do
      it 'renders the 404 page' 

    end

    context 'when the cherry-pick was successful' do
      it 'redirects to the commits page' 

    end

    context 'when the cherry_pick failed' do
      before do
        post(:cherry_pick,
            namespace_id: project.namespace,
            project_id: project,
            start_branch: 'master',
            id: master_pickable_commit.id)
      end

      it 'redirects to the commit page' 

    end
  end

  describe 'GET diff_for_path' do
    def diff_for_path(extra_params = {})
      params = {
        namespace_id: project.namespace,
        project_id: project
      }

      get :diff_for_path, params.merge(extra_params)
    end

    let(:existing_path) { '.gitmodules' }
    let(:commit2) { project.commit('5937ac0a7beb003549fc5fd26fc247adbce4a52e') }

    context 'when the commit exists' do
      context 'when the user has access to the project' do
        context 'when the path exists in the diff' do
          it 'enables diff notes' 


          it 'only renders the diffs for the path given' 

        end

        context 'when the path does not exist in the diff' do
          before do
            diff_for_path(id: commit.id, old_path: existing_path.succ, new_path: existing_path.succ)
          end

          it 'returns a 404' 

        end
      end

      context 'when the user does not have access to the project' do
        before do
          project.team.truncate
          diff_for_path(id: commit.id, old_path: existing_path, new_path: existing_path)
        end

        it 'returns a 404' 

      end
    end

    context 'when the commit does not exist' do
      before do
        diff_for_path(id: commit.id.reverse, old_path: existing_path, new_path: existing_path)
      end

      it 'returns a 404' 

    end
  end

  describe 'GET pipelines' do
    def get_pipelines(extra_params = {})
      params = {
        namespace_id: project.namespace,
        project_id: project
      }

      get :pipelines, params.merge(extra_params)
    end

    context 'when the commit exists' do
      context 'when the commit has pipelines' do
        before do
          create(:ci_pipeline, project: project, sha: commit.id)
        end

        context 'when rendering a HTML format' do
          it 'shows pipelines' 

        end

        context 'when rendering a JSON format' do
          it 'responds with serialized pipelines' 

        end
      end
    end

    context 'when the commit does not exist' do
      before do
        get_pipelines(id: 'e7a412c8da9f6d0081a633a4a402dde1c4694ebd')
      end

      it 'returns a 404' 

    end
  end
end

