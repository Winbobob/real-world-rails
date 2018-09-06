require 'spec_helper'

describe TimeTypesController do
  render_views

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed-in users' do
    before do
      test_sign_in FactoryGirl.create(:admin)
    end

    describe 'GET "index"' do
      it 'populates an array of time types' 


      it 'renders the :index template' 

    end

    describe 'GET "new"' do
      it 'assigns a new time type to @time_type' 


      it 'renders the :new template' 

    end

    describe 'GET "edit"' do
      before do
        @time_type = TEST_TIME_TYPES[:work]
      end

      it 'assigns the to-be edited time type to @time_type' 


      it 'renders the :edit template' 

    end

    describe 'PUT "update"' do
      before do
        @time_type = FactoryGirl.create(:time_type, name: 'Work')
      end

      context 'with valid attributes' do
        it 'changes @time_type\'s attributes' 


        it 'redirects to the updated time type' 

      end

      context 'with invalid attributes' do
        it 're-renders the :edit template' 

      end
    end

    describe 'POST "create"' do
      context 'with valid attributes' do
        it 'creates a new time type' 


        it 'redirects to the new time type' 

      end

      context 'with invalid attributes' do
        it 'does not save the new time type' 


        it 're-renders the :new template' 

      end
    end

    describe 'DELETE "destroy"' do
      before do
        @time_type = FactoryGirl.create(:time_type)
      end

      it 'deletes the entry' 


      it 'redirects to the overview' 

    end
  end
end

