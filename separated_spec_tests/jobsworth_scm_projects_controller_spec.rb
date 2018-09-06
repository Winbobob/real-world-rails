require 'spec_helper'

describe ScmProjectsController do

  before(:each) do
    @scm_project= mock_model(ScmProject)
  end

  describe "GET 'new'" do
    it 'should render new template' 


    it 'should redirect to last url, if user not have create project permission' 

  end

  describe "POST 'create'" do

    context 'user with admin permission' do
      let(:scm_params) { {'scm_type' => 'github', 'location' => 'https://github.com/user/rep'} }

      before(:each) do
        sign_in_admin
      end

      context 'with valiad params' do
        before(:each) do
          @scm_project = mock_model(ScmProject, {:save => true})
          expect(@scm_project).to receive('company=').with(@logged_user.company)

          expect(ScmProject).to receive(:new).
              with(scm_params).
              and_return(@scm_project)
        end

        it 'should redirect to show action' 

      end

      context 'with invalid params' do

        before(:each) do
          @scm_project = mock_model(ScmProject, {:save => false})
          expect(@scm_project).to receive('company=').with(@logged_user.company)

          expect(ScmProject).to receive(:new).
              with(scm_params).
              and_return(@scm_project)
        end

        it 'should render new template' 

      end
    end

    context 'user without admin permission' do

      before(:each) do
        sign_in_normal_user
      end

      it 'should redirect to last' 


      it 'should not create scm project' 

    end
  end
end

