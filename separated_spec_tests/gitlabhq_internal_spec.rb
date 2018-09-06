require 'spec_helper'

describe API::Internal do
  let(:user) { create(:user) }
  let(:key) { create(:key, user: user) }
  let(:project) { create(:project, :repository, :wiki_repo) }
  let(:secret_token) { Gitlab::Shell.secret_token }
  let(:gl_repository) { "project-#{project.id}" }
  let(:reference_counter) { double('ReferenceCounter') }

  describe "GET /internal/check" do
    it do
      expect_any_instance_of(Redis).to receive(:ping).and_return('PONG')

      get api("/internal/check"), secret_token: secret_token

      expect(response).to have_gitlab_http_status(200)
      expect(json_response['api_version']).to eq(API::API.version)
      expect(json_response['redis']).to be(true)
    end

    it 'returns false for field `redis` when redis is unavailable' 

  end

  describe 'GET /internal/broadcast_message' do
    context 'broadcast message exists' do
      let!(:broadcast_message) { create(:broadcast_message, starts_at: 1.day.ago, ends_at: 1.day.from_now ) }

      it 'returns one broadcast message'  do
        get api('/internal/broadcast_message'), secret_token: secret_token

        expect(response).to have_gitlab_http_status(200)
        expect(json_response['message']).to eq(broadcast_message.message)
      end
    end

    context 'broadcast message does not exist' do
      it 'returns nothing'  do
        get api('/internal/broadcast_message'), secret_token: secret_token

        expect(response).to have_gitlab_http_status(200)
        expect(json_response).to be_empty
      end
    end

    context 'nil broadcast message' do
      it 'returns nothing' 

    end
  end

  describe 'GET /internal/broadcast_messages' do
    context 'broadcast message(s) exist' do
      let!(:broadcast_message) { create(:broadcast_message, starts_at: 1.day.ago, ends_at: 1.day.from_now ) }

      it 'returns active broadcast message(s)' 

    end

    context 'broadcast message does not exist' do
      it 'returns nothing' 

    end
  end

  describe 'GET /internal/two_factor_recovery_codes' do
    it 'returns an error message when the key does not exist' 


    it 'returns an error message when the key is a deploy key' 


    it 'returns an error message when the user does not exist' 


    context 'when two-factor is enabled' do
      it 'returns new recovery codes when the user exists' 

    end

    context 'when two-factor is not enabled' do
      it 'returns an error message' 

    end
  end

  describe "POST /internal/lfs_authenticate" do
    before do
      project.add_developer(user)
    end

    context 'user key' do
      it 'returns the correct information about the key' 


      it 'returns a 404 when the wrong key is provided' 

    end

    context 'deploy key' do
      let(:key) { create(:deploy_key) }

      it 'returns the correct information about the key' 

    end
  end

  describe "GET /internal/discover" do
    it do
      get(api("/internal/discover"), key_id: key.id, secret_token: secret_token)

      expect(response).to have_gitlab_http_status(200)

      expect(json_response['name']).to eq(user.name)
    end
  end

  describe "GET /internal/authorized_keys" do
    context "using an existing key's fingerprint" do
      it "finds the key" 

    end

    context "non existing key's fingerprint" do
      it "returns 404" 

    end

    context "using a partial fingerprint" do
      it "returns 404" 

    end

    context "sending the key" do
      it "finds the key" 


      it "returns 404 with a partial key" 


      it "returns 404 with an not valid base64 string" 

    end
  end

  describe "POST /internal/allowed", :clean_gitlab_redis_shared_state do
    context "access granted" do
      around do |example|
        Timecop.freeze { example.run }
      end

      before do
        project.add_developer(user)
      end

      context 'with env passed as a JSON' do
        let(:gl_repository) { project.gl_repository(is_wiki: true) }

        it 'sets env in RequestStore' 

      end

      context "git push with project.wiki" do
        it 'responds with success' 

      end

      context "git pull with project.wiki" do
        it 'responds with success' 

      end

      context "git pull" do
        it "has the correct payload" 

      end

      context "git push" do
        context 'project as namespace/project' do
          it do
            push(key, project)

            expect(response).to have_gitlab_http_status(200)
            expect(json_response["status"]).to be_truthy
            expect(json_response["repository_path"]).to eq(project.repository.path_to_repo)
            expect(json_response["gl_repository"]).to eq("project-#{project.id}")
            expect(json_response["gitaly"]).not_to be_nil
            expect(json_response["gitaly"]["repository"]).not_to be_nil
            expect(json_response["gitaly"]["repository"]["storage_name"]).to eq(project.repository.gitaly_repository.storage_name)
            expect(json_response["gitaly"]["repository"]["relative_path"]).to eq(project.repository.gitaly_repository.relative_path)
            expect(json_response["gitaly"]["address"]).to eq(Gitlab::GitalyClient.address(project.repository_storage))
            expect(json_response["gitaly"]["token"]).to eq(Gitlab::GitalyClient.token(project.repository_storage))
            expect(user).not_to have_an_activity_record
          end
        end
      end
    end

    context "access denied" do
      before do
        project.add_guest(user)
      end

      context "git pull" do
        it do
          pull(key, project)

          expect(response).to have_gitlab_http_status(200)
          expect(json_response["status"]).to be_falsey
          expect(user).not_to have_an_activity_record
        end
      end

      context "git push" do
        it do
          push(key, project)

          expect(response).to have_gitlab_http_status(200)
          expect(json_response["status"]).to be_falsey
          expect(user).not_to have_an_activity_record
        end
      end
    end

    context "blocked user" do
      let(:personal_project) { create(:project, namespace: user.namespace) }

      before do
        user.block
      end

      context "git pull" do
        it do
          pull(key, personal_project)

          expect(response).to have_gitlab_http_status(200)
          expect(json_response["status"]).to be_falsey
          expect(user).not_to have_an_activity_record
        end
      end

      context "git push" do
        it do
          push(key, personal_project)

          expect(response).to have_gitlab_http_status(200)
          expect(json_response["status"]).to be_falsey
          expect(user).not_to have_an_activity_record
        end
      end
    end

    context "archived project" do
      before do
        project.add_developer(user)
        project.archive!
      end

      context "git pull" do
        it do
          pull(key, project)

          expect(response).to have_gitlab_http_status(200)
          expect(json_response["status"]).to be_truthy
        end
      end

      context "git push" do
        it do
          push(key, project)

          expect(response).to have_gitlab_http_status(200)
          expect(json_response["status"]).to be_falsey
        end
      end
    end

    context "deploy key" do
      let(:key) { create(:deploy_key) }

      context "added to project" do
        before do
          key.projects << project
        end

        it do
          archive(key, project)

          expect(response).to have_gitlab_http_status(200)
          expect(json_response["status"]).to be_truthy
          expect(json_response["gitaly"]).not_to be_nil
          expect(json_response["gitaly"]["repository"]).not_to be_nil
          expect(json_response["gitaly"]["repository"]["storage_name"]).to eq(project.repository.gitaly_repository.storage_name)
          expect(json_response["gitaly"]["repository"]["relative_path"]).to eq(project.repository.gitaly_repository.relative_path)
          expect(json_response["gitaly"]["address"]).to eq(Gitlab::GitalyClient.address(project.repository_storage))
          expect(json_response["gitaly"]["token"]).to eq(Gitlab::GitalyClient.token(project.repository_storage))
        end
      end

      context "not added to project" do
        it do
          archive(key, project)

          expect(response).to have_gitlab_http_status(200)
          expect(json_response["status"]).to be_falsey
        end
      end
    end

    context 'project does not exist' do
      it 'returns a 200 response with status: false' 

    end

    context 'user does not exist' do
      it do
        pull(OpenStruct.new(id: 0), project)

        expect(response).to have_gitlab_http_status(200)
        expect(json_response["status"]).to be_falsey
      end
    end

    context 'ssh access has been disabled' do
      before do
        stub_application_setting(enabled_git_access_protocol: 'http')
      end

      it 'rejects the SSH push' 


      it 'rejects the SSH pull' 

    end

    context 'http access has been disabled' do
      before do
        stub_application_setting(enabled_git_access_protocol: 'ssh')
      end

      it 'rejects the HTTP push' 


      it 'rejects the HTTP pull' 

    end

    context 'web actions are always allowed' do
      it 'allows WEB push' 

    end

    context 'the project path was changed' do
      let(:project) { create(:project, :repository, :legacy_storage) }
      let!(:old_path_to_repo) { project.repository.path_to_repo }
      let!(:repository) { project.repository }

      before do
        project.add_developer(user)
        project.path = 'new_path'
        project.save!
      end

      it 'rejects the push' 


      it 'rejects the SSH pull' 

    end
  end

  describe 'GET /internal/merge_request_urls' do
    let(:repo_name) { "#{project.namespace.name}/#{project.path}" }
    let(:changes) { URI.escape("#{Gitlab::Git::BLANK_SHA} 570e7b2abdd848b95f2f578043fc23bd6f6fd24d refs/heads/new_branch") }

    before do
      project.add_developer(user)
    end

    it 'returns link to create new merge request' 


    it 'returns empty array if printing_merge_request_link_enabled is false' 


    context 'with a gl_repository parameter' do
      let(:gl_repository) { "project-#{project.id}" }

      it 'returns link to create new merge request' 

    end
  end

  # TODO: Uncomment when the end-point is reenabled
  # describe 'POST /notify_post_receive' do
  #   let(:valid_params) do
  #     { project: project.repository.path, secret_token: secret_token }
  #   end
  #
  #   let(:valid_wiki_params) do
  #     { project: project.wiki.repository.path, secret_token: secret_token }
  #   end
  #
  #   before do
  #     allow(Gitlab.config.gitaly).to receive(:enabled).and_return(true)
  #   end
  #
  #   it "calls the Gitaly client with the project's repository" do
  #     expect(Gitlab::GitalyClient::NotificationService).
  #       to receive(:new).with(gitlab_git_repository_with(path: project.repository.path)).
  #       and_call_original
  #     expect_any_instance_of(Gitlab::GitalyClient::NotificationService).
  #       to receive(:post_receive)
  #
  #     post api("/internal/notify_post_receive"), valid_params
  #
  #     expect(response).to have_gitlab_http_status(200)
  #   end
  #
  #   it "calls the Gitaly client with the wiki's repository if it's a wiki" do
  #     expect(Gitlab::GitalyClient::NotificationService).
  #       to receive(:new).with(gitlab_git_repository_with(path: project.wiki.repository.path)).
  #       and_call_original
  #     expect_any_instance_of(Gitlab::GitalyClient::NotificationService).
  #       to receive(:post_receive)
  #
  #     post api("/internal/notify_post_receive"), valid_wiki_params
  #
  #     expect(response).to have_gitlab_http_status(200)
  #   end
  #
  #   it "returns 500 if the gitaly call fails" do
  #     expect_any_instance_of(Gitlab::GitalyClient::NotificationService).
  #       to receive(:post_receive).and_raise(GRPC::Unavailable)
  #
  #     post api("/internal/notify_post_receive"), valid_params
  #
  #     expect(response).to have_gitlab_http_status(500)
  #   end
  #
  #   context 'with a gl_repository parameter' do
  #     let(:valid_params) do
  #       { gl_repository: "project-#{project.id}", secret_token: secret_token }
  #     end
  #
  #     let(:valid_wiki_params) do
  #       { gl_repository: "wiki-#{project.id}", secret_token: secret_token }
  #     end
  #
  #     it "calls the Gitaly client with the project's repository" do
  #       expect(Gitlab::GitalyClient::NotificationService).
  #         to receive(:new).with(gitlab_git_repository_with(path: project.repository.path)).
  #         and_call_original
  #       expect_any_instance_of(Gitlab::GitalyClient::NotificationService).
  #         to receive(:post_receive)
  #
  #       post api("/internal/notify_post_receive"), valid_params
  #
  #       expect(response).to have_gitlab_http_status(200)
  #     end
  #
  #     it "calls the Gitaly client with the wiki's repository if it's a wiki" do
  #       expect(Gitlab::GitalyClient::NotificationService).
  #         to receive(:new).with(gitlab_git_repository_with(path: project.wiki.repository.path)).
  #         and_call_original
  #       expect_any_instance_of(Gitlab::GitalyClient::NotificationService).
  #         to receive(:post_receive)
  #
  #       post api("/internal/notify_post_receive"), valid_wiki_params
  #
  #       expect(response).to have_gitlab_http_status(200)
  #     end
  #   end
  # end

  describe 'POST /internal/post_receive', :clean_gitlab_redis_shared_state do
    let(:identifier) { 'key-123' }

    let(:valid_params) do
      {
        gl_repository: gl_repository,
        secret_token: secret_token,
        identifier: identifier,
        changes: changes
      }
    end

    let(:changes) do
      "#{Gitlab::Git::BLANK_SHA} 570e7b2abdd848b95f2f578043fc23bd6f6fd24d refs/heads/new_branch"
    end

    before do
      project.add_developer(user)
      allow(described_class).to receive(:identify).and_return(user)
      allow_any_instance_of(Gitlab::Identifier).to receive(:identify).and_return(user)
    end

    it 'enqueues a PostReceive worker job' 


    it 'decreases the reference counter and returns the result' 


    it 'returns link to create new merge request' 


    it 'returns empty array if printing_merge_request_link_enabled is false' 


    context 'broadcast message exists' do
      let!(:broadcast_message) { create(:broadcast_message, starts_at: 1.day.ago, ends_at: 1.day.from_now ) }

      it 'returns one broadcast message'  do
        post api("/internal/post_receive"), valid_params

        expect(response).to have_gitlab_http_status(200)
        expect(json_response['broadcast_message']).to eq(broadcast_message.message)
      end
    end

    context 'broadcast message does not exist' do
      it 'returns empty string'  do
        post api("/internal/post_receive"), valid_params

        expect(response).to have_gitlab_http_status(200)
        expect(json_response['broadcast_message']).to eq(nil)
      end
    end

    context 'nil broadcast message' do
      it 'returns empty string' 

    end

    context 'with a redirected data' do
      it 'returns redirected message on the response' 

    end

    context 'with new project data' do
      it 'returns new project message on the response' 

    end

    context 'with an orphaned write deploy key' do
      it 'does not try to notify that project moved' 

    end
  end

  describe 'POST /internal/pre_receive' do
    let(:valid_params) do
      { gl_repository: gl_repository, secret_token: secret_token }
    end

    it 'decreases the reference counter and returns the result' 

  end

  def gl_repository_for(project_or_wiki)
    case project_or_wiki
    when ProjectWiki
      project_or_wiki.project.gl_repository(is_wiki: true)
    when Project
      project_or_wiki.gl_repository(is_wiki: false)
    else
      nil
    end
  end

  def pull(key, project, protocol = 'ssh')
    post(
      api("/internal/allowed"),
      key_id: key.id,
      project: project.full_path,
      gl_repository: gl_repository_for(project),
      action: 'git-upload-pack',
      secret_token: secret_token,
      protocol: protocol
    )
  end

  def push(key, project, protocol = 'ssh', env: nil)
    post(
      api("/internal/allowed"),
      changes: 'd14d6c0abdd253381df51a723d58691b2ee1ab08 570e7b2abdd848b95f2f578043fc23bd6f6fd24d refs/heads/master',
      key_id: key.id,
      project: project.full_path,
      gl_repository: gl_repository_for(project),
      action: 'git-receive-pack',
      secret_token: secret_token,
      protocol: protocol,
      env: env
    )
  end

  def archive(key, project)
    post(
      api("/internal/allowed"),
      ref: 'master',
      key_id: key.id,
      project: project.full_path,
      gl_repository: gl_repository_for(project),
      action: 'git-upload-archive',
      secret_token: secret_token,
      protocol: 'ssh'
    )
  end

  def lfs_auth(key_id, project)
    post(
      api("/internal/lfs_authenticate"),
      key_id: key_id,
      secret_token: secret_token,
      project: project.full_path
    )
  end
end
