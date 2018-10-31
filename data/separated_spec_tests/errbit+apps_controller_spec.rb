describe AppsController, type: 'controller' do
  it_requires_authentication
  it_requires_admin_privileges for: { new: :get, edit: :get, create: :post, update: :put, destroy: :delete }

  let(:app_params) { { name: 'BestApp' } }
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }
  let(:watcher) { Fabricate(:user_watcher, app: app, user: user) }
  let(:unwatched_app) { Fabricate(:app) }
  let(:app) { unwatched_app }
  let(:watched_app1) do
    a = Fabricate(:app)
    Fabricate(:user_watcher, user: user, app: a)
    a
  end
  let(:watched_app2) do
    a = Fabricate(:app)
    Fabricate(:user_watcher, user: user, app: a)
    a
  end
  let(:err) do
    Fabricate(:err, problem: problem)
  end
  let(:notice) do
    Fabricate(:notice, err: err)
  end
  let(:problem) do
    Fabricate(:problem, app: app)
  end
  let(:problem_resolved) { Fabricate(:problem_resolved, app: app) }
  let(:notice_fingerprinter) do
    nf = SiteConfig.document.notice_fingerprinter
    nf.backtrace_lines = 10
    nf
  end

  describe "GET /apps" do
    context 'when logged in as an admin' do
      it 'finds all apps' 

    end

    context 'when logged in as a regular user' do
      it 'finds all apps' 

    end
  end

  describe "GET /apps/:id" do
    context 'logged in as an admin' do
      before(:each) do
        sign_in admin
      end

      it 'finds the app' 


      it "should not raise errors for app with err without notices" 


      it "should list atom feed successfully" 


      it "should list available watchers by name" 


      context "pagination" do
        before(:each) do
          35.times { Fabricate(:err, problem: Fabricate(:problem, app: app)) }
        end

        it "should have default per_page value for user" 


        it "should be able to override default per_page value" 

      end

      context 'with resolved errors' do
        before(:each) do
          problem_resolved && problem
        end

        context 'and no params' do
          it 'shows only unresolved problems' 

        end

        context 'and all_problems=true params' do
          it 'shows all errors' 

        end
      end

      context 'with environment filters' do
        before(:each) do
          environments = %w(production test development staging)
          20.times do |i|
            Fabricate(:problem, app: app, environment: environments[i % environments.length])
          end
        end

        context 'no params' do
          it 'shows errs for all environments' 

        end

        context 'environment production' do
          it 'shows errs for just production' 

        end

        context 'environment staging' do
          it 'shows errs for just staging' 

        end

        context 'environment development' do
          it 'shows errs for just development' 

        end

        context 'environment test' do
          it 'shows errs for just test' 

        end
      end
    end

    context 'logged in as a user' do
      it 'finds the app even when not watching it' 

    end
  end

  context 'logged in as an admin' do
    before do
      sign_in admin
    end

    describe "GET /apps/new" do
      it 'instantiates a new app with a prebuilt watcher' 


      it "should copy attributes from an existing app" 

    end

    describe "GET /apps/:id/edit" do
      it 'finds the correct app' 

    end

    describe "POST /apps" do
      before do
        @app = Fabricate(:app)
        allow(App).to receive(:new).and_return(@app)
      end

      context "when the create is successful" do
        before do
          expect(@app).to receive(:save).and_return(true)
        end

        it "should redirect to the app page" 


        it "should display a message" 

      end
    end

    describe "PUT /apps/:id" do
      before do
        @app = Fabricate(:app)
      end

      context "when the update is successful" do
        it "should redirect to the app page" 


        it "should display a message" 

      end

      context "changing name" do
        it "should redirect to app page" 

      end

      context "when the update is unsuccessful" do
        it "should render the edit page" 

      end

      context "changing email_at_notices" do
        before do
          allow(Errbit::Config).
            to receive(:per_app_email_at_notices).and_return(true)
        end

        it "should parse legal csv values" 


        context "failed parsing of CSV" do
          it "should set the default value" 


          it "should display a message" 

        end
      end

      context "setting up issue tracker", cur: true do
        context "unknown tracker type" do
          before(:each) do
            put :update, id: @app.id, app: { issue_tracker_attributes: {
              type_tracker: 'unknown', options: { project_id: '1234', api_token: '123123', account: 'myapp' }
            } }
            @app.reload
          end

          it "should not create issue tracker" 

        end
      end

      context "selecting 'use site fingerprinter'" do
        before(:each) do
          SiteConfig.document.update_attributes(notice_fingerprinter: notice_fingerprinter)
          put :update, id: @app.id, app: {
            notice_fingerprinter_attributes: { backtrace_lines: 42 },
            use_site_fingerprinter:          '1'
          }
          @app.reload
        end

        it "should copy site fingerprinter into app fingerprinter" 

      end

      context "not selecting 'use site fingerprinter'" do
        before(:each) do
          SiteConfig.document.update_attributes(notice_fingerprinter: notice_fingerprinter)
          put :update, id: @app.id, app: {
            notice_fingerprinter_attributes: { backtrace_lines: 42 },
            use_site_fingerprinter:          '0'
          }
          @app.reload
        end

        it "shouldn't copy site fingerprinter into app fingerprinter" 

      end
    end

    describe "DELETE /apps/:id" do
      before do
        @app = Fabricate(:app)
      end

      it "should find the app" 


      it "should destroy the app" 


      it "should display a message" 


      it "should redirect to the apps page" 

    end
  end

  describe "POST /apps/:id/regenerate_api_key" do
    context "like watcher" do
      before do
        sign_in watcher.user
      end

      it 'redirect to root with flash error' 

    end

    context "like admin" do
      before do
        sign_in admin
      end

      it 'redirect_to app view' 

    end
  end

  describe "GET /apps/search" do
    before do
      sign_in user
      @app1 = Fabricate(:app, name: 'Foo')
      @app2 = Fabricate(:app, name: 'Bar')
    end

    it "renders successfully" 


    it "renders index template" 


    it "searches problems for given string" 


    it "works when given string is empty" 

  end
end

