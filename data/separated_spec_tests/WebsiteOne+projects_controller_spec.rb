require 'spec_helper'

describe ProjectsController, :type => :controller do

  let(:valid_attributes) { { id: 1,
                            :title => 'WebTwentyFive',
                            :description => 'My project description',
                            :status => 'Active',
                            :pitch => 'My project pitch ...',
                            :pivotaltracker_url => 'https://www.pivotaltracker.com/s/projects/982890',
                            :slug => 'my-project'} }
  let(:valid_session) { {} }

  #TODO split specs into 'logged in' vs 'not logged in'
  before :each do
    # stubbing out devise methods to simulate authenticated user
    @user = build_stubbed(:user, id: 1, slug: 'some-id')
    allow(request.env['warden']).to receive(:authenticate!).and_return(@user)
    allow(controller).to receive(:current_user).and_return(@user)
    allow(@user).to receive(:touch)
  end

  let(:user) { @user }

  describe '#index' do
    before(:each) do
      @project = mock_model(Project, title: 'Carrier has arrived.', commit_count: 200, last_github_update: '2000-01-01')
      @project2 = mock_model(Project, title: 'Carrier has left.', commit_count: 100, last_github_update: '2000-02-01')
      @projects = [@project, @project2]
    end

    it 'should render index page for projects' 


    it 'should assign variables to be rendered by view' 


    describe '#show' do
      before(:each) do
        @project = build_stubbed(:project, valid_attributes)
        allow(@project).to receive(:tag_list).and_return ['WSO']
        Project.stub_chain(:friendly, :find).and_return @project
        @project.stub_chain(:user, :display_name).and_return "Happy User"
        @users = [build_stubbed(:user, slug: 'my-friendly-id', display_profile: true)]
        expect(@project).to receive(:members).and_return @users
        event_instances = double('event_instances')
        ordered_event_instances = double('ordered_event_instances')
        expect(EventInstance).to receive(:where).with(project_id: @project.id).and_return(event_instances)
        expect(event_instances).to receive(:order).with(created_at: :desc).and_return(ordered_event_instances)
        expect(event_instances).to receive(:count).and_return('count')
        expect(ordered_event_instances).to receive(:limit).with(25).and_return('videos')
        project = Object.new
        iteration = Object.new
        iteration.stub(stories: "stories")
        project.stub(current_iteration: iteration)
        allow(PivotalAPI::Project).to receive(:retrieve).and_return(project)
      end

      it 'assigns the requested project as @project' 


      it 'renders the show template' 


      it 'assigns the list of members with public profiles to @members' 


      it 'assigns the list of related YouTube videos in created_at descending order' 


      it 'assigns the count of related YouTube videos' 


      it 'assigns the list of related PivotalTracker stories' 

    end

    describe '#new' do
      it 'should render a new project page' 

    end

    describe '#create' do
      before(:each) do
        @params = {
            project: {
                id: 1,
                title: 'Title 1',
                description: 'Description 1',
                status: 'Status 1'
            }
        }
        @project = mock_model(Project, friendly_id: 'some-project')
        allow(Project).to receive(:new).and_return(@project)
        allow(controller).to receive(:current_user).and_return(@user)
        allow(@project).to receive(:create_activity)

      end

      it 'assigns a newly created project as @project' 


      context 'successful save' do
        before(:each) do
          allow(@project).to receive(:save).and_return(true)
          post :create, params: @params
        end
        it 'redirects to index' 


        it 'received :create_activity with :create' 


        it 'assigns successful message' 


        it 'passes current_user id into new' 

      end

      context 'unsuccessful save' do
        it 'renders new template' 


        it 'assigns failure message' 

      end
    end

    describe '#edit' do
      before(:each) do
        @project = Project.new
        Project.stub_chain(:friendly, :find).with(an_instance_of(String)).and_return(@project)
        get :edit, params: { id: 'some-random-thing' }
      end

      it 'renders the edit template' 


      it 'assigns the requested project as @project' 

    end

    #  Scenarios for DESTROY action commented out until this functionality is needed
    #describe '#destroy' do
    #  before :each do
    #    @project = double(Project)
    #    Project.stub(:find).and_return(@project)
    #  end
    #  it 'receives destroy call' do
    #    expect(@project).to receive(:destroy)
    #    delete :destroy, id: 'test'
    #  end
    #
    #  context 'on successful delete' do
    #    before(:each) do
    #      @project.stub(:destroy).and_return(true)
    #      delete :destroy, id: 'test'
    #    end
    #    it 'redirects to index' do
    #      expect(response).to redirect_to(projects_path)
    #    end
    #    it 'shows the correct message' do
    #      expect(flash[:notice]).to eq 'Project was successfully deleted.'
    #    end
    #  end
    #
    #  context 'on unsuccessful delete' do
    #    before do
    #      @project.stub(:destroy).and_return(false)
    #      delete :destroy, id: 'test'
    #    end
    #    it 'redirects to index' do
    #      expect(response).to redirect_to(projects_path)
    #    end
    #    it 'shows the correct message' do
    #      expect(flash[:notice]).to eq 'Project was not successfully deleted.'
    #    end
    #  end
    #end

    describe '#update' do
      before(:each) do
        @project = FactoryBot.create(:project)
        allow(@project).to receive(:create_activity)
        Project.stub_chain(:friendly, :find).with(an_instance_of(String)).and_return(@project)
      end

      it 'assigns the requested project as @project' 


      context 'successful update' do
        before(:each) do
          allow(@project).to receive(:update_attributes).and_return(true)
          put :update, params: { id: 'update', project: {title: ''} }
        end

        it 'received :create_activity with :update' 


        it 'redirects to the project' 


        it 'shows a success message' 

      end

      context 'unsuccessful save' do
        before(:each) do
          allow(@project).to receive(:update_attributes).and_return(false)
          put :update, params: { id: 'update', project: {title: ''} }
        end
        it 'renders edit' 


        it 'shows an unsuccessful message' 

      end
    end
  end
end

