require 'spec_helper'

describe ProjectsController do
  describe 'Filters' do
    context 'When the logged user is an admin' do
      before :each do
        sign_in_admin
        @project = Project.make(:company => @logged_user.company)
      end

      it 'should be authorized to list all the projects' 


      it 'should be authized to access edit a project' 


      it 'should be authorized to update a project' 


      it 'should be authorized to delete a project' 

    end

    context 'When the logged user is not an admin' do
      before :each do
        sign_in_normal_user
      end

      it 'should be able to list all projects' 


      it 'should be able to list all completed projects' 


      it 'should be able to create a new project' 


      it 'should be able to create a new project instance' 

    end
  end

  describe "GET 'index'" do
    before :each do
      sign_in_admin
    end

    it 'should be successful' 


    it 'should render the right template' 

  end

  describe "GET 'new'" do
    before :each do
      sign_in_admin
    end

    it 'should be successful' 


    it 'should render the right template' 

  end

  describe "PUT 'update'" do
    before :each do
      sign_in_admin
    end

    context 'When using valid params' do
      context 'When the work sheet needs to be updated' do
        before :each do
          @project = Project.make(:company => @logged_user.company)
          @project_attrs = Project.make(:company => @logged_user.company).attributes
          @work_log = WorkLog.make(:project => @project)
        end

        it 'should update the Work Sheet accordantly' 

      end

      context 'When the Work sheet does not need to be updated' do
        before :each do
          @project = Project.make(:company => @logged_user.company)
          @project_attrs = Project
                               .make(:company => @logged_user.company, :customer => @project.customer)
                               .attributes
          @work_log = WorkLog.make(:project => @project)
        end

        it 'should not update the Work Sheet' 

      end
    end
  end

  describe 'Create Project without customer' do
    before :each do
      sign_in_normal_user({:company_id => 1})
    end

    it 'should create and assign new project to first customer' 

  end
end

