require 'spec_helper'

describe Projects::Registry::TagsController do
  let(:user)    { create(:user) }
  let(:project) { create(:project, :private) }

  let(:repository) do
    create(:container_repository, name: 'image', project: project)
  end

  before do
    sign_in(user)
    stub_container_registry_config(enabled: true)
  end

  describe 'GET index' do
    let(:tags) do
      Array.new(40) { |i| "tag#{i}" }
    end

    before do
      stub_container_registry_tags(repository: /image/, tags: tags)
    end

    context 'when user can control the registry' do
      before do
        project.add_developer(user)
      end

      it 'receive a list of tags' 

    end

    context 'when user can read the registry' do
      before do
        project.add_reporter(user)
      end

      it 'receive a list of tags' 

    end

    context 'when user does not have access to registry' do
      before do
        project.add_guest(user)
      end

      it 'does not receive a list of tags' 

    end

    private

    def get_tags
      get :index, namespace_id: project.namespace,
                  project_id: project,
                  repository_id: repository,
                  format: :json
    end
  end

  describe 'POST destroy' do
    context 'when user has access to registry' do
      before do
        project.add_developer(user)
      end

      context 'when there is matching tag present' do
        before do
          stub_container_registry_tags(repository: repository.path, tags: %w[rc1 test.])
        end

        it 'makes it possible to delete regular tag' 


        it 'makes it possible to delete a tag that ends with a dot' 

      end
    end

    private

    def destroy_tag(name)
      post :destroy, namespace_id: project.namespace,
                     project_id: project,
                     repository_id: repository,
                     id: name,
                     format: :json
    end
  end
end

