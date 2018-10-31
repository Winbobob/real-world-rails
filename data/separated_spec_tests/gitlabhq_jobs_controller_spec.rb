# coding: utf-8
require 'spec_helper'

describe Projects::JobsController, :clean_gitlab_redis_shared_state do
  include ApiHelpers
  include HttpIOHelpers

  let(:project) { create(:project, :public) }
  let(:pipeline) { create(:ci_pipeline, project: project) }
  let(:user) { create(:user) }

  before do
    stub_feature_flags(ci_enable_live_trace: true)
    stub_not_protect_default_branch
  end

  describe 'GET index' do
    context 'when scope is pending' do
      before do
        create(:ci_build, :pending, pipeline: pipeline)

        get_index(scope: 'pending')
      end

      it 'has only pending builds' 

    end

    context 'when scope is running' do
      before do
        create(:ci_build, :running, pipeline: pipeline)

        get_index(scope: 'running')
      end

      it 'has only running jobs' 

    end

    context 'when scope is finished' do
      before do
        create(:ci_build, :success, pipeline: pipeline)

        get_index(scope: 'finished')
      end

      it 'has only finished jobs' 

    end

    context 'when page is specified' do
      let(:last_page) { project.builds.page.total_pages }

      context 'when page number is eligible' do
        before do
          create_list(:ci_build, 2, pipeline: pipeline)

          get_index(page: last_page.to_param)
        end

        it 'redirects to the page' 

      end
    end

    context 'number of queries' do
      before do
        Ci::Build::AVAILABLE_STATUSES.each do |status|
          create_job(status, status)
        end
      end

      it 'verifies number of queries', :request_store do
        recorded = ActiveRecord::QueryRecorder.new { get_index }
        expect(recorded.count).to be_within(5).of(7)
      end

      def create_job(name, status)
        pipeline = create(:ci_pipeline, project: project)
        create(:ci_build, :tags, :triggered, :artifacts,
          pipeline: pipeline, name: name, status: status)
      end
    end

    def get_index(**extra_params)
      params = {
        namespace_id: project.namespace.to_param,
        project_id: project
      }

      get :index, params.merge(extra_params)
    end
  end

  describe 'GET show' do
    let!(:job) { create(:ci_build, :failed, pipeline: pipeline) }

    context 'when requesting HTML' do
      context 'when job exists' do
        before do
          get_show(id: job.id)
        end

        it 'has a job' 

      end

      context 'when job does not exist' do
        before do
          get_show(id: 1234)
        end

        it 'renders not_found' 

      end
    end

    context 'when requesting JSON' do
      let(:merge_request) { create(:merge_request, source_project: project) }

      before do
        project.add_developer(user)
        sign_in(user)

        allow_any_instance_of(Ci::Build).to receive(:merge_request).and_return(merge_request)

        get_show(id: job.id, format: :json)
      end

      it 'exposes needed information' 

    end

    def get_show(**extra_params)
      params = {
        namespace_id: project.namespace.to_param,
        project_id: project
      }

      get :show, params.merge(extra_params)
    end
  end

  describe 'GET trace.json' do
    before do
      get_trace
    end

    context 'when job has a trace artifact' do
      let(:job) { create(:ci_build, :trace_artifact, pipeline: pipeline) }

      it 'returns a trace' 

    end

    context 'when job has a trace' do
      let(:job) { create(:ci_build, :trace_live, pipeline: pipeline) }

      it 'returns a trace' 

    end

    context 'when job has no traces' do
      let(:job) { create(:ci_build, pipeline: pipeline) }

      it 'returns no traces' 

    end

    context 'when job has a trace with ANSI sequence and Unicode' do
      let(:job) { create(:ci_build, :unicode_trace_live, pipeline: pipeline) }

      it 'returns a trace with Unicode' 

    end

    context 'when trace artifact is in ObjectStorage' do
      let!(:job) { create(:ci_build, :success, :trace_artifact, pipeline: pipeline) }

      before do
        allow_any_instance_of(JobArtifactUploader).to receive(:file_storage?) { false }
        allow_any_instance_of(JobArtifactUploader).to receive(:url) { remote_trace_url }
        allow_any_instance_of(JobArtifactUploader).to receive(:size) { remote_trace_size }
      end

      context 'when there are no network issues' do
        before do
          stub_remote_trace_206

          get_trace
        end

        it 'returns a trace' 

      end

      context 'when there is a network issue' do
        before do
          stub_remote_trace_500
        end

        it 'returns a trace' 

      end
    end

    def get_trace
      get :trace, namespace_id: project.namespace,
                  project_id: project,
                  id: job.id,
                  format: :json
    end
  end

  describe 'GET status.json' do
    let(:job) { create(:ci_build, pipeline: pipeline) }
    let(:status) { job.detailed_status(double('user')) }

    before do
      get :status, namespace_id: project.namespace,
                   project_id: project,
                   id: job.id,
                   format: :json
    end

    it 'return a detailed job status in json' 

  end

  describe 'POST retry' do
    before do
      project.add_developer(user)
      sign_in(user)

      post_retry
    end

    context 'when job is retryable' do
      let(:job) { create(:ci_build, :retryable, pipeline: pipeline) }

      it 'redirects to the retried job page' 

    end

    context 'when job is not retryable' do
      let(:job) { create(:ci_build, pipeline: pipeline) }

      it 'renders unprocessable_entity' 

    end

    def post_retry
      post :retry, namespace_id: project.namespace,
                   project_id: project,
                   id: job.id
    end
  end

  describe 'POST play' do
    before do
      project.add_developer(user)

      create(:protected_branch, :developers_can_merge,
             name: 'master', project: project)

      sign_in(user)

      post_play
    end

    context 'when job is playable' do
      let(:job) { create(:ci_build, :playable, pipeline: pipeline) }

      it 'redirects to the played job page' 


      it 'transits to pending' 

    end

    context 'when job is not playable' do
      let(:job) { create(:ci_build, pipeline: pipeline) }

      it 'renders unprocessable_entity' 

    end

    def post_play
      post :play, namespace_id: project.namespace,
                  project_id: project,
                  id: job.id
    end
  end

  describe 'POST cancel' do
    before do
      project.add_developer(user)
      sign_in(user)

      post_cancel
    end

    context 'when job is cancelable' do
      let(:job) { create(:ci_build, :cancelable, pipeline: pipeline) }

      it 'redirects to the canceled job page' 


      it 'transits to canceled' 

    end

    context 'when job is not cancelable' do
      let(:job) { create(:ci_build, :canceled, pipeline: pipeline) }

      it 'returns unprocessable_entity' 

    end

    def post_cancel
      post :cancel, namespace_id: project.namespace,
                    project_id: project,
                    id: job.id
    end
  end

  describe 'POST cancel_all' do
    before do
      project.add_developer(user)
      sign_in(user)
    end

    context 'when jobs are cancelable' do
      before do
        create_list(:ci_build, 2, :cancelable, pipeline: pipeline)

        post_cancel_all
      end

      it 'redirects to a index page' 


      it 'transits to canceled' 

    end

    context 'when jobs are not cancelable' do
      before do
        create_list(:ci_build, 2, :canceled, pipeline: pipeline)

        post_cancel_all
      end

      it 'redirects to a index page' 

    end

    def post_cancel_all
      post :cancel_all, namespace_id: project.namespace,
                        project_id: project
    end
  end

  describe 'POST erase' do
    let(:role) { :master }

    before do
      project.add_role(user, role)
      sign_in(user)

      post_erase
    end

    context 'when job is erasable' do
      let(:job) { create(:ci_build, :erasable, :trace_artifact, pipeline: pipeline) }

      it 'redirects to the erased job page' 


      it 'erases artifacts' 


      it 'erases trace' 

    end

    context 'when job is not erasable' do
      let(:job) { create(:ci_build, :erased, pipeline: pipeline) }

      it 'returns unprocessable_entity' 

    end

    context 'when user is developer' do
      let(:role) { :developer }
      let(:job) { create(:ci_build, :erasable, :trace_artifact, pipeline: pipeline, user: triggered_by) }

      context 'when triggered by same user' do
        let(:triggered_by) { user }

        it 'has successful status' 

      end

      context 'when triggered by different user' do
        let(:triggered_by) { create(:user) }

        it 'does not have successful status' 

      end
    end

    def post_erase
      post :erase, namespace_id: project.namespace,
                   project_id: project,
                   id: job.id
    end
  end

  describe 'GET raw' do
    subject do
      post :raw, namespace_id: project.namespace,
                 project_id: project,
                 id: job.id
    end

    context 'when job has a trace artifact' do
      let(:job) { create(:ci_build, :trace_artifact, pipeline: pipeline) }

      it 'returns a trace' 

    end

    context 'when job has a trace file' do
      let(:job) { create(:ci_build, :trace_live, pipeline: pipeline) }

      it 'send a trace file' 

    end

    context 'when job has a trace in database' do
      let(:job) { create(:ci_build, pipeline: pipeline) }

      before do
        job.update_column(:trace, 'Sample trace')
      end

      it 'send a trace file' 

    end

    context 'when job does not have a trace file' do
      let(:job) { create(:ci_build, pipeline: pipeline) }

      it 'returns not_found' 

    end

    context 'when the trace artifact is in ObjectStorage' do
      let!(:job) { create(:ci_build, :trace_artifact, pipeline: pipeline) }

      before do
        allow_any_instance_of(JobArtifactUploader).to receive(:file_storage?) { false }
      end

      it 'redirect to the trace file url' 

    end
  end
end

