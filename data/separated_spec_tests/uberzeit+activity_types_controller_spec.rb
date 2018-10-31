require 'spec_helper'

describe ActivityTypesController do

  let(:activity_type) { FactoryGirl.create(:activity_type) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:customer) { FactoryGirl.create(:customer) }

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed-in users' do
    before do
      test_sign_in admin
    end

    describe "GET 'index'" do
      it "returns http success" 


      it 'assigns the available activity_types' 

    end

    describe 'POST "create"' do
      context 'with valid attributes' do
        it 'creates a new activity_type' 


        it 'redirects to the overview' 

      end

      context 'with invalid attributes' do
        it 'does not save the new activity_type' 


        it 're-renders the :new template' 

      end
    end

    describe 'GET "edit"' do
      it 'assigns the to-be edited activity_type to @activity_type' 


      it 'renders the :edit template' 

    end

    describe 'PUT "update"' do
      context 'with valid attributes' do
        it 'changes activity_type\'s attributes' 


        it 'redirects to the overview' 

      end

      context 'with invalid attributes' do
        it 'does not change activity_type\'s attributes' 


        it 're-renders the :edit template' 

      end
    end

    describe 'DELETE "destroy"' do
      it 'deletes the entry' 


      it 'redirects to the overview' 

    end
  end

end

