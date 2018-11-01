require 'spec_helper'

describe API::Runner, :clean_gitlab_redis_shared_state do
  include StubGitlabCalls
  include RedisHelpers

  let(:registration_token) { 'abcdefg123456' }

  before do
    stub_feature_flags(ci_enable_live_trace: true)
    stub_gitlab_calls
    stub_application_setting(runners_registration_token: registration_token)
    allow_any_instance_of(Ci::Runner).to receive(:cache_attributes)
  end

  describe '/api/v4/runners' do
    describe 'POST /api/v4/runners' do
      context 'when no token is provided' do
        it 'returns 400 error' 

      end

      context 'when invalid token is provided' do
        it 'returns 403 error' 

      end

      context 'when valid token is provided' do
        it 'creates runner with default values' 


        context 'when project token is used' do
          let(:project) { create(:project) }

          it 'creates project runner' 

        end

        context 'when group token is used' do
          let(:group) { create(:group) }

          it 'creates a group runner' 

        end
      end

      context 'when runner description is provided' do
        it 'creates runner' 

      end

      context 'when runner tags are provided' do
        it 'creates runner' 

      end

      context 'when option for running untagged jobs is provided' do
        context 'when tags are provided' do
          it 'creates runner' 

        end

        context 'when tags are not provided' do
          it 'returns 400 error' 

        end
      end

      context 'when option for locking Runner is provided' do
        it 'creates runner' 

      end

      context 'when option for activating a Runner is provided' do
        context 'when active is set to true' do
          it 'creates runner' 

        end

        context 'when active is set to false' do
          it 'creates runner' 

        end
      end

      context 'when maximum job timeout is specified' do
        it 'creates runner' 


        context 'when maximum job timeout is empty' do
          it 'creates runner' 

        end
      end

      %w(name version revision platform architecture).each do |param|
        context "when info parameter '#{param}' info is present" do
          let(:value) { "#{param}_value" }

          it "updates provided Runner's parameter" 

        end
      end

      it "sets the runner's ip_address" 

    end

    describe 'DELETE /api/v4/runners' do
      context 'when no token is provided' do
        it 'returns 400 error' 

      end

      context 'when invalid token is provided' do
        it 'returns 403 error' 

      end

      context 'when valid token is provided' do
        let(:runner) { create(:ci_runner) }

        it 'deletes Runner' 


        it_behaves_like '412 response' do
          let(:request) { api('/runners') }
          let(:params) { { token: runner.token } }
        end
      end
    end

    describe 'POST /api/v4/runners/verify' do
      let(:runner) { create(:ci_runner) }

      context 'when no token is provided' do
        it 'returns 400 error' 

      end

      context 'when invalid token is provided' do
        it 'returns 403 error' 

      end

      context 'when valid token is provided' do
        it 'verifies Runner credentials' 

      end
    end
  end

  describe '/api/v4/jobs' do
    let(:project) { create(:project, shared_runners_enabled: false) }
    let(:pipeline) { create(:ci_pipeline_without_jobs, project: project, ref: 'master') }
    let(:runner) { create(:ci_runner, :project, projects: [project]) }
    let(:job) do
      create(:ci_build, :artifacts, :extended_options,
             pipeline: pipeline, name: 'spinach', stage: 'test', stage_idx: 0, commands: "ls\ndate")
    end

    describe 'POST /api/v4/jobs/request' do
      let!(:last_update) {}
      let!(:new_update) { }
      let(:user_agent) { 'gitlab-runner 9.0.0 (9-0-stable; go1.7.4; linux/amd64)' }

      before do
        job
        stub_container_registry_config(enabled: false)
      end

      shared_examples 'no jobs available' do
        before do
          request_job
        end

        context 'when runner sends version in User-Agent' do
          context 'for stable version' do
            it 'gives 204 and set X-GitLab-Last-Update' 

          end

          context 'when last_update is up-to-date' do
            let(:last_update) { runner.ensure_runner_queue_value }

            it 'gives 204 and set the same X-GitLab-Last-Update' 

          end

          context 'when last_update is outdated' do
            let(:last_update) { runner.ensure_runner_queue_value }
            let(:new_update) { runner.tick_runner_queue }

            it 'gives 204 and set a new X-GitLab-Last-Update' 

          end

          context 'when beta version is sent' do
            let(:user_agent) { 'gitlab-runner 9.0.0~beta.167.g2b2bacc (master; go1.7.4; linux/amd64)' }

            it { expect(response).to have_gitlab_http_status(204) }
          end

          context 'when pre-9-0 version is sent' do
            let(:user_agent) { 'gitlab-ci-multi-runner 1.6.0 (1-6-stable; go1.6.3; linux/amd64)' }

            it { expect(response).to have_gitlab_http_status(204) }
          end

          context 'when pre-9-0 beta version is sent' do
            let(:user_agent) { 'gitlab-ci-multi-runner 1.6.0~beta.167.g2b2bacc (master; go1.6.3; linux/amd64)' }

            it { expect(response).to have_gitlab_http_status(204) }
          end
        end
      end

      context 'when no token is provided' do
        it 'returns 400 error' 

      end

      context 'when invalid token is provided' do
        it 'returns 403 error' 

      end

      context 'when valid token is provided' do
        context 'when Runner is not active' do
          let(:runner) { create(:ci_runner, :inactive) }
          let(:update_value) { runner.ensure_runner_queue_value }

          it 'returns 204 error' 

        end

        context 'when jobs are finished' do
          before do
            job.success
          end

          it_behaves_like 'no jobs available'
        end

        context 'when other projects have pending jobs' do
          before do
            job.success
            create(:ci_build, :pending)
          end

          it_behaves_like 'no jobs available'
        end

        context 'when shared runner requests job for project without shared_runners_enabled' do
          let(:runner) { create(:ci_runner, :instance) }

          it_behaves_like 'no jobs available'
        end

        context 'when there is a pending job' do
          let(:expected_job_info) do
            { 'name' => job.name,
              'stage' => job.stage,
              'project_id' => job.project.id,
              'project_name' => job.project.name }
          end

          let(:expected_git_info) do
            { 'repo_url' => job.repo_url,
              'ref' => job.ref,
              'sha' => job.sha,
              'before_sha' => job.before_sha,
              'ref_type' => 'branch' }
          end

          let(:expected_steps) do
            [{ 'name' => 'script',
               'script' => %w(ls date),
               'timeout' => job.metadata_timeout,
               'when' => 'on_success',
               'allow_failure' => false },
             { 'name' => 'after_script',
               'script' => %w(ls date),
               'timeout' => job.metadata_timeout,
               'when' => 'always',
               'allow_failure' => true }]
          end

          let(:expected_variables) do
            [{ 'key' => 'CI_JOB_NAME', 'value' => 'spinach', 'public' => true },
             { 'key' => 'CI_JOB_STAGE', 'value' => 'test', 'public' => true },
             { 'key' => 'DB_NAME', 'value' => 'postgres', 'public' => true }]
          end

          let(:expected_artifacts) do
            [{ 'name' => 'artifacts_file',
               'untracked' => false,
               'paths' => %w(out/),
               'when' => 'always',
               'expire_in' => '7d',
               "artifact_type" => "archive",
               "artifact_format" => "zip" }]
          end

          let(:expected_cache) do
            [{ 'key' => 'cache_key',
               'untracked' => false,
               'paths' => ['vendor/*'],
               'policy' => 'pull-push' }]
          end

          let(:expected_features) { { 'trace_sections' => true } }

          it 'picks a job' 


          context 'when job is made for tag' do
            let!(:job) { create(:ci_build, :tag, pipeline: pipeline, name: 'spinach', stage: 'test', stage_idx: 0) }

            it 'sets branch as ref_type' 

          end

          context 'when job is made for branch' do
            it 'sets tag as ref_type' 

          end

          it 'updates runner info' 


          %w(version revision platform architecture).each do |param|
            context "when info parameter '#{param}' is present" do
              let(:value) { "#{param}_value" }

              it "updates provided Runner's parameter" 

            end
          end

          it "sets the runner's ip_address" 


          context 'when concurrently updating a job' do
            before do
              expect_any_instance_of(Ci::Build).to receive(:run!)
                  .and_raise(ActiveRecord::StaleObjectError.new(nil, nil))
            end

            it 'returns a conflict' 

          end

          context 'when project and pipeline have multiple jobs' do
            let!(:job) { create(:ci_build, :tag, pipeline: pipeline, name: 'spinach', stage: 'test', stage_idx: 0) }
            let!(:job2) { create(:ci_build, :tag, pipeline: pipeline, name: 'rubocop', stage: 'test', stage_idx: 0) }
            let!(:test_job) { create(:ci_build, pipeline: pipeline, name: 'deploy', stage: 'deploy', stage_idx: 1) }

            before do
              job.success
              job2.success
            end

            it 'returns dependent jobs' 

          end

          context 'when pipeline have jobs with artifacts' do
            let!(:job) { create(:ci_build, :tag, :artifacts, pipeline: pipeline, name: 'spinach', stage: 'test', stage_idx: 0) }
            let!(:test_job) { create(:ci_build, pipeline: pipeline, name: 'deploy', stage: 'deploy', stage_idx: 1) }

            before do
              job.success
            end

            it 'returns dependent jobs' 

          end

          context 'when explicit dependencies are defined' do
            let!(:job) { create(:ci_build, :tag, pipeline: pipeline, name: 'spinach', stage: 'test', stage_idx: 0) }
            let!(:job2) { create(:ci_build, :tag, pipeline: pipeline, name: 'rubocop', stage: 'test', stage_idx: 0) }
            let!(:test_job) do
              create(:ci_build, pipeline: pipeline, token: 'test-job-token', name: 'deploy',
                                stage: 'deploy', stage_idx: 1,
                                options: { dependencies: [job2.name] })
            end

            before do
              job.success
              job2.success
            end

            it 'returns dependent jobs' 

          end

          context 'when dependencies is an empty array' do
            let!(:job) { create(:ci_build, :tag, pipeline: pipeline, name: 'spinach', stage: 'test', stage_idx: 0) }
            let!(:job2) { create(:ci_build, :tag, pipeline: pipeline, name: 'rubocop', stage: 'test', stage_idx: 0) }
            let!(:empty_dependencies_job) do
              create(:ci_build, pipeline: pipeline, token: 'test-job-token', name: 'empty_dependencies_job',
                                stage: 'deploy', stage_idx: 1,
                                options: { dependencies: [] })
            end

            before do
              job.success
              job2.success
            end

            it 'returns an empty array' 

          end

          context 'when job has no tags' do
            before do
              job.update(tags: [])
            end

            context 'when runner is allowed to pick untagged jobs' do
              before do
                runner.update_column(:run_untagged, true)
              end

              it 'picks job' 

            end

            context 'when runner is not allowed to pick untagged jobs' do
              before do
                runner.update_column(:run_untagged, false)
              end

              it_behaves_like 'no jobs available'
            end
          end

          context 'when triggered job is available' do
            let(:expected_variables) do
              [{ 'key' => 'CI_JOB_NAME', 'value' => 'spinach', 'public' => true },
               { 'key' => 'CI_JOB_STAGE', 'value' => 'test', 'public' => true },
               { 'key' => 'CI_PIPELINE_TRIGGERED', 'value' => 'true', 'public' => true },
               { 'key' => 'DB_NAME', 'value' => 'postgres', 'public' => true },
               { 'key' => 'SECRET_KEY', 'value' => 'secret_value', 'public' => false },
               { 'key' => 'TRIGGER_KEY_1', 'value' => 'TRIGGER_VALUE_1', 'public' => false }]
            end

            let(:trigger) { create(:ci_trigger, project: project) }
            let!(:trigger_request) { create(:ci_trigger_request, pipeline: pipeline, builds: [job], trigger: trigger) }

            before do
              project.variables << Ci::Variable.new(key: 'SECRET_KEY', value: 'secret_value')
            end

            shared_examples 'expected variables behavior' do
              it 'returns variables for triggers' 

            end

            context 'when variables are stored in trigger_request' do
              before do
                trigger_request.update_attribute(:variables, { TRIGGER_KEY_1: 'TRIGGER_VALUE_1' } )
              end

              it_behaves_like 'expected variables behavior'
            end

            context 'when variables are stored in pipeline_variables' do
              before do
                create(:ci_pipeline_variable, pipeline: pipeline, key: :TRIGGER_KEY_1, value: 'TRIGGER_VALUE_1')
              end

              it_behaves_like 'expected variables behavior'
            end
          end

          describe 'registry credentials support' do
            let(:registry_url) { 'registry.example.com:5005' }
            let(:registry_credentials) do
              { 'type' => 'registry',
                'url' => registry_url,
                'username' => 'gitlab-ci-token',
                'password' => job.token }
            end

            context 'when registry is enabled' do
              before do
                stub_container_registry_config(enabled: true, host_port: registry_url)
              end

              it 'sends registry credentials key' 

            end

            context 'when registry is disabled' do
              before do
                stub_container_registry_config(enabled: false, host_port: registry_url)
              end

              it 'does not send registry credentials' 

            end
          end

          describe 'timeout support' do
            context 'when project specifies job timeout' do
              let(:project) { create(:project, shared_runners_enabled: false, build_timeout: 1234) }

              it 'contains info about timeout taken from project' 


              context 'when runner specifies lower timeout' do
                let(:runner) { create(:ci_runner, :project, maximum_timeout: 1000, projects: [project]) }

                it 'contains info about timeout overridden by runner' 

              end

              context 'when runner specifies bigger timeout' do
                let(:runner) { create(:ci_runner, :project, maximum_timeout: 2000, projects: [project]) }

                it 'contains info about timeout not overridden by runner' 

              end
            end
          end
        end

        def request_job(token = runner.token, **params)
          new_params = params.merge(token: token, last_update: last_update)
          post api('/jobs/request'), new_params, { 'User-Agent' => user_agent }
        end
      end
    end

    describe 'PUT /api/v4/jobs/:id' do
      let(:job) { create(:ci_build, :pending, :trace_live, pipeline: pipeline, runner_id: runner.id) }

      before do
        job.run!
      end

      context 'when status is given' do
        it 'mark job as succeeded' 


        it 'mark job as failed' 


        context 'when failure_reason is script_failure' do
          before do
            update_job(state: 'failed', failure_reason: 'script_failure')
            job.reload
          end

          it { expect(job).to be_script_failure }
        end

        context 'when failure_reason is runner_system_failure' do
          before do
            update_job(state: 'failed', failure_reason: 'runner_system_failure')
            job.reload
          end

          it { expect(job).to be_runner_system_failure }
        end

        context 'when failure_reason is unrecognized value' do
          before do
            update_job(state: 'failed', failure_reason: 'what_is_this')
            job.reload
          end

          it { expect(job).to be_unknown_failure }
        end

        context 'when failure_reason is job_execution_timeout' do
          before do
            update_job(state: 'failed', failure_reason: 'job_execution_timeout')
            job.reload
          end

          it { expect(job).to be_job_execution_timeout }
        end
      end

      context 'when trace is given' do
        it 'creates a trace artifact' 

      end

      context 'when no trace is given' do
        it 'does not override trace information' 


        context 'when running state is sent' do
          it 'updates update_at value' 

        end

        context 'when other state is sent' do
          it "doesn't update update_at value" 

        end
      end

      context 'when job has been erased' do
        let(:job) { create(:ci_build, runner_id: runner.id, erased_at: Time.now) }

        it 'responds with forbidden' 

      end

      context 'when job has already been finished' do
        before do
          job.trace.set('Job failed')
          job.drop!(:script_failure)
        end

        it 'does not update job status and job trace' 

      end

      def update_job(token = job.token, **params)
        new_params = params.merge(token: token)
        put api("/jobs/#{job.id}"), new_params
      end

      def update_job_after_time(update_interval = 20.minutes, state = 'running')
        Timecop.travel(job.updated_at + update_interval) do
          update_job(job.token, state: state)
        end
      end
    end

    describe 'PATCH /api/v4/jobs/:id/trace' do
      let(:job) { create(:ci_build, :running, :trace_live, runner_id: runner.id, pipeline: pipeline) }
      let(:headers) { { API::Helpers::Runner::JOB_TOKEN_HEADER => job.token, 'Content-Type' => 'text/plain' } }
      let(:headers_with_range) { headers.merge({ 'Content-Range' => '11-20' }) }
      let(:update_interval) { 10.seconds.to_i }

      before do
        initial_patch_the_trace
      end

      context 'when request is valid' do
        it 'gets correct response' 


        context 'when job has been updated recently' do
          it { expect { patch_the_trace }.not_to change { job.updated_at }}

          it "changes the job's trace" 


          context 'when Runner makes a force-patch' do
            it { expect { force_patch_the_trace }.not_to change { job.updated_at }}

            it "doesn't change the build.trace" 

          end
        end

        context 'when job was not updated recently' do
          let(:update_interval) { 15.minutes.to_i }

          it { expect { patch_the_trace }.to change { job.updated_at } }

          it 'changes the job.trace' 


          context 'when Runner makes a force-patch' do
            it { expect { force_patch_the_trace }.to change { job.updated_at } }

            it "doesn't change the job.trace" 

          end
        end

        context 'when project for the build has been deleted' do
          let(:job) do
            create(:ci_build, :running, :trace_live, runner_id: runner.id, pipeline: pipeline) do |job|
              job.project.update(pending_delete: true)
            end
          end

          it 'responds with forbidden' 

        end

        context 'when trace is patched' do
          before do
            patch_the_trace
          end

          it 'has valid trace' 


          context 'when job is cancelled' do
            before do
              job.cancel
            end

            context 'when trace is patched' do
              before do
                patch_the_trace
              end

              it 'returns Forbidden ' 

            end
          end

          context 'when redis data are flushed' do
            before do
              redis_shared_state_cleanup!
            end

            it 'has empty trace' 


            context 'when we perform partial patch' do
              before do
                patch_the_trace('hello', headers.merge({ 'Content-Range' => "28-32/5" }))
              end

              it 'returns an error' 

            end

            context 'when we resend full trace' do
              before do
                patch_the_trace('BUILD TRACE appended appended hello', headers.merge({ 'Content-Range' => "0-34/35" }))
              end

              it 'succeeds with updating trace' 

            end
          end
        end

        context 'when the job is canceled' do
          before do
            job.cancel
            patch_the_trace
          end

          it 'receives status in header' 

        end
      end

      context 'when Runner makes a force-patch' do
        before do
          force_patch_the_trace
        end

        it 'gets correct response' 

      end

      context 'when content-range start is too big' do
        let(:headers_with_range) { headers.merge({ 'Content-Range' => '15-20/6' }) }

        it 'gets 416 error response with range headers' 

      end

      context 'when content-range start is too small' do
        let(:headers_with_range) { headers.merge({ 'Content-Range' => '8-20/13' }) }

        it 'gets 416 error response with range headers' 

      end

      context 'when Content-Range header is missing' do
        let(:headers_with_range) { headers }

        it { expect(response.status).to eq 400 }
      end

      context 'when job has been errased' do
        let(:job) { create(:ci_build, runner_id: runner.id, erased_at: Time.now) }

        it { expect(response.status).to eq 403 }
      end

      def patch_the_trace(content = ' appended', request_headers = nil)
        unless request_headers
          job.trace.read do |stream|
            offset = stream.size
            limit = offset + content.length - 1
            request_headers = headers.merge({ 'Content-Range' => "#{offset}-#{limit}" })
          end
        end

        Timecop.travel(job.updated_at + update_interval) do
          patch api("/jobs/#{job.id}/trace"), content, request_headers
          job.reload
        end
      end

      def initial_patch_the_trace
        patch_the_trace(' appended', headers_with_range)
      end

      def force_patch_the_trace
        2.times { patch_the_trace('') }
      end
    end

    describe 'artifacts' do
      let(:job) { create(:ci_build, :pending, pipeline: pipeline, runner_id: runner.id) }
      let(:jwt_token) { JWT.encode({ 'iss' => 'gitlab-workhorse' }, Gitlab::Workhorse.secret, 'HS256') }
      let(:headers) { { 'GitLab-Workhorse' => '1.0', Gitlab::Workhorse::INTERNAL_API_REQUEST_HEADER => jwt_token } }
      let(:headers_with_token) { headers.merge(API::Helpers::Runner::JOB_TOKEN_HEADER => job.token) }
      let(:file_upload) { fixture_file_upload('spec/fixtures/banana_sample.gif', 'image/gif') }
      let(:file_upload2) { fixture_file_upload('spec/fixtures/dk.png', 'image/gif') }

      before do
        stub_artifacts_object_storage
        job.run!
      end

      describe 'POST /api/v4/jobs/:id/artifacts/authorize' do
        context 'when using token as parameter' do
          context 'posting artifacts to running job' do
            subject do
              authorize_artifacts_with_token_in_params
            end

            shared_examples 'authorizes local file' do
              it 'succeeds' 

            end

            context 'when using local storage' do
              it_behaves_like 'authorizes local file'
            end

            context 'when using remote storage' do
              context 'when direct upload is enabled' do
                before do
                  stub_artifacts_object_storage(enabled: true, direct_upload: true)
                end

                it 'succeeds' 

              end

              context 'when direct upload is disabled' do
                before do
                  stub_artifacts_object_storage(enabled: true, direct_upload: false)
                end

                it_behaves_like 'authorizes local file'
              end
            end
          end

          it 'fails to post too large artifact' 

        end

        context 'when using token as header' do
          it 'authorizes posting artifacts to running job' 


          it 'fails to post too large artifact' 

        end

        context 'when using runners token' do
          it 'fails to authorize artifacts posting' 

        end

        it 'reject requests that did not go through gitlab-workhorse' 


        context 'authorization token is invalid' do
          it 'responds with forbidden' 

        end

        def authorize_artifacts(params = {}, request_headers = headers)
          post api("/jobs/#{job.id}/artifacts/authorize"), params, request_headers
        end

        def authorize_artifacts_with_token_in_params(params = {}, request_headers = headers)
          params = params.merge(token: job.token)
          authorize_artifacts(params, request_headers)
        end

        def authorize_artifacts_with_token_in_headers(params = {}, request_headers = headers_with_token)
          authorize_artifacts(params, request_headers)
        end
      end

      describe 'POST /api/v4/jobs/:id/artifacts' do
        context 'when artifacts are being stored inside of tmp path' do
          before do
            # by configuring this path we allow to pass temp file from any path
            allow(JobArtifactUploader).to receive(:workhorse_upload_path).and_return('/')
          end

          context 'when job has been erased' do
            let(:job) { create(:ci_build, erased_at: Time.now) }

            before do
              upload_artifacts(file_upload, headers_with_token)
            end

            it 'responds with forbidden' 

          end

          context 'when job is running' do
            shared_examples 'successful artifacts upload' do
              it 'updates successfully' 

            end

            context 'when uses accelerated file post' do
              context 'for file stored locally' do
                before do
                  upload_artifacts(file_upload, headers_with_token)
                end

                it_behaves_like 'successful artifacts upload'
              end

              context 'for file stored remotelly' do
                let!(:fog_connection) do
                  stub_artifacts_object_storage(direct_upload: true)
                end

                before do
                  fog_connection.directories.get('artifacts').files.create(
                    key: 'tmp/uploads/12312300',
                    body: 'content'
                  )

                  upload_artifacts(file_upload, headers_with_token,
                    { 'file.remote_id' => remote_id })
                end

                context 'when valid remote_id is used' do
                  let(:remote_id) { '12312300' }

                  it_behaves_like 'successful artifacts upload'
                end

                context 'when invalid remote_id is used' do
                  let(:remote_id) { 'invalid id' }

                  it 'responds with bad request' 

                end
              end
            end

            context 'when using runners token' do
              it 'responds with forbidden' 

            end
          end

          context 'when artifacts file is too large' do
            it 'fails to post too large artifact' 

          end

          context 'when artifacts post request does not contain file' do
            it 'fails to post artifacts without file' 

          end

          context 'GitLab Workhorse is not configured' do
            it 'fails to post artifacts without GitLab-Workhorse' 

          end

          context 'when setting an expire date' do
            let(:default_artifacts_expire_in) {}
            let(:post_data) do
              { 'file.path' => file_upload.path,
                'file.name' => file_upload.original_filename,
                'expire_in' => expire_in }
            end

            before do
              stub_application_setting(default_artifacts_expire_in: default_artifacts_expire_in)

              post(api("/jobs/#{job.id}/artifacts"), post_data, headers_with_token)
            end

            context 'when an expire_in is given' do
              let(:expire_in) { '7 days' }

              it 'updates when specified' 

            end

            context 'when no expire_in is given' do
              let(:expire_in) { nil }

              it 'ignores if not specified' 


              context 'with application default' do
                context 'when default is 5 days' do
                  let(:default_artifacts_expire_in) { '5 days' }

                  it 'sets to application default' 

                end

                context 'when default is 0' do
                  let(:default_artifacts_expire_in) { '0' }

                  it 'does not set expire_in' 

                end
              end
            end
          end

          context 'posts artifacts file and metadata file' do
            let!(:artifacts) { file_upload }
            let!(:artifacts_sha256) { Digest::SHA256.file(artifacts.path).hexdigest }
            let!(:metadata) { file_upload2 }
            let!(:metadata_sha256) { Digest::SHA256.file(metadata.path).hexdigest }

            let(:stored_artifacts_file) { job.reload.artifacts_file.file }
            let(:stored_metadata_file) { job.reload.artifacts_metadata.file }
            let(:stored_artifacts_size) { job.reload.artifacts_size }
            let(:stored_artifacts_sha256) { job.reload.job_artifacts_archive.file_sha256 }
            let(:stored_metadata_sha256) { job.reload.job_artifacts_metadata.file_sha256 }

            before do
              post(api("/jobs/#{job.id}/artifacts"), post_data, headers_with_token)
            end

            context 'when posts data accelerated by workhorse is correct' do
              let(:post_data) do
                { 'file.path' => artifacts.path,
                  'file.name' => artifacts.original_filename,
                  'file.sha256' => artifacts_sha256,
                  'metadata.path' => metadata.path,
                  'metadata.name' => metadata.original_filename,
                  'metadata.sha256' => metadata_sha256 }
              end

              it 'stores artifacts and artifacts metadata' 

            end

            context 'when there is no artifacts file in post data' do
              let(:post_data) do
                { 'metadata' => metadata }
              end

              it 'is expected to respond with bad request' 


              it 'does not store metadata' 

            end
          end

          context 'when artifact_type is archive' do
            context 'when artifact_format is zip' do
              let(:params) { { artifact_type: :archive, artifact_format: :zip } }

              it 'stores junit test report' 

            end

            context 'when artifact_format is gzip' do
              let(:params) { { artifact_type: :archive, artifact_format: :gzip } }

              it 'returns an error' 

            end
          end

          context 'when artifact_type is junit' do
            context 'when artifact_format is gzip' do
              let(:file_upload) { fixture_file_upload('spec/fixtures/junit/junit.xml.gz') }
              let(:params) { { artifact_type: :junit, artifact_format: :gzip } }

              it 'stores junit test report' 

            end

            context 'when artifact_format is raw' do
              let(:file_upload) { fixture_file_upload('spec/fixtures/junit/junit.xml.gz') }
              let(:params) { { artifact_type: :junit, artifact_format: :raw } }

              it 'returns an error' 

            end
          end
        end

        context 'when artifacts are being stored outside of tmp path' do
          let(:new_tmpdir) { Dir.mktmpdir }

          before do
            # init before overwriting tmp dir
            file_upload

            # by configuring this path we allow to pass file from @tmpdir only
            # but all temporary files are stored in system tmp directory
            allow(Dir).to receive(:tmpdir).and_return(new_tmpdir)
          end

          after do
            FileUtils.remove_entry(new_tmpdir)
          end

          it' "fails to post artifacts for outside of tmp path"' do
            upload_artifacts(file_upload, headers_with_token)

            expect(response).to have_gitlab_http_status(400)
          end
        end

        def upload_artifacts(file, headers = {}, params = {})
          params = params.merge({
            'file.path' => file.path,
            'file.name' => file.original_filename
          })

          post api("/jobs/#{job.id}/artifacts"), params, headers
        end
      end

      describe 'GET /api/v4/jobs/:id/artifacts' do
        let(:token) { job.token }

        context 'when job has artifacts' do
          let(:job) { create(:ci_build) }
          let(:store) { JobArtifactUploader::Store::LOCAL }

          before do
            create(:ci_job_artifact, :archive, file_store: store, job: job)
          end

          context 'when using job token' do
            context 'when artifacts are stored locally' do
              let(:download_headers) do
                { 'Content-Transfer-Encoding' => 'binary',
                  'Content-Disposition' => 'attachment; filename=ci_build_artifacts.zip' }
              end

              before do
                download_artifact
              end

              it 'download artifacts' 

            end

            context 'when artifacts are stored remotely' do
              let(:store) { JobArtifactUploader::Store::REMOTE }
              let!(:job) { create(:ci_build) }

              context 'when proxy download is being used' do
                before do
                  download_artifact(direct_download: false)
                end

                it 'uses workhorse send-url' 

              end

              context 'when direct download is being used' do
                before do
                  download_artifact(direct_download: true)
                end

                it 'receive redirect for downloading artifacts' 

              end
            end
          end

          context 'when using runnners token' do
            let(:token) { job.project.runners_token }

            before do
              download_artifact
            end

            it 'responds with forbidden' 

          end
        end

        context 'when job does not has artifacts' do
          it 'responds with not found' 

        end

        def download_artifact(params = {}, request_headers = headers)
          params = params.merge(token: token)
          job.reload

          get api("/jobs/#{job.id}/artifacts"), params, request_headers
        end
      end
    end
  end
end

