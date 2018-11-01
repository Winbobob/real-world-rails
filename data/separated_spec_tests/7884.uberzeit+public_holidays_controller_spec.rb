require 'spec_helper'

describe PublicHolidaysController do
  render_views

  let(:public_holiday) { FactoryGirl.create(:public_holiday) }
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
        it 'assigns a new public holiday to @public_holiday' 


        it 'renders the :new template' 

      end

      describe 'GET "index"' do
        it 'assigns the public holidays to to @public_holidays' 


        it 'assigns the year to @year' 


        it 'renders the :index template' 

      end

      describe 'GET "edit"' do
        it 'assigns the to-be edited public holiday to @public_holiday' 


        it 'renders the :edit template' 

      end

      describe 'PUT "update"' do
        context 'with valid attributes' do
          it 'changes public_holiday\'s attributes' 


          it 'redirects to the overview' 

        end

        context 'with invalid attributes' do
          it 'does not change public_holiday\'s attributes' 


          it 're-renders the :edit template' 

        end
      end

      describe 'POST "create"' do
        context 'with valid attributes' do
          it 'creates a new public holiday' 


          it 'redirects to the overview' 

        end

        context 'with invalid attributes' do
          it 'does not save the new public holiday' 


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

