require 'spec_helper'

describe AdjustmentsController do
  render_views

  let(:adjustment) { FactoryGirl.create(:adjustment) }
  let(:time_type) { TEST_TIME_TYPES[:work] }
  let(:admin) { FactoryGirl.create(:admin) }

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed-in users' do
    context 'as admin' do
      before do
        test_sign_in admin
      end

      describe 'GET "new"' do
        it 'assigns a new adjustment to @adjustment' 


        it 'renders the :new template' 

      end

      describe 'GET "index"' do
        it 'assigns the adjustments to to @adjustments' 


        it 'renders the :index template' 

      end

      describe 'GET "edit"' do
        it 'assigns the to-be edited adjustment to @adjustment' 


        it 'renders the :edit template' 

      end

      describe 'PUT "update"' do
        context 'with valid attributes' do
          it 'changes adjustment\'s attributes' 


          it 'redirects to the overview' 

        end

        context 'with invalid attributes' do
          it 'does not change adjustment\'s attributes' 


          it 're-renders the :edit template' 

        end
      end

      describe 'POST "create"' do
        context 'with valid attributes' do
          it 'creates a new adjustment' 


          it 'redirects to the overview' 

        end

        context 'with invalid attributes' do
          it 'does not save the new adjustment' 


          it 're-renders the :new template' 

        end
      end


      describe 'DELETE "destroy"' do
        it 'deletes the entry' 


        it 'redirects to the overview' 

      end
    end
  end
end

