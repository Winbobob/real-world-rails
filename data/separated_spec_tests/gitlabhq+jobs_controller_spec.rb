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
    let!(:second_job) { create(:ci_build, :failed, pipeline: pipeline) }
    let!(:third_job) { create(:ci_build, :failed) }

    context 'when requesting HTML' do
      context 'when job exists' do
        before do
          get_show(id: job.id)
        end

        it 'has a job' 


        it 'has the correct build collection' 

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

      context 'when job failed' do
        it 'exposes needed information' 

      end

      context 'when job is running' do
        context 'job is cancelable' do
          let(:job) { create(:ci_build, :running, pipeline: pipeline) }

          it 'cancel_path is present with correct redirect' 

        end

        context 'with web terminal' do
          let(:job) { create(:ci_build, :running, :with_runner_session, pipeline: pipeline) }

          it 'exposes the terminal path' 

        end
      end

      context 'when job has artifacts' do
        context 'with not expiry date' do
          let(:job) { create(:ci_build, :success, :artifacts, pipeline: pipeline) }

          it 'exposes needed information' 

        end

        context 'with expiry date' do
          let(:job) { create(:ci_build, :success, :artifacts, :expired, pipeline: pipeline) }

          it 'exposes needed information' 

        end
      end

      context 'when job passed with no trace' do
        let(:job) { create(:ci_build, :success, :artifacts, pipeline: pipeline) }

        it 'exposes empty state illustrations' 

      end

      context 'with no deployment' do
        let(:job) { create(:ci_build, :success, pipeline: pipeline) }

        it 'does not exposes the deployment information' 

      end

      context 'with deployment' do
        let(:merge_request) { create(:merge_request, source_project: project) }
        let(:environment) { create(:environment, project: project, name: 'staging', state: :available) }
        let(:job) { create(:ci_build, :success, environment: environment.name, pipeline: pipeline) }

        it 'exposes the deployment information' 

      end

      context 'when user can edit runner' do
        context 'that belongs to the project' do
          let(:runner) { create(:ci_runner, :project, projects: [project]) }
          let(:job) { create(:ci_build, :success, pipeline: pipeline, runner: runner) }

          before do
            project.add_maintainer(user)
            sign_in(user)

            get_show(id: job.id, format: :json)
          end

          it 'user can edit runner' 

        end

        context 'that belongs to group' do
          let(:group) { create(:group) }
          let(:runner) { create(:ci_runner, :group, groups: [group]) }
          let(:job) { create(:ci_build, :success, pipeline: pipeline, runner: runner) }
          let(:user) { create(:user, :admin) }

          before do
            project.add_maintainer(user)
            sign_in(user)

            get_show(id: job.id, format: :json)
          end

          it 'user can not edit runner' 

        end

        context 'that belongs to instance' do
          let(:runner) { create(:ci_runner, :instance) }
          let(:job) { create(:ci_build, :success, pipeline: pipeline, runner: runner) }
          let(:user) { create(:user, :admin) }

          before do
            project.add_maintainer(user)
            sign_in(user)

            get_show(id: job.id, format: :json)
          end

          it 'user can not edit runner' 

        end
      end

      context 'when no runners are available' do
        let(:runner) { create(:ci_runner, :instance, active: false) }
        let(:job) { create(:ci_build, :pending, pipeline: pipeline, runner: runner) }

        it 'exposes needed information' 

      end

      context 'when no runner is online' do
        let(:runner) { create(:ci_runner, :instance) }
        let(:job) { create(:ci_build, :pending, pipeline: pipeline, runner: runner) }

        it 'exposes needed information' 

      end

      context 'settings_path' do
        context 'when user is developer' do
          it 'settings_path is not available' 

        end

        context 'when user is maintainer' do
          let(:user) { create(:user, :admin) }

          before do
            project.add_maintainer(user)
            sign_in(user)
          end

          it 'settings_path is available' 

        end
      end

      context 'when no trace is available' do
        it 'has_trace is false' 

      end

      context 'when job has trace' do
        let(:job) { create(:ci_build, :running, :trace_live, pipeline: pipeline) }

        it "has_trace is true" 

      end

      it 'exposes the stage the job belongs to' 

    end

    context 'when requesting JSON job is triggered' do
      let!(:merge_request) { create(:merge_request, source_project: project) }
      let(:trigger) { create(:ci_trigger, project: project) }
      let(:trigger_request) { create(:ci_trigger_request, pipeline: pipeline, trigger: trigger) }
      let(:job) { create(:ci_build, pipeline: pipeline, trigger_request: trigger_request) }

      before do
        project.add_developer(user)
        sign_in(user)

        allow_any_instance_of(Ci::Build).to receive(:merge_request).and_return(merge_request)
      end

      context 'with no variables' do
        before do
          get_show(id: job.id, format: :json)
        end

        it 'exposes trigger information' 

      end

      context 'with variables' do
        before do
          create(:ci_pipeline_variable, pipeline: pipeline, key: :TRIGGER_KEY_1, value: 'TRIGGER_VALUE_1')

          get_show(id: job.id, format: :json)
        end

        it 'exposes trigger information and variables' 

      end
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
      let(:url) { 'http://object-storage/trace' }
      let(:file_path) { expand_fixture_path('trace/sample_trace') }
      let!(:job) { create(:ci_build, :success, :trace_artifact, pipeline: pipeline) }

      before do
        allow_any_instance_of(JobArtifactUploader).to receive(:file_storage?) { false }
        allow_any_instance_of(JobArtifactUploader).to receive(:url) { url }
        allow_any_instance_of(JobArtifactUploader).to receive(:size) { File.size(file_path) }
      end

      context 'when there are no network issues' do
        before do
          stub_remote_url_206(url, file_path)

          get_trace
        end

        it 'returns a trace' 

      end

      context 'when there is a network issue' do
        before do
          stub_remote_url_500(url)
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
    end

    context 'when continue url is present' do
      let(:job) { create(:ci_build, :cancelable, pipeline: pipeline) }

      context 'when continue to is a safe url' do
        let(:url) { '/test' }

        before do
          post_cancel(continue: { to: url })
        end

        it 'redirects to the continue url' 


        it 'transits to canceled' 

      end

      context 'when continue to is not a safe url' do
        let(:url) { 'http://example.com' }

        it 'raises an error' 

      end
    end

    context 'when continue url is not present' do
      before do
        post_cancel
      end

      context 'when job is cancelable' do
        let(:job) { create(:ci_build, :cancelable, pipeline: pipeline) }

        it 'redirects to the builds page' 


        it 'transits to canceled' 

      end

      context 'when job is not cancelable' do
        let(:job) { create(:ci_build, :canceled, pipeline: pipeline) }

        it 'returns unprocessable_entity' 

      end
    end

    def post_cancel(additional_params = {})
      post :cancel, { namespace_id: project.namespace,
                      project_id: project,
                      id: job.id }.merge(additional_params)
    end
  end

  describe 'POST unschedule' do
    before do
      project.add_developer(user)

      create(:protected_branch, :developers_can_merge,
             name: 'master', project: project)

      sign_in(user)

      post_unschedule
    end

    context 'when job is scheduled' do
      let(:job) { create(:ci_build, :scheduled, pipeline: pipeline) }

      it 'redirects to the unscheduled job page' 


      it 'transits to manual' 

    end

    context 'when job is not scheduled' do
      let(:job) { create(:ci_build, pipeline: pipeline) }

      it 'renders unprocessable_entity' 

    end

    def post_unschedule
      post :unschedule, namespace_id: project.namespace,
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
    let(:role) { :maintainer }

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

    context "when job has a trace artifact" do
      let(:job) { create(:ci_build, :trace_artifact, pipeline: pipeline) }

      it 'returns a trace' 

    end

    context "when job has a trace file" do
      let(:job) { create(:ci_build, :trace_live, pipeline: pipeline) }

      it "send a trace file" 

    end

    context "when job has a trace in database" do
      let(:job) { create(:ci_build, pipeline: pipeline) }

      before do
        job.update_column(:trace, "Sample trace")
      end

      it "send a trace file" 

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

  describe 'GET #terminal' do
    before do
      project.add_developer(user)
      sign_in(user)
    end

    context 'when job exists' do
      context 'and it has a terminal' do
        let!(:job) { create(:ci_build, :running, :with_runner_session, pipeline: pipeline) }

        it 'has a job' 

      end

      context 'and does not have a terminal' do
        let!(:job) { create(:ci_build, :running, pipeline: pipeline) }

        it 'returns not_found' 

      end
    end

    context 'when job does not exist' do
      it 'renders not_found' 

    end

    def get_terminal(**extra_params)
      params = {
        namespace_id: project.namespace.to_param,
        project_id: project
      }

      get :terminal, params.merge(extra_params)
    end
  end

  describe 'GET #terminal_websocket_authorize' do
    let!(:job) { create(:ci_build, :running, :with_runner_session, pipeline: pipeline) }

    before do
      project.add_developer(user)
      sign_in(user)
    end

    context 'with valid workhorse signature' do
      before do
        allow(Gitlab::Workhorse).to receive(:verify_api_request!).and_return(nil)
      end

      context 'and valid id' do
        it 'returns the terminal for the job' 

      end

      context 'and invalid id' do
        it 'returns 404' 

      end
    end

    context 'with invalid workhorse signature' do
      it 'aborts with an exception' 

    end

    def get_terminal_websocket(**extra_params)
      params = {
        namespace_id: project.namespace.to_param,
        project_id: project
      }

      get :terminal_websocket_authorize, params.merge(extra_params)
    end
  end
end

