require 'spec_helper'

describe EmploymentsController do
  render_views

  let(:user) { FactoryGirl.create(:user) }
  let(:employment) { FactoryGirl.create(:employment, user: user) }
  let(:admin) do
    FactoryGirl.create(:user).tap { |user| user.add_role(:admin) }
  end

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed-in users' do
    # context 'as owner' do
    #   before do
    #     test_sign_in user
    #   end

    #   describe 'GET "index"' do
    #     it 'populates an array of employments' do
    #       get :index, user_id: user.id
    #       assigns(:employments).should eq(user.employments.to_a)
    #     end

    #     it 'renders the :index template' do
    #       get :index, user_id: user.id
    #       response.should render_template :index
    #     end
    #   end
    # end

    context 'as admin' do
      before do
        test_sign_in admin
      end

      describe 'GET "new"' do
        it 'assigns a new employment to @employment' 


        it 'renders the :new template' 

      end

      describe 'GET "edit"' do
        it 'assigns the to-be edited employment to @employment' 


        it 'renders the :edit template' 

      end

      describe 'GET "index"' do
        it 'assigns the to-be edited employment to @employment' 


        it 'renders the :edit template' 

      end

      describe 'PUT "update"' do
        before do
          @employment = FactoryGirl.create(:employment, start_date: '2006-05-05', end_date: '2007-05-05')
        end

        context 'with valid attributes' do
          it 'changes @employment\'s attributes' 


          it 'redirects to the updated employment' 

        end

        context 'with invalid attributes' do
          it 'does not change @employment\'s attributes' 


          it 're-renders the :edit template' 

        end
      end

      describe 'POST "create"' do
        before do
          @user = FactoryGirl.create(:user)
        end

        context 'with valid attributes' do
          it 'creates a new employment' 


          it 'redirects to the new employment' 

        end

        context 'with invalid attributes' do
          it 'does not save the new employment' 


          it 're-renders the :new template' 

        end
      end


      describe 'DELETE "destroy"' do
        before do
          FactoryGirl.create(:employment) # create another because we can't delete the last one
          @employment = FactoryGirl.create(:employment)
        end

        it 'deletes the entry' 


        it 'redirects to the overview' 

      end
    end
  end
end

