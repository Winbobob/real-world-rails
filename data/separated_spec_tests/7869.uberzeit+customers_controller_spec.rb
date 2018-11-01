require 'spec_helper'

describe CustomersController do
  render_views

  let!(:admin) { FactoryGirl.create(:admin) }
  let(:valid_customer_attributes) { { name: 'Nine Internet Solutions AG', abbreviation: 'nine.ch', number: 9999 } }
  let!(:customer) { FactoryGirl.create :customer }

  context 'for non-signed in users' do
    describe 'GET "index"' do
      it 'redirects to login' 

    end

    describe 'GET "edit"' do
      it 'redirects to login' 

    end

    describe 'GET "new"' do
      it 'redirects to login' 

    end

    describe 'POST "create"' do
      context 'with valid attributes' do
        it 'redirects to login' 


        it 'does create a customer' 

      end
    end

    describe 'PUT "update"' do
      context 'with valid attributes' do
        it 'redirects to login' 


        it 'does not change any attributes' 

      end
    end

    describe 'DELETE "destroy"' do
      it 'redirects to login' 


      it 'does not delete the customer' 

    end
  end

  context 'for signed-in admins' do
    before do
      test_sign_in admin
    end

    describe 'GET "edit"' do
      it 'assigns the to-be edited customer to @customer' 


      it 'renders the :edit template' 

    end

    describe 'GET "index"' do
      it 'assigns the customers to @customers' 


      it 'renders the :index template' 

    end

    describe 'GET "new"' do
      it 'assigns the to-be edited customer to @customer' 


      it 'renders the :new template' 

    end

    describe 'PUT "update"' do
      context 'with valid attributes' do
        it 'changes customer\'s attributes' 


        it 'redirects to the overview' 

      end

      context 'with invalid attributes' do
        it 'does not change customer\'s attributes' 


        it 're-renders the :edit template' 

      end
    end

    describe 'POST "create"' do
      context 'with valid attributes' do
        it 'creates a customer' 


        it 'redirects to the overview' 

      end

      context 'with invalid attributes' do
        it 'does not create a customer' 


        it 're-renders the :edit template' 

      end
    end

    describe 'DELETE "destroy"' do
      it 'does delete a customer' 


      it 'does delete the customer' 

    end

  end
end

