require('spec_helper')

describe ProjectsController do
  include ProjectForksHelper

  let(:project) { create(:project) }
  let(:public_project) { create(:project, :public) }
  let(:user) { create(:user) }
  let(:jpg) { fixture_file_upload('spec/fixtures/rails_sample.jpg', 'image/jpg') }
  let(:txt) { fixture_file_upload('spec/fixtures/doc_sample.txt', 'text/plain') }

  describe 'GET new' do
    context 'with an authenticated user' do
      let(:group) { create(:group) }

      before do
        sign_in(user)
      end

      context 'when namespace_id param is present' do
        context 'when user has access to the namespace' do
          it 'renders the template' 

        end

        context 'when user does not have access to the namespace' do
          it 'responds with status 404' 

        end
      end
    end
  end

  describe 'GET index' do
    context 'as a user' do
      it 'redirects to root page' 

    end

    context 'as a guest' do
      it 'redirects to Explore page' 

    end
  end

  describe "GET show" do
    context "user not project member" do
      before do
        sign_in(user)
      end

      context "user does not have access to project" do
        let(:private_project) { create(:project, :private) }

        it "does not initialize notification setting" 

      end

      context "user has access to project" do
        context "and does not have notification setting" do
          it "initializes notification as disabled" 

        end

        context "and has notification setting" do
          before do
            setting = user.notification_settings_for(public_project)
            setting.level = :watch
            setting.save
          end

          it "shows current notification setting" 

        end
      end

      describe "when project repository is disabled" do
        render_views

        before do
          project.add_developer(user)
          project.project_feature.update_attribute(:repository_access_level, ProjectFeature::DISABLED)
        end

        it 'shows wiki homepage' 


        it 'shows issues list page if wiki is disabled' 


        it 'shows customize workflow page if wiki and issues are disabled' 


        it 'shows activity if enabled by user' 

      end
    end

    context 'when the storage is not available', :broken_storage do
      set(:project) { create(:project, :broken_storage) }

      before do
        project.add_developer(user)
        sign_in(user)
      end

      it 'renders a 503' 

    end

    context "project with empty repo" do
      let(:empty_project) { create(:project_empty_repo, :public) }

      before do
        sign_in(user)
      end

      User.project_views.keys.each do |project_view|
        context "with #{project_view} view set" do
          before do
            user.update(project_view: project_view)

            get :show, namespace_id: empty_project.namespace, id: empty_project
          end

          it "renders the empty project view" 

        end
      end
    end

    context "project with broken repo" do
      let(:empty_project) { create(:project_broken_repo, :public) }

      before do
        sign_in(user)
      end

      User.project_views.keys.each do |project_view|
        context "with #{project_view} view set" do
          before do
            user.update(project_view: project_view)

            get :show, namespace_id: empty_project.namespace, id: empty_project
          end

          it "renders the empty project view" 

        end
      end
    end

    context "rendering default project view" do
      let(:public_project) { create(:project, :public, :repository) }

      render_views

      it "renders the activity view" 


      it "renders the files view" 


      it "renders the readme view" 

    end

    context "when the url contains .atom" do
      let(:public_project_with_dot_atom) { build(:project, :public, name: 'my.atom', path: 'my.atom') }

      it 'expects an error creating the project' 

    end

    context 'when the project is pending deletions' do
      it 'renders a 404 error' 

    end

    context "redirection from http://someproject.git" do
      it 'redirects to project page (format.html)' 

    end

    context 'when the project is forked and has a repository', :request_store do
      let(:public_project) { create(:project, :public, :repository) }
      let(:other_user) { create(:user) }

      render_views

      before do
        # View the project as a user that does not have any rights
        sign_in(other_user)

        fork_project(public_project)
      end

      it 'does not increase the number of queries when the project is forked' 

    end
  end

  describe 'GET edit' do
    it 'sets the badge API endpoint' 

  end

  describe "#update" do
    render_views

    let(:admin) { create(:admin) }

    before do
      sign_in(admin)
    end

    shared_examples_for 'updating a project' do
      context 'when only renaming a project path' do
        it "sets the repository to the right path after a rename" 

      end

      context 'when project has container repositories with tags' do
        before do
          stub_container_registry_config(enabled: true)
          stub_container_registry_tags(repository: /image/, tags: %w[rc1])
          create(:container_repository, project: project, name: :image)
        end

        it 'does not allow to rename the project' 

      end

      it 'updates Fast Forward Merge attributes' 


      def update_project(**parameters)
        put :update,
            namespace_id: project.namespace.path,
            id: project.path,
            project: parameters
      end
    end

    context 'hashed storage' do
      let(:project) { create(:project, :repository) }

      it_behaves_like 'updating a project'
    end

    context 'legacy storage' do
      let(:project) { create(:project, :repository, :legacy_storage) }

      it_behaves_like 'updating a project'
    end
  end

  describe '#transfer' do
    render_views

    let(:project) { create(:project, :repository) }
    let(:admin) { create(:admin) }
    let(:new_namespace) { create(:namespace) }

    it 'updates namespace' 


    context 'when new namespace is empty' do
      it 'project namespace is not changed' 

    end
  end

  describe "#destroy" do
    let(:admin) { create(:admin) }

    it "redirects to the dashboard" 


    context "when the project is forked" do
      let(:project)      { create(:project, :repository) }
      let(:forked_project) { fork_project(project, nil, repository: true) }
      let(:merge_request) do
        create(:merge_request,
          source_project: forked_project,
          target_project: project)
      end

      it "closes all related merge requests" 

    end
  end

  describe 'PUT #new_issuable_address for issue' do
    subject do
      put :new_issuable_address,
        namespace_id: project.namespace,
        id: project,
        issuable_type: 'issue'
      user.reload
    end

    before do
      sign_in(user)
      project.add_developer(user)
      allow(Gitlab.config.incoming_email).to receive(:enabled).and_return(true)
    end

    it 'has http status 200' 


    it 'changes the user incoming email token' 


    it 'changes projects new issue address' 

  end

  describe 'PUT #new_issuable_address for merge request' do
    subject do
      put :new_issuable_address,
        namespace_id: project.namespace,
        id: project,
        issuable_type: 'merge_request'
      user.reload
    end

    before do
      sign_in(user)
      project.add_developer(user)
      allow(Gitlab.config.incoming_email).to receive(:enabled).and_return(true)
    end

    it 'has http status 200' 


    it 'changes the user incoming email token' 


    it 'changes projects new merge request address' 

  end

  describe "POST #toggle_star" do
    it "toggles star if user is signed in" 


    it "does nothing if user is not signed in" 

  end

  describe "DELETE remove_fork" do
    context 'when signed in' do
      before do
        sign_in(user)
      end

      context 'with forked project' do
        let(:forked_project) { fork_project(create(:project, :public), user) }

        it 'removes fork from project' 

      end

      context 'when project not forked' do
        let(:unforked_project) { create(:project, namespace: user.namespace) }

        it 'does nothing if project was not forked' 

      end
    end

    it "does nothing if user is not signed in" 

  end

  describe "GET refs" do
    let(:public_project) { create(:project, :public, :repository) }

    it 'gets a list of branches and tags' 


    it "gets a list of branches, tags and commits" 


    context "when preferred language is Japanese" do
      before do
        user.update!(preferred_language: 'ja')
        sign_in(user)
      end

      it "gets a list of branches, tags and commits" 

    end
  end

  describe 'POST #preview_markdown' do
    before do
      sign_in(user)
    end

    it 'renders json in a correct format' 


    context 'state filter on references' do
      let(:issue) { create(:issue, :closed, project: public_project) }
      let(:merge_request) { create(:merge_request, :closed, target_project: public_project) }

      it 'renders JSON body with state filter for issues' 


      it 'renders JSON body with state filter for MRs' 

    end
  end

  describe '#ensure_canonical_path' do
    before do
      sign_in(user)
    end

    context 'for a GET request' do
      context 'when requesting the canonical path' do
        context "with exactly matching casing" do
          it "loads the project" 

        end

        context "with different casing" do
          it "redirects to the normalized path" 

        end
      end

      context 'when requesting a redirected path' do
        let!(:redirect_route) { public_project.redirect_routes.create!(path: "foo/bar") }

        it 'redirects to the canonical path' 


        it 'redirects to the canonical path (testing non-show action)' 

      end
    end

    context 'for a POST request' do
      context 'when requesting the canonical path with different casing' do
        it 'does not 404' 


        it 'does not redirect to the correct casing' 

      end

      context 'when requesting a redirected path' do
        let!(:redirect_route) { public_project.redirect_routes.create!(path: "foo/bar") }

        it 'returns not found' 

      end
    end

    context 'for a DELETE request' do
      before do
        sign_in(create(:admin))
      end

      context 'when requesting the canonical path with different casing' do
        it 'does not 404' 


        it 'does not redirect to the correct casing' 

      end

      context 'when requesting a redirected path' do
        let!(:redirect_route) { project.redirect_routes.create!(path: "foo/bar") }

        it 'returns not found' 

      end
    end
  end

  describe '#export' do
    before do
      sign_in(user)

      project.add_maintainer(user)
    end

    context 'when project export is enabled' do
      it 'returns 302' 

    end

    context 'when project export is disabled' do
      before do
        stub_application_setting(project_export_enabled?: false)
      end

      it 'returns 404' 

    end
  end

  describe '#download_export' do
    before do
      sign_in(user)

      project.add_maintainer(user)
    end

    context 'object storage enabled' do
      context 'when project export is enabled' do
        it 'returns 302' 

      end

      context 'when project export is disabled' do
        before do
          stub_application_setting(project_export_enabled?: false)
        end

        it 'returns 404' 

      end
    end
  end

  describe '#remove_export' do
    before do
      sign_in(user)

      project.add_maintainer(user)
    end

    context 'when project export is enabled' do
      it 'returns 302' 

    end

    context 'when project export is disabled' do
      before do
        stub_application_setting(project_export_enabled?: false)
      end

      it 'returns 404' 

    end
  end

  describe '#generate_new_export' do
    before do
      sign_in(user)

      project.add_maintainer(user)
    end

    context 'when project export is enabled' do
      it 'returns 302' 

    end

    context 'when project export is disabled' do
      before do
        stub_application_setting(project_export_enabled?: false)
      end

      it 'returns 404' 

    end
  end

  def project_moved_message(redirect_route, project)
    "Project '#{redirect_route.path}' was moved to '#{project.full_path}'. Please update any links and bookmarks that may still have the old path."
  end
end

