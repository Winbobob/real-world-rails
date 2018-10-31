require 'spec_helper'

describe ProjectsController do

  let(:project) { FactoryGirl.create(:project) }
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


      it 'assigns the available projects grouped by customer' 

    end

    describe 'POST "create"' do
      context 'with valid attributes' do
        it 'creates a new project' 


        it 'redirects to the overview' 

      end

      context 'with invalid attributes' do
        it 'does not save the new project' 


        it 're-renders the :new template' 

      end
    end

    describe 'GET "edit"' do
      it 'assigns the to-be edited project to @project' 


      it 'renders the :edit template' 

    end

    describe 'PUT "update"' do
      context 'with valid attributes' do
        it 'changes project\'s attributes' 


        it 'redirects to the overview' 

      end

      context 'with invalid attributes' do
        it 'does not change project\'s attributes' 


        it 're-renders the :edit template' 

      end
    end

    describe 'DELETE "destroy"' do
      it 'deletes the entry' 


      it 'redirects to the overview' 

    end
  end

end

