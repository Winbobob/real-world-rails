describe ProblemsController, type: 'controller' do
  it_requires_authentication for:    {
    index: :get, show: :get, resolve: :put, search: :get
  },
                             params: { app_id: 'dummyid', id: 'dummyid' }

  let(:app) { Fabricate(:app) }
  let(:err) { Fabricate(:err, problem: problem) }
  let(:user) { Fabricate(:user) }
  let(:problem) { Fabricate(:problem, app: app, environment: "production") }

  describe "GET /problems" do
    before(:each) do
      sign_in user
      @problem = Fabricate(:notice, err: Fabricate(:err, problem: Fabricate(:problem, app: app, environment: "production"))).problem
    end

    context "pagination" do
      before(:each) do
        35.times { Fabricate :err }
      end

      it "should have default per_page value for user" 


      it "should be able to override default per_page value" 

    end

    context 'with environment filters' do
      before(:each) do
        environments = %w(production test development staging)
        20.times do |i|
          Fabricate(:problem, environment: environments[i % environments.length])
        end
      end

      context 'no params' do
        it 'shows problems for all environments' 

      end

      context 'environment production' do
        it 'shows problems for just production' 

      end

      context 'environment staging' do
        it 'shows problems for just staging' 

      end

      context 'environment development' do
        it 'shows problems for just development' 

      end

      context 'environment test' do
        it 'shows problems for just test' 

      end
    end
  end

  describe "GET /problems - previously all" do
    it "gets a paginated list of all problems" 

  end

  describe "GET /problems/search" do
    before do
      sign_in user
      @app      = Fabricate(:app)
      @problem1 = Fabricate(:problem, app: @app, message: "Most important")
      @problem2 = Fabricate(:problem, app: @app, message: "Very very important")
    end

    it "renders successfully" 


    it "renders index template" 


    it "searches problems for given string" 


    it "works when given string is empty" 

  end

  describe "GET /apps/:app_id/problems/:id" do
    before do
      sign_in user
    end

    it "finds the app" 


    it "finds the problem" 


    it "successfully render page" 


    context "when rendering views" do
      render_views

      it "successfully renders the view even when there are no notices attached to the problem" 

    end

    context 'pagination' do
      let!(:notices) do
        3.times.reduce([]) do |coll, i|
          coll << Fabricate(:notice, err: err, created_at: (i.seconds.from_now))
        end
      end

      it "paginates the notices 1 at a time, starting with the most recent" 


      it "paginates the notices 1 at a time, based on then notice param" 

    end
  end

  describe "GET /apps/:app_id/problems/:id/xhr_sparkline" do
    before do
      sign_in user
    end

    it "renders without error" 

  end

  describe "PUT /apps/:app_id/problems/:id/resolve" do
    before do
      sign_in user

      @err = Fabricate(:err)
    end

    it 'finds the app and the problem' 


    it "should resolve the issue" 


    it "should display a message" 


    it "should redirect to the app page" 


    it "should redirect back to problems page" 

  end

  describe "POST /apps/:app_id/problems/:id/create_issue" do
    before { sign_in user }

    context "when app has a issue tracker" do
      let(:notice) { NoticeDecorator.new(Fabricate :notice) }
      let(:problem) { ProblemDecorator.new(notice.problem) }
      let(:issue_tracker) do
        Fabricate(:issue_tracker).tap do |t|
          t.instance_variable_set(:@tracker, ErrbitPlugin::MockIssueTracker.new(t.options))
        end
      end

      before do
        problem.app.issue_tracker = issue_tracker
        allow(controller).to receive(:problem).and_return(problem)
        allow(controller).to receive(:current_user).and_return(user)
      end

      it "should redirect to problem page" 


      it "should save the right title" 


      it "should renders the issue body" 


      it "should update the problem" 


      context "when rendering views" do
        render_views

        it "should save the right body" 


        it "should render whatever the issue tracker says" 

      end
    end

    context "when app has no issue tracker" do
      it "should redirect to problem page" 

    end
  end

  describe "POST /apps/:app_id/problems/:id/close_issue" do
    before { sign_in user }

    context "when app has a issue tracker" do
      let(:notice) { NoticeDecorator.new(Fabricate :notice) }
      let(:problem) { ProblemDecorator.new(notice.problem) }
      let(:issue_tracker) do
        Fabricate(:issue_tracker).tap do |t|
          t.instance_variable_set(:@tracker, ErrbitPlugin::MockIssueTracker.new(t.options))
        end
      end

      before do
        problem.app.issue_tracker = issue_tracker
        allow(controller).to receive(:problem).and_return(problem)
        allow(controller).to receive(:current_user).and_return(user)
      end

      it "should redirect to problem page" 

    end

    context "when app has no issue tracker" do
      it "should redirect to problem page" 

    end
  end

  describe "DELETE /apps/:app_id/problems/:id/unlink_issue" do
    before(:each) do
      sign_in user
    end

    context "problem with issue" do
      let(:err) { Fabricate(:err, problem: Fabricate(:problem, issue_link: "http://some.host")) }

      before(:each) do
        delete :unlink_issue, app_id: err.app.id, id: err.problem.id
        err.problem.reload
      end

      it "should redirect to problem page" 


      it "should clear issue link" 

    end

    context "err without issue" do
      let(:err) { Fabricate :err }

      before(:each) do
        delete :unlink_issue, app_id: err.app.id, id: err.problem.id
        err.problem.reload
      end

      it "should redirect to problem page" 

    end
  end

  describe "Bulk Actions" do
    before(:each) do
      sign_in user
      @problem1 = Fabricate(:err, problem: Fabricate(:problem, resolved: true)).problem
      @problem2 = Fabricate(:err, problem: Fabricate(:problem, resolved: false)).problem
    end

    context "POST /problems/merge_several" do
      it "should require at least two problems" 


      it "should merge the problems" 

    end

    context "POST /problems/unmerge_several" do
      it "should require at least one problem" 


      it "should unmerge a merged problem" 

    end

    context "POST /problems/resolve_several" do
      it "should require at least one problem" 


      it "should resolve the issue" 


      it "should display a message about 1 err" 


      it "should display a message about 2 errs" 

    end

    context "POST /problems/unresolve_several" do
      it "should require at least one problem" 


      it "should unresolve the issue" 

    end

    context "POST /problems/destroy_several" do
      it "should delete the problems" 

    end

    describe "POST /apps/:app_id/problems/destroy_all" do
      before do
        sign_in user
        @app      = Fabricate(:app)
        @problem1 = Fabricate(:problem, app: @app)
        @problem2 = Fabricate(:problem, app: @app)
      end

      it "destroys all problems" 


      it "should display a message" 


      it "should redirect back to the app page" 

    end
  end
end

