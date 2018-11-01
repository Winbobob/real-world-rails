require 'spec_helper'

describe EnvironmentSerializer do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  let(:json) do
    described_class
      .new(current_user: user, project: project)
      .represent(resource)
  end

  context 'when there is a single object provided' do
    let(:project) { create(:project, :repository) }
    let(:deployable) { create(:ci_build) }
    let(:deployment) do
      create(:deployment, deployable: deployable,
                          user: user,
                          project: project,
                          sha: project.commit.id)
    end
    let(:resource) { deployment.environment }

    before do
      create(:ci_build, :manual, name: 'manual1', pipeline: deployable.pipeline)
    end

    it 'contains important elements of environment' 


    it 'contains relevant information about last deployment' 

  end

  context 'when there is a collection of objects provided' do
    let(:project) { create(:project) }
    let(:resource) { create_list(:environment, 2) }

    it 'contains important elements of environment' 


    it 'generates payload for collection' 

  end

  context 'when representing environments within folders' do
    let(:serializer) do
      described_class
        .new(current_user: user, project: project)
        .within_folders
    end

    let(:resource) { Environment.all }

    subject { serializer.represent(resource) }

    context 'when there is a single environment' do
      before do
        create(:environment, name: 'staging')
      end

      it 'represents one standalone environment' 

    end

    context 'when there are multiple environments in folder' do
      before do
        create(:environment, name: 'staging/my-review-1')
        create(:environment, name: 'staging/my-review-2')
      end

      it 'represents one item that is a folder' 

    end

    context 'when there are multiple folders and standalone environments' do
      before do
        create(:environment, name: 'staging/my-review-1')
        create(:environment, name: 'staging/my-review-2')
        create(:environment, name: 'production/my-review-3')
        create(:environment, name: 'testing')
      end

      it 'represents multiple items grouped within folders' 

    end
  end

  context 'when used with pagination' do
    let(:request) { spy('request') }
    let(:response) { spy('response') }
    let(:resource) { Environment.all }
    let(:pagination) { { page: 1, per_page: 2 } }

    let(:serializer) do
      described_class
        .new(current_user: user, project: project)
        .with_pagination(request, response)
    end

    before do
      allow(request).to receive(:query_parameters)
        .and_return(pagination)
    end

    subject { serializer.represent(resource) }

    it 'creates a paginated serializer' 


    context 'when resource is paginatable relation' do
      context 'when there is a single environment object in relation' do
        before do
          create(:environment)
        end

        it 'serializes environments' 

      end

      context 'when multiple environment objects are serialized' do
        before do
          create_list(:environment, 3)
        end

        it 'serializes appropriate number of objects' 


        it 'appends relevant headers' 

      end

      context 'when grouping environments within folders' do
        let(:serializer) do
          described_class
            .new(current_user: user, project: project)
            .with_pagination(request, response)
            .within_folders
        end

        before do
          create(:environment, name: 'staging/review-1')
          create(:environment, name: 'staging/review-2')
          create(:environment, name: 'production/deploy-3')
          create(:environment, name: 'testing')
        end

        it 'paginates grouped items including ordering' 


        it 'appends correct total page count header' 


        it 'appends correct page count headers' 

      end
    end
  end
end

