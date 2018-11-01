# frozen_string_literal: true

require 'spec_helper'

describe Projects::ContainerRepository::DestroyService do
  set(:user) { create(:user) }
  set(:project) { create(:project, :private) }

  subject { described_class.new(project, user) }

  before do
    stub_container_registry_config(enabled: true)
  end

  context 'when user does not have access to registry' do
    let!(:repository) { create(:container_repository, :root, project: project) }

    it 'does not delete a repository' 

  end

  context 'when user has access to registry' do
    before do
      project.add_developer(user)
    end

    context 'when root container repository exists' do
      let!(:repository) { create(:container_repository, :root, project: project) }

      before do
        stub_container_registry_tags(repository: :any, tags: [])
      end

      it 'deletes the repository' 

    end
  end
end

