require 'spec_helper'

describe Projects::PipelinesController do
  include ApiHelpers

  set(:user) { create(:user) }
  set(:project) { create(:project, :public, :repository) }
  let(:feature) { ProjectFeature::DISABLED }

  before do
    stub_not_protect_default_branch
    project.add_developer(user)
    project.project_feature.update(builds_access_level: feature)

    sign_in(user)
  end

  describe 'GET index.json' do
    before do
      %w(pending running created success).each_with_index do |status, index|
        sha = project.commit("HEAD~#{index}")
        create(:ci_empty_pipeline, status: status, project: project, sha: sha)
      end
    end

    subject do
      get :index, namespace_id: project.namespace, project_id: project, format: :json
    end

    it 'returns JSON with serialized pipelines' 


    context 'when performing gitaly calls', :request_store do
      it 'limits the Gitaly requests' 

    end
  end

  describe 'GET show JSON' do
    let(:pipeline) { create(:ci_pipeline_with_one_job, project: project) }

    it 'returns the pipeline' 


    context 'when the pipeline has multiple stages and groups', :request_store do
      before do
        create_build('build', 0, 'build')
        create_build('test', 1, 'rspec 0')
        create_build('deploy', 2, 'production')
        create_build('post deploy', 3, 'pages 0')
      end

      let(:project) { create(:project, :repository) }
      let(:pipeline) do
        create(:ci_empty_pipeline, project: project, user: user, sha: project.commit.id)
      end

      it 'does not perform N + 1 queries' 

    end

    def get_pipeline_json
      get :show, namespace_id: project.namespace, project_id: project, id: pipeline, format: :json
    end

    def create_build(stage, stage_idx, name)
      create(:ci_build, pipeline: pipeline, stage: stage, stage_idx: stage_idx, name: name)
    end
  end

  describe 'GET stages.json' do
    let(:pipeline) { create(:ci_pipeline, project: project) }

    context 'when accessing existing stage' do
      before do
        create(:ci_build, pipeline: pipeline, stage: 'build')

        get_stage('build')
      end

      it 'returns html source for stage dropdown' 

    end

    context 'when accessing unknown stage' do
      before do
        get_stage('test')
      end

      it 'responds with not found' 

    end

    def get_stage(name)
      get :stage, namespace_id: project.namespace,
                  project_id: project,
                  id: pipeline.id,
                  stage: name,
                  format: :json
    end
  end

  describe 'GET stages_ajax.json' do
    let(:pipeline) { create(:ci_pipeline, project: project) }

    context 'when accessing existing stage' do
      before do
        create(:ci_build, pipeline: pipeline, stage: 'build')

        get_stage_ajax('build')
      end

      it 'returns html source for stage dropdown' 

    end

    context 'when accessing unknown stage' do
      before do
        get_stage_ajax('test')
      end

      it 'responds with not found' 

    end

    def get_stage_ajax(name)
      get :stage_ajax, namespace_id: project.namespace,
                       project_id: project,
                       id: pipeline.id,
                       stage: name,
                       format: :json
    end
  end

  describe 'GET status.json' do
    let(:pipeline) { create(:ci_pipeline, project: project) }
    let(:status) { pipeline.detailed_status(double('user')) }

    before do
      get :status, namespace_id: project.namespace,
                   project_id: project,
                   id: pipeline.id,
                   format: :json
    end

    it 'return a detailed pipeline status in json' 

  end

  describe 'POST retry.json' do
    let!(:pipeline) { create(:ci_pipeline, :failed, project: project) }
    let!(:build) { create(:ci_build, :failed, pipeline: pipeline) }

    before do
      post :retry, namespace_id: project.namespace,
                   project_id: project,
                   id: pipeline.id,
                   format: :json
    end

    context 'when builds are enabled' do
      let(:feature) { ProjectFeature::ENABLED }

      it 'retries a pipeline without returning any content' 

    end

    context 'when builds are disabled' do
      it 'fails to retry pipeline' 

    end
  end

  describe 'POST cancel.json' do
    let!(:pipeline) { create(:ci_pipeline, project: project) }
    let!(:build) { create(:ci_build, :running, pipeline: pipeline) }

    before do
      post :cancel, namespace_id: project.namespace,
                    project_id: project,
                    id: pipeline.id,
                    format: :json
    end

    context 'when builds are enabled' do
      let(:feature) { ProjectFeature::ENABLED }

      it 'cancels a pipeline without returning any content' 

    end

    context 'when builds are disabled' do
      it 'fails to retry pipeline' 

    end
  end
end

