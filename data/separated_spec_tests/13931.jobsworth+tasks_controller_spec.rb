require 'spec_helper'

describe TasksController do
  render_views

  describe "GET 'index'" do
    before :each do
      sign_in_normal_user
    end

    it 'should be successful' 


    it 'should render the right template' 


    it 'should be successful when the format requested is json' 


    it 'should render the right template when the format requested is json' 

  end

  describe "GET 'new'" do
    before :each do
      sign_in_normal_user
    end

    context 'When the logged user has projects' do
      before :each do
        @project = Project.make
        @logged_user.company.projects << @project
        @logged_user.projects << @project
        @logged_user.save
      end

      it 'should be redirected to task edit page' 

    end

    context "When the logged user doesn't has projects" do
      it "should redirect to the 'new' action on the Projects controller" 


      it 'should indicated the user that it need to create a new project' 

    end
  end

  describe "POST 'create'" do
    before :each do
      sign_in_normal_user
    end

    context 'When the user is not authorized to create a task in the selected project' do
      before :each do
        @project = Project.make
        @logged_user.projects << @project
        @logged_user.save
        @task_attrs = TaskRecord.make(:project => @project).attributes.with_indifferent_access.except(:id, :type)

        allow(controller.current_user).to receive(:can?).and_return(false)
      end

      it 'should not create a new Task instance' 


      it "should render the 'new' template" 


      it 'should indicate the user that the task could not be created' 

    end

    context 'When the user is authorized to create task under the selected project' do
      before :each do
        @project = Project.make
        @logged_user.projects << @project
        @logged_user.save
        @task_attrs = TaskRecord.make(:project => @project).attributes.with_indifferent_access.except(:id, :type)

        allow(controller).to receive('parse_time').and_return(10)
        allow(controller.current_user).to receive(:can?).and_return(true)
      end

      it 'should craete a new task instance' 


      it "should redirect to the 'index' action on the Tasks controller" 

    end
  end

  describe '#score' do
    context 'when the user is not signed in' do
      it 'should redirect to the sign_in page' 

    end

    context 'when the user is singed in, but using an invalid task_num' do
      before(:each) do
        sign_in_normal_user
      end

      it "should redirect to '#list'" 


      it 'should show an error message' 

    end

    context 'when the user is signed in, and using a valid task_num' do
      before(:each) do
        sign_in_normal_user
      end

      context 'when the task has some score rules' do
        before(:each) do
          project = Project.make
          @task = TaskRecord.make(:task_num => 123)
          @score_rule = ScoreRule.make

          project.score_rules << @score_rule
          project.tasks << @task
          ProjectPermission.create(:user => @logged_user, :company => @logged_user.company, :project => project)

          # As of right now, the only way to recalculate the score is by modifying the task
          @task.save(:validate => false)
        end

        it 'should be successful' 


        it 'should render the task score' 


        it 'should render the task score_adjustment' 


        it 'should render a table with all the score rules' 

      end
    end

  end

  describe 'update task' do
    context "when user is not admin has 'edit milestone' but not 'edit task' permission" do
      before(:each) do
        sign_in_normal_user
      end

      it 'should update milestone' 

    end
  end
end

