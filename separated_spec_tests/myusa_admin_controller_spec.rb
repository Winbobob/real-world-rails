require 'rails_helper'

describe AdminController do
  let(:user) { FactoryGirl.create(:admin_user) }

  describe '#index' do
    before :each do
      9.times { FactoryGirl.create(:application) }
      3.times { FactoryGirl.create(:application, :pending_approval) }

      sign_in :user, user
      sign_in :two_factor, user
    end

    context '.csv request' do
      before :each do 
        get :index, format: 'csv'
      end
      
      it 'returns a CSV string of applications' 

    end
    
    context '.json request' do
      before :each do 
        get :index, format: 'json'
      end
      
      it 'returns a JSON string of applications' 

    end

    context 'no params' do
      before :each do
        get :index
      end

      it 'is limited to 8 applications' 

    end

    context 'page 2' do
      before :each do
        get :index, page: 2
      end

      it 'gets the 2nd page' 

    end

    context 'filter by pending-approval' do
      before :each do
        get :index, filter: 'pending-approval'
      end

      it 'filters by applications pending approval' 

    end

    context 'search' do
      let(:search_term) { 'foobar' }

      before :each do
        get :index, search: search_term
      end

      context 'searching for application by name' do
        let!(:named_app) { FactoryGirl.create(:application, name: 'Named Test App') }
        let(:search_term) { 'Named Test App' }

        it 'finds app' 

      end

    end
  end
end

