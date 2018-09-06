require 'spec_helper'

describe Api::V1 do
  let(:client_app) { FactoryGirl.create(:application) }
  let(:user) { FactoryGirl.create(:user, :with_profile) }
  let(:scopes) { '' }
  let(:token) { FactoryGirl.create(:access_token, application: client_app, resource_owner: user, scopes: scopes) }
  let(:header) { { 'HTTP_AUTHORIZATION' => "Bearer #{token.token}" } }
  let(:empty_header) { {} }

  describe 'Legacy tokens path' do
    let(:grant) do
      FactoryGirl.create(:access_grant,
                         application: client_app,
                         redirect_uri: client_app.redirect_uri,
                         resource_owner: user)
    end

    let(:params) do
      {
        client_id: client_app.uid,
        client_secret: client_app.secret,
        code: grant.token,
        grant_type: 'authorization_code',
        redirect_uri: client_app.redirect_uri
      }
    end

    subject { post '/oauth/authorize', params }
    it 'response http code is 200' 

    it 'response should have an access token' 

  end

  describe 'Token validity check' do
    subject { get '/api/v1/profile', nil, header }
    context 'with a valid token' do
      let(:scopes) { 'profile.email' }
      its(:status) { should eq 200 }
    end
    context 'with an invalid token' do
      let(:token)  { double(:access_token, token: 'bad token! No cookie!') }
      its(:status) { should eq 401 }
      it 'should include an error message' 

    end
  end

  describe 'GET /api/v1/tokeninfo' do
    let(:path)   { '/api/v1/tokeninfo' }
    let(:scopes) { 'profile.first_name profile.last_name' }
    describe "response status" do
      subject { get path, nil, header }
      its(:status) { should eq 200 }
    end
    describe "response body" do
      subject { JSON.parse(get(path, nil, header).body) }
      its(['resource_owner_id'])  { should eq user.id }
      its(['scopes'])             { should eq scopes.split(' ') }
      its(['expires_in_seconds']) { should be_within(2).of Doorkeeper.configuration.access_token_expires_in }
      its(['application'])        { should eql 'uid' => client_app.uid }
      its(:size)                  { should eq 4 }
    end
  end

  describe 'GET /api/v1/profile' do
    let(:scopes) { 'profile.email' }
    let(:params) { nil }
    subject { get '/api/v1/profile', params, header }

    context 'when app does not specify required scopes' do
      let(:scopes) { '' }

      it 'should return an error and message' 


      it 'does not create an user action record' 

    end

    context 'when app has limited scope' do
      let(:scopes) { 'profile.first_name profile.last_name' }

      it 'should return profile limited to requested scopes' 


      it 'creates an user action record' 

    end

    context 'when the user queried exists' do
      context 'when the schema parameter is set' do
        pending 'need to understand Schema.org requirement' do
          let(:params) { { 'schema' => 'true' } }
          it 'should render the response in a Schema.org hash' 

        end
      end

      it 'creates an user action record' 

    end
  end

  describe 'POST /api/v1/notifications' do
    let(:client_app_2) { FactoryGirl.create(:application, name: 'App2') }

    let(:token) { FactoryGirl.create(:access_token, application: client_app_2, resource_owner: user, scopes: 'notifications') }

    subject { post '/api/v1/notifications', params, header }

    context 'when the user has a valid token' do
      context 'when the notification attributes are valid' do
        let(:params) { { notification: { subject: 'Project MyUSA', body: 'This is a test.' } } }
        it 'should create a new notification when the notification info is valid' 


        it 'creates an user action record' 

      end

      context 'when the notification attributes are not valid' do
        let(:params) { { notification: { body: 'This is a test.' } } }
        it 'should return an error message' 


        it 'does not create an user action record' 

      end
    end
  end

  describe 'Tasks API' do
    let(:scopes) { 'tasks' }
    subject { get '/api/v1/tasks', nil, header }

    describe 'GET /api/v1/tasks.json' do
      context 'when token is valid' do
        context 'when there are tasks for a user, some of which were created by the app making the request' do
          before do
            @task1 = Task.create!(name: 'Task #1', user_id: user.id, app_id: client_app.id)
            @task1.task_items << TaskItem.create!(name: 'Task item 1 (no url)')
            @task2 = Task.create!(name: 'Task #2', user_id: user.id, app_id: client_app.id + 1)
            @task2.task_items << TaskItem.create!(name: 'Task item 1 (with url)', url: 'http://www.google.com')
          end

          it 'should return the tasks that were created by the calling app' 


          it 'should return the task and task items' 


          it 'creates an user action record' 

        end
      end

      context 'when the the app does not have the proper scope' do
        let(:scopes) { 'notifications' }

        it 'should return an error message' 


        it 'does not create an user action record' 

      end
    end

    describe 'POST /api/v1/tasks' do
      let(:params) do
        { task: { name: 'New Task',
                  url: "http://wwww.gsa.gov/",
                  task_items_attributes: [ { name: "Item 1", external_id: "abc", url: "http://www.gsa.gov/" } ]
                }
        }
      end

      subject { post '/api/v1/tasks', params, header }

      context 'when the caller has a valid token' do
        context 'when the appropriate parameters are specified' do
          it 'should create a new task for the user' 


          it "should create a new task item for the task" 


          it 'creates an user action record' 

        end

        context 'when the required parameters are missing' do
          let(:params) { nil }
          it 'should return an error message' 


          it 'does not create an user action record' 

        end
      end
    end

    describe 'PUT /api/v1/tasks:id.json' do
      subject { put "/api/tasks/#{task.id}", params, header }
      context 'when the caller has a valid token' do
        let!(:task) do
          Task.create!(name: 'Mega task',
                       url: "http://www.gsa.gov/",
                       completed_at: Time.now - 1.day,
                       user_id: user.id,
                       app_id: client_app.id,
                       task_items_attributes: [{ name: 'Task item one', external_id: 'abcdef' }])
        end

        context 'when valid parameters are used' do
          let(:params) do
            { task: { name: 'New Task', url: "http://18f.gsa.gov",
                      task_items_attributes: [{ id: task.task_items.first.id,
                                                name: 'Task item one A' }] } }
          end

          it 'should update the task and task items' 


          it 'creates an user action record' 

        end

        context 'when updating a task marked as completed' do
          let(:tasks) do
            Task.create!({
                           name: 'Mega completed task',
                           user_id: user.id,
                           app_id: client_app.id,
                           task_items_attributes: [{ name: 'Task item one' }]
                         }).tap(&:complete!)
          end

          let(:params) do
            { task: { name: 'New Incomplete Task',
                      url: 'http://whitehouse.gov',
                      completed_at: nil,
                      task_items_attributes: [{id: task.task_items.first.id, name: 'Task item one', external_id: 'abc'}]
                    }
            }
          end

          it 'should no longer be marked as complete when specified' 


          it 'creates an user action record' 

        end
        context 'when invalid parameters are used' do
          let(:params) do
            { task: { name: 'New Task',
                      task_items_attributes: [{ id: 'chicken', name: 'updated task item name' }] }}
          end

          it 'should return meaningful errors' 


          it 'does not create an user action record' 

        end
      end
    end

    describe 'GET /api/v1/tasks/:id.json' do
      let(:task) do
        Task.create! do |t|
          t.name = 'New Task'
          t.url = 'http://www.gsa.gov'
          t.user_id = user.id
          t.app_id = client_app.id
          t.task_items = [
            TaskItem.new(name: "Task Item #1"),
            TaskItem.new(name: "Task Item #2", url: 'http://valid_url.com')
          ]
        end
      end
      subject { get "/api/tasks/#{task.id}", nil, header }

      context 'when the token is valid' do
        it 'should retrieve the task' 


        it 'creates an user action record' 

      end

      context "when the task exists but belongs to another user" do
        before { task.update_attribute(:user_id, user.id + 1) }

        it "should return a 403 response" 

      end

      context "when the task does not exist" do
        subject { get "/api/tasks/#{task.id + 10_000}", nil, header }
        it "should return a 404 error" 

      end
    end

    describe 'DELETE api/v1/tasks/:id' do
      let!(:task) do
        Task.create! do |t|
          t.name = 'New Task'
          t.url = 'http://www.gsa.gov'
          t.user_id = user.id
          t.app_id = client_app.id
          t.task_items = [
            TaskItem.new(name: "Task Item #1"),
            TaskItem.new(name: "Task Item #2", url: 'http://valid_url.com')
          ]
        end
      end

      context "when the token is valid" do
        subject { delete "/api/tasks/#{task.id}", nil, header }

        it "should return a status of 200" 


        it "should delete the task" 


        it "should delete any associated task_items" 


        it 'creates an user action record' 

      end

      context "when the task belongs to a different user" do
        before { task.update_attribute(:user_id, user.id + 1) }

        before { @response = delete "/api/tasks/#{task.id}", nil, header }

        it "should return a status of 403" 


        it "should not delete the Task" 


        it 'does not create an user action record' 

      end

      context "when the token is invalid" do
        before { @response = delete "/api/v1/tasks/#{task.id}", nil, empty_header }

        it "should return a 401 status" 


        it "should not delete anything" 


        it 'does not create an user action record' 

      end
    end
  end

  describe "Task Items API" do
    let(:scopes) { 'tasks' }

    describe "POST /api/v1/tasks/:id/task_items" do
      let!(:task) do
        Task.create! do |t|
          t.name = 'New Task'
          t.url = 'http://www.gsa.gov'
          t.user_id = user.id
          t.app_id = client_app.id
        end
      end

      let(:params) { { task_item: { name: 'Task item one', external_id: 'abc', url: "http://gsa.gov/" } } }

      context "when the token is valid" do
        subject { post "/api/v1/tasks/#{task.id}/task_items", params, header }

        it "should return a 200 status" 


        it "should return the JSON of the task" 


        it "should create a new task item associated with that task" 


        it 'creates an user action record' 

      end

      context "when the task belongs to another user" do
        before { task.update_attribute(:user_id, task.user_id + 10) }
        subject { post "/api/v1/tasks/#{task.id}/task_items", params, header }

        it "should return a 403 status" 


        it "should not create a task item" 


        it 'does not create an user action record' 

      end

      context "when the token is not valid" do
        subject { post "/api/v1/tasks/#{task.id}/task_items", params, empty_header }

        it "should return a HTTP 401 status" 


        it "should create nothing" 


        it 'does not create an user action record' 

      end
    end

    describe "GET /api/v1/tasks/:id/task_items" do
      let(:task) do
        Task.create! do |t|
          t.name = 'New Task'
          t.url = 'http://www.gsa.gov'
          t.user_id = user.id
          t.app_id = client_app.id
          t.task_items = [
            TaskItem.new(name: "Task Item #1", "external_id": "abcdef"),
            TaskItem.new(name: "Task Item #2", url: 'http://valid_url.com')
          ]
        end
      end

      subject { get "/api/v1/tasks/#{task.id}/task_items", nil, header }

      context "when the token is valid" do
        it "should return a HTTP 200 status" 


        it "should return all the task_items associated with that task in an array" 


        it 'creates an user action record' 

      end

      context "when the task does not exist" do
        before { task.delete }

        it "should return a 404 HTTP status" 


        it 'does not create an user action record' 

      end

      context "when the task belongs to someone else" do
        before { task.update_attribute(:user_id, task.user_id + 10) }

        it "should return a 403 HTTP status" 


        it 'does not create an user action record' 

      end

      context "when the token is invalid" do
        subject { get "/api/v1/tasks/#{task.id}/task_items", nil, empty_header }

        it "should return a 401 HTTP status" 


        it 'does not create an user action record' 

      end
    end

    describe "PUT /api/v1/tasks/:id/task_items/:item_id" do
      let!(:task) do
        Task.create! do |t|
          t.name = 'New Task'
          t.url = 'http://www.gsa.gov'
          t.user_id = user.id
          t.app_id = client_app.id
          t.task_items = [
            TaskItem.new(name: "Task Item #1", "external_id": "abcdef"),
            TaskItem.new(name: "Task Item #2", url: 'http://valid_url.com')
          ]
        end
      end

      let!(:task_item) { task.task_items.first }
      let(:params) { { task_item: { name: "Task Item Changed", "complete": true } } }

      subject { put "/api/v1/tasks/#{task.id}/task_items/#{task_item.id}", params, header }

      context "when the token is valid" do
        it "should return a HTTP 200 status code" 


        it "should return JSON representing the new task item" 


        it "should update the task item with specified fields" 


        it "should not change fields that are not specified" 


        it 'creates an user action record' 

      end

      context "when the task does not exist" do
        before { task.destroy }

        it "should return a 404 status" 


        it "should not create any task items" 


        it 'does not create an user action record' 

      end

      context "when the task belongs to someone else" do
        before { task.update_attribute(:user_id, task.user_id + 10) }

        it "should return a 403 status" 


        it "should not create any task items" 


        it 'does not create an user action record' 

      end

      context "when the token is invalid" do
        subject { put "/api/v1/tasks/#{task.id}/task_items/#{task_item.id}", params, empty_header }

        it "should return a HTTP 401 status" 


        it "should not update the task item" 


        it 'does not create an user action record' 

      end
    end

    describe "DELETE /api/v1/tasks/:id/task_items/:item_id" do
      let(:task) do
        Task.create! do |t|
          t.name = 'New Task'
          t.url = 'http://www.gsa.gov'
          t.user_id = user.id
          t.app_id = client_app.id
          t.task_items = [
            TaskItem.new(name: "Task Item #1", "external_id": "abcdef")
          ]
        end
        let(:task_item) { task.task_items.first }

        subject { delete "/api/v1/tasks/#{task.id}/task_items/#{task_item.id}", nil, header }

        context "when the token is valid" do
          it "should return a HTTP 200 status code" 


          it "should return a JSON representation of the task item" 


          it "should delete the task_item" 


          it 'creates an user action record' 

        end

        context "when the task does not exist" do
          before { task.destroy }

          it "should return a 404 status" 


          it 'does not create an user action record' 

        end

        context "when the task_item does not exist" do
          before { task_item.destroy }

          it "should return a 404 status" 


          it 'does not create an user action record' 

        end

        context "when the task belongs to another user" do
          before { task.update_attribute(:user_id, task.user_id + 10) }

          it "should return a 403 status" 


          it "should not delete the task_item" 


          it 'does not create an user action record' 

        end

        context "when the token is invalid" do
          subject { delete "/api/v1/tasks/#{task.id}/task_items/#{task_item.id}", nil, empty_header }

          it "should return a HTTP 401 error" 


          it "should not delete the task" 


          it 'does not create an user action record' 

        end
      end
    end
  end

  describe 'Authorized Scopes API' do
    pending 'need to figure out how to query for scopes with Doorkeeper' do
      describe 'GET /api/v1/authorized_scopes' do
        context 'when a valid token is provided' do
          let(:scopes) do
            OauthScope.top_level_scopes.where(scope_type: 'user') <<
              OauthScope.find_by_scope_name('profile.first_name') <<
              OauthScope.find_by_scope_name('profile.last_name')
          end

          let(:scopes_selected) do
            OauthScope.top_level_scopes.where(scope_type: 'user') <<
              OauthScope.find_by_scope_name('profile.last_name')
          end

          let(:scope_app) do
            App.create(name: 'app_limited',
                       redirect_uri: 'http://localhost/',
                       oauth_scopes: scopes)
          end
          let(:token) { build_access_token(scope_app, scopes_selected.map(&:scope_name).join(' ')) }

          it 'returns the list of scopes approved by user' 

        end
      end
    end
  end
end

