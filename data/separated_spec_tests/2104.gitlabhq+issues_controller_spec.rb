require 'spec_helper'

describe Projects::IssuesController do
  let(:project) { create(:project) }
  let(:user)    { create(:user) }
  let(:issue)   { create(:issue, project: project) }

  describe "GET #index" do
    context 'external issue tracker' do
      before do
        sign_in(user)
        project.add_developer(user)
        create(:jira_service, project: project)
      end

      context 'when GitLab issues disabled' do
        it 'returns 404 status' 

      end

      context 'when GitLab issues enabled' do
        it 'renders the "index" template' 

      end
    end

    context 'internal issue tracker' do
      before do
        sign_in(user)
        project.add_developer(user)
      end

      it_behaves_like "issuables list meta-data", :issue

      it "returns index" 


      it "returns 301 if request path doesn't match project path" 


      it "returns 404 when issues are disabled" 

    end

    context 'with page param' do
      let(:last_page) { project.issues.page().total_pages }
      let!(:issue_list) { create_list(:issue, 2, project: project) }

      before do
        sign_in(user)
        project.add_developer(user)
        allow(Kaminari.config).to receive(:default_per_page).and_return(1)
      end

      it 'redirects to last_page if page number is larger than number of pages' 


      it 'redirects to specified page' 


      it 'does not redirect to external sites when provided a host field' 


      it 'does not use pagination if disabled' 

    end
  end

  describe 'GET #new' do
    it 'redirects to signin if not logged in' 


    context 'internal issue tracker' do
      before do
        sign_in(user)
        project.add_developer(user)
      end

      it 'builds a new issue' 


      it 'fills in an issue for a merge request' 


      it 'fills in an issue for a discussion' 

    end

    context 'external issue tracker' do
      let!(:service) do
        create(:custom_issue_tracker_service, project: project, title: 'Custom Issue Tracker', new_issue_url: 'http://test.com')
      end

      before do
        sign_in(user)
        project.add_developer(user)

        external = double
        allow(project).to receive(:external_issue_tracker).and_return(external)
      end

      context 'when GitLab issues disabled' do
        it 'returns 404 status' 

      end

      context 'when GitLab issues enabled' do
        it 'renders the "new" template' 

      end
    end
  end

  describe 'Redirect after sign in' do
    context 'with an AJAX request' do
      it 'does not store the visited URL' 

    end

    context 'without an AJAX request' do
      it 'stores the visited URL' 

    end
  end

  describe 'POST #move' do
    before do
      sign_in(user)
      project.add_developer(user)
    end

    context 'when moving issue to another private project' do
      let(:another_project) { create(:project, :private) }

      context 'when user has access to move issue' do
        before do
          another_project.add_reporter(user)
        end

        it 'moves issue to another project' 

      end

      context 'when user does not have access to move issue' do
        it 'responds with 404' 

      end

      def move_issue
        post :move,
          format: :json,
          namespace_id: project.namespace.to_param,
          project_id: project,
          id: issue.iid,
          move_to_project_id: another_project.id
      end
    end
  end

  describe 'PUT #update' do
    subject do
      put :update,
        namespace_id: project.namespace,
        project_id: project,
        id: issue.to_param,
        issue: { title: 'New title' }, format: :json
    end

    before do
      sign_in(user)
    end

    context 'when user has access to update issue' do
      before do
        project.add_developer(user)
      end

      it 'updates the issue' 


      context 'when Akismet is enabled and the issue is identified as spam' do
        before do
          stub_application_setting(recaptcha_enabled: true)
          allow_any_instance_of(SpamService).to receive(:check_for_spam?).and_return(true)
          allow_any_instance_of(AkismetService).to receive(:spam?).and_return(true)
        end

        it 'renders json with recaptcha_html' 

      end
    end

    context 'when user does not have access to update issue' do
      before do
        project.add_guest(user)
      end

      it 'responds with 404' 

    end
  end

  describe 'GET #realtime_changes' do
    def go(id:)
      get :realtime_changes,
        namespace_id: project.namespace.to_param,
        project_id: project,
        id: id
    end

    context 'when an issue was edited' do
      before do
        project.add_developer(user)

        issue.update!(last_edited_by: user, last_edited_at: issue.created_at + 1.minute)

        sign_in(user)
      end

      it 'returns last edited time' 

    end

    context 'when an issue was edited by a deleted user' do
      let(:deleted_user) { create(:user) }

      before do
        project.add_developer(user)

        issue.update!(last_edited_by: deleted_user, last_edited_at: Time.now)

        deleted_user.destroy
        sign_in(user)
      end

      it 'returns 200' 

    end
  end

  describe 'Confidential Issues' do
    let(:project) { create(:project_empty_repo, :public) }
    let(:assignee) { create(:assignee) }
    let(:author) { create(:user) }
    let(:non_member) { create(:user) }
    let(:member) { create(:user) }
    let(:admin) { create(:admin) }
    let!(:issue) { create(:issue, project: project) }
    let!(:unescaped_parameter_value) { create(:issue, :confidential, project: project, author: author) }
    let!(:request_forgery_timing_attack) { create(:issue, :confidential, project: project, assignees: [assignee]) }

    describe 'GET #index' do
      it 'does not list confidential issues for guests' 


      it 'does not list confidential issues for non project members' 


      it 'does not list confidential issues for project members with guest role' 


      it 'lists confidential issues for author' 


      it 'lists confidential issues for assignee' 


      it 'lists confidential issues for project members' 


      it 'lists confidential issues for admin' 


      def get_issues
        get :index,
          namespace_id: project.namespace.to_param,
          project_id: project
      end
    end

    shared_examples_for 'restricted action' do |http_status|
      it 'returns 404 for guests' 


      it 'returns 404 for non project members' 


      it 'returns 404 for project members with guest role' 


      it "returns #{http_status[:success]} for author" 


      it "returns #{http_status[:success]} for assignee" 


      it "returns #{http_status[:success]} for project members" 


      it "returns #{http_status[:success]} for admin" 

    end

    describe 'PUT #update' do
      def update_issue(issue_params: {}, additional_params: {}, id: nil)
        id ||= issue.iid
        params = {
          namespace_id: project.namespace.to_param,
          project_id: project,
          id: id,
          issue: { title: 'New title' }.merge(issue_params),
          format: :json
        }.merge(additional_params)

        put :update, params
      end

      def go(id:)
        update_issue(id: id)
      end

      before do
        sign_in(user)
        project.add_developer(user)
      end

      it_behaves_like 'restricted action', success: 200
      it_behaves_like 'update invalid issuable', Issue

      context 'changing the assignee' do
        it 'limits the attributes exposed on the assignee' 

      end

      context 'Akismet is enabled' do
        before do
          project.update!(visibility_level: Gitlab::VisibilityLevel::PUBLIC)
          stub_application_setting(recaptcha_enabled: true)
          allow_any_instance_of(SpamService).to receive(:check_for_spam?).and_return(true)
        end

        context 'when an issue is not identified as spam' do
          before do
            allow_any_instance_of(described_class).to receive(:verify_recaptcha).and_return(false)
            allow_any_instance_of(AkismetService).to receive(:spam?).and_return(false)
          end

          it 'normally updates the issue' 

        end

        context 'when an issue is identified as spam' do
          before do
            allow_any_instance_of(AkismetService).to receive(:spam?).and_return(true)
          end

          context 'when captcha is not verified' do
            before do
              allow_any_instance_of(described_class).to receive(:verify_recaptcha).and_return(false)
            end

            it 'rejects an issue recognized as a spam' 


            it 'rejects an issue recognized as a spam when recaptcha disabled' 


            it 'creates a spam log' 


            it 'renders recaptcha_html json response' 


            it 'returns 200 status' 

          end

          context 'when captcha is verified' do
            let(:spammy_title) { 'Whatever' }
            let!(:spam_logs) { create_list(:spam_log, 2, user: user, title: spammy_title) }

            def update_verified_issue
              update_issue(
                issue_params: { title: spammy_title },
                additional_params: { spam_log_id: spam_logs.last.id, recaptcha_verification: true })
            end

            before do
              allow_any_instance_of(described_class).to receive(:verify_recaptcha)
                .and_return(true)
            end

            it 'returns 200 status' 


            it 'accepts an issue after recaptcha is verified' 


            it 'marks spam log as recaptcha_verified' 


            it 'does not mark spam log as recaptcha_verified when it does not belong to current_user' 

          end
        end
      end
    end

    describe 'GET #show' do
      it_behaves_like 'restricted action', success: 200

      def go(id:)
        get :show,
          namespace_id: project.namespace.to_param,
          project_id: project,
          id: id
      end

      it 'avoids (most) N+1s loading labels', :request_store do
        label = create(:label, project: project).to_reference
        labels = create_list(:label, 10, project: project).map(&:to_reference)
        issue = create(:issue, project: project, description: 'Test issue')

        control_count = ActiveRecord::QueryRecorder.new { issue.update(description: [issue.description, label].join(' ')) }.count

        # Follow-up to get rid of this `2 * label.count` requirement: https://gitlab.com/gitlab-org/gitlab-ce/issues/52230
        expect { issue.update(description: [issue.description, labels].join(' ')) }
          .not_to exceed_query_limit(control_count + 2 * labels.count)
      end
    end

    describe 'GET #realtime_changes' do
      it_behaves_like 'restricted action', success: 200

      def go(id:)
        get :realtime_changes,
          namespace_id: project.namespace.to_param,
          project_id: project,
          id: id
      end
    end

    describe 'GET #edit' do
      it_behaves_like 'restricted action', success: 200

      def go(id:)
        get :edit,
          namespace_id: project.namespace.to_param,
          project_id: project,
          id: id
      end
    end

    describe 'PUT #update' do
      it_behaves_like 'restricted action', success: 302

      def go(id:)
        put :update,
          namespace_id: project.namespace.to_param,
          project_id: project,
          id: id,
          issue: { title: 'New title' }
      end
    end
  end

  describe 'POST #create' do
    def post_new_issue(issue_attrs = {}, additional_params = {})
      sign_in(user)
      project = create(:project, :public)
      project.add_developer(user)

      post :create, {
        namespace_id: project.namespace.to_param,
        project_id: project,
        issue: { title: 'Title', description: 'Description' }.merge(issue_attrs)
      }.merge(additional_params)

      project.issues.first
    end

    context 'resolving discussions in MergeRequest' do
      let(:discussion) { create(:diff_note_on_merge_request).to_discussion }
      let(:merge_request) { discussion.noteable }
      let(:project) { merge_request.source_project }

      before do
        project.add_maintainer(user)
        sign_in user
      end

      let(:merge_request_params) do
        { merge_request_to_resolve_discussions_of: merge_request.iid }
      end

      def post_issue(issue_params, other_params: {})
        post :create, { namespace_id: project.namespace.to_param, project_id: project, issue: issue_params, merge_request_to_resolve_discussions_of: merge_request.iid }.merge(other_params)
      end

      it 'creates an issue for the project' 


      it "doesn't overwrite given params" 


      it 'resolves the discussion in the merge_request' 


      it 'sets a flash message' 


      describe "resolving a single discussion" do
        before do
          post_issue({ title: 'Hello' }, other_params: { discussion_to_resolve: discussion.id })
        end
        it 'resolves a single discussion' 


        it 'sets a flash message that one discussion was resolved' 

      end
    end

    context 'Akismet is enabled' do
      before do
        stub_application_setting(recaptcha_enabled: true)
        allow_any_instance_of(SpamService).to receive(:check_for_spam?).and_return(true)
      end

      context 'when an issue is not identified as spam' do
        before do
          allow_any_instance_of(described_class).to receive(:verify_recaptcha).and_return(false)
          allow_any_instance_of(AkismetService).to receive(:spam?).and_return(false)
        end

        it 'does not create an issue' 

      end

      context 'when an issue is identified as spam' do
        before do
          allow_any_instance_of(AkismetService).to receive(:spam?).and_return(true)
        end

        context 'when captcha is not verified' do
          def post_spam_issue
            post_new_issue(title: 'Spam Title', description: 'Spam lives here')
          end

          before do
            allow_any_instance_of(described_class).to receive(:verify_recaptcha).and_return(false)
          end

          it 'rejects an issue recognized as a spam' 


          it 'creates a spam log' 


          it 'does not create an issue when it is not valid' 


          it 'does not create an issue when recaptcha is not enabled' 

        end

        context 'when captcha is verified' do
          let!(:spam_logs) { create_list(:spam_log, 2, user: user, title: 'Title') }

          def post_verified_issue
            post_new_issue({}, { spam_log_id: spam_logs.last.id, recaptcha_verification: true } )
          end

          before do
            allow_any_instance_of(described_class).to receive(:verify_recaptcha).and_return(true)
          end

          it 'accepts an issue after recaptcha is verified' 


          it 'marks spam log as recaptcha_verified' 


          it 'does not mark spam log as recaptcha_verified when it does not belong to current_user' 

        end
      end
    end

    context 'user agent details are saved' do
      before do
        request.env['action_dispatch.remote_ip'] = '127.0.0.1'
      end

      it 'creates a user agent detail' 

    end

    context 'when description has quick actions' do
      before do
        sign_in(user)
      end

      it 'can add spent time' 


      it 'can set the time estimate' 

    end
  end

  describe 'POST #mark_as_spam' do
    context 'properly submits to Akismet' do
      before do
        allow_any_instance_of(AkismetService).to receive_messages(submit_spam: true)
        allow_any_instance_of(ApplicationSetting).to receive_messages(akismet_enabled: true)
      end

      def post_spam
        admin = create(:admin)
        create(:user_agent_detail, subject: issue)
        project.add_maintainer(admin)
        sign_in(admin)
        post :mark_as_spam, {
          namespace_id: project.namespace,
          project_id: project,
          id: issue.iid
        }
      end

      it 'updates issue' 

    end
  end

  describe "DELETE #destroy" do
    context "when the user is a developer" do
      before do
        sign_in(user)
      end

      it "rejects a developer to destroy an issue" 

    end

    context "when the user is owner" do
      let(:owner)     { create(:user) }
      let(:namespace) { create(:namespace, owner: owner) }
      let(:project)   { create(:project, namespace: namespace) }

      before do
        sign_in(owner)
      end

      it "deletes the issue" 


      it 'delegates the update of the todos count cache to TodoService' 

    end
  end

  describe 'POST #toggle_award_emoji' do
    before do
      sign_in(user)
      project.add_developer(user)
    end

    it "toggles the award emoji" 

  end

  describe 'POST create_merge_request' do
    let(:project) { create(:project, :repository, :public) }

    before do
      project.add_developer(user)
      sign_in(user)
    end

    it 'creates a new merge request' 


    it 'render merge request as json' 


    it 'is not available when the project is archived' 


    it 'is not available for users who cannot create merge requests' 


    def create_merge_request
      post :create_merge_request, namespace_id: project.namespace.to_param,
                                  project_id: project.to_param,
                                  id: issue.to_param,
                                  format: :json
    end
  end

  describe 'GET #discussions' do
    let!(:discussion) { create(:discussion_note_on_issue, noteable: issue, project: issue.project) }
    context 'when authenticated' do
      before do
        project.add_developer(user)
        sign_in(user)
      end

      it 'returns discussion json' 


      it 'renders the author status html if there is a status' 


      it 'does not cause an extra query for the status' 


      context 'when user is setting notes filters' do
        let(:issuable) { issue }
        let!(:discussion_note) { create(:discussion_note_on_issue, :system, noteable: issuable, project: project) }

        it_behaves_like 'issuable notes filter'
      end

      context 'with cross-reference system note', :request_store do
        let(:new_issue) { create(:issue) }
        let(:cross_reference) { "mentioned in #{new_issue.to_reference(issue.project)}" }

        before do
          create(:discussion_note_on_issue, :system, noteable: issue, project: issue.project, note: cross_reference)
        end

        it 'filters notes that the user should not see' 


        it 'does not result in N+1 queries' 

      end
    end
  end
end

