describe MyTasksController do

  before(:each) do
    @user_id = rand(99999).to_s
    @fake_google_clear_tasks_proxy = GoogleApps::ClearTaskList.new(fake: true)
    @fake_google_delete_tasks_proxy = GoogleApps::DeleteTask.new({fake: true})
    allow(Settings.features).to receive(:reauthentication).and_return(false)
  end

  it "should be an empty task feed on non-authenticated user" 


  it "should be an non-empty task feed on authenticated user" 


  it "should return a valid json object on a successful task update" 


  it "should return a valid truthy json object when successfully clearing completed google tasks" 


  it "should successfully delete a google task" 


  it "should fail on deleting a canvas task" 


  it "should return a 400 error on some ArgumentError with the task model object" 


  context 'viewing-as' do
    let(:user_id) { rand(99999).to_s }
    let(:original_user_id) { rand(99999).to_s }
    before do
      session['user_id'] = user_id
      allow(Settings.google_proxy).to receive(:fake).at_least(:once).and_return(true)
      allow(Settings.canvas_proxy).to receive(:fake).at_least(:once).and_return(true)
    end
    context 'with real-user data cached' do
      it 'should not give a real user a cached censored feed' 

      it 'should not return Google data from a cached real-user feed' 

    end
    it 'should not add a Google task to the real user account' 

  end

  context 'delegated access' do
    let(:uid) {random_id}
    let(:campus_solutions_id) {random_id}
    include_context 'delegated access'
    context 'enrollments-only access' do
      let(:privileges) do
        {
          viewEnrollments: true
        }
      end
      it 'denies all access' 

    end
    context 'financial access' do
      let(:privileges) do
        {
          financial: true
        }
      end
      it 'allows access only to Financial Aid tasks' 

    end
  end

  context 'advisor view-as' do
    let(:uid) {random_id}
    include_context 'advisor view-as'
    before do
      allow(Settings.canvas_proxy).to receive(:fake).at_least(:once).and_return(true)
    end
    it 'filters bCourses tasks' 

  end

end

