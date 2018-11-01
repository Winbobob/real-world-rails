require 'spec_helper'

describe Projects::Registry::RepositoriesController do
  let(:user)    { create(:user) }
  let(:project) { create(:project, :private) }

  before do
    sign_in(user)
    stub_container_registry_config(enabled: true)
  end

  context 'when user has access to registry' do
    before do
      project.add_developer(user)
    end

    describe 'GET index' do
      context 'when root container repository exists' do
        before do
          create(:container_repository, :root, project: project)
        end

        it 'does not create root container repository' 

      end

      context 'when root container repository is not created' do
        context 'when there are tags for this repository' do
          before do
            stub_container_registry_tags(repository: project.full_path,
                                         tags: %w[rc1 latest])
          end

          it 'successfully renders container repositories' 


          it 'creates a root container repository' 


          it 'json has a list of projects' 

        end

        context 'when there are no tags for this repository' do
          before do
            stub_container_registry_tags(repository: :any, tags: [])
          end

          it 'successfully renders container repositories' 


          it 'does not ensure root container repository' 


          it 'responds with json if asked' 

        end
      end
    end

    describe 'DELETE destroy' do
      context 'when root container repository exists' do
        let!(:repository) do
          create(:container_repository, :root, project: project)
        end

        before do
          stub_container_registry_tags(repository: :any, tags: [])
        end

        it 'schedules a job to delete a repository' 

      end
    end
  end

  context 'when user does not have access to registry' do
    describe 'GET index' do
      it 'responds with 404' 


      it 'does not ensure root container repository' 

    end
  end

  def go_to_index(format: :html)
    get :index, namespace_id: project.namespace,
                project_id: project,
                format: format
  end

  def delete_repository(repository)
    delete :destroy, namespace_id: project.namespace,
                     project_id: project,
                     id: repository,
                     format: :json
  end
end

