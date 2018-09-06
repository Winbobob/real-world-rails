require 'spec_helper'

describe CustomersController do
  render_views

  describe 'contact creation disabled in the app' do
    before :each do
      Setting.contact_creation_allowed = false
      sign_in_admin
    end

    context 'When trying to create a new customer' do
      before :each do
        @logged_user.update_column(:create_clients, false)
      end

      it 'should redirect to the root_path' 


      it 'should indicated the user that access is denied' 

    end

    context 'When trying to edit a customer' do
      before :each do
        @logged_user.update_column(:edit_clients, false)
        @customer = Customer.make(:company => @logged_user.company)
      end

      it 'should redirect to the root_path' 

    end
  end

  describe 'Filters' do
    context 'When the logged user is an admin' do
      before :each do
        Setting.contact_creation_allowed = true
        sign_in_admin
      end

      it 'should be able to view a single customer' 


      it 'should be able to create a new customer' 


      it 'should be able to edit a customer' 


      it 'should be able to delete a customer' 

    end

    context 'When the logged user is not and admin' do
      before :each do
        sign_in_normal_user(seen_welcome: 1)
      end

      context 'When trying to read customers and the user is not authorized to do so' do
        before :each do
          @logged_user.update_column(:read_clients, false)
        end
      end

      context 'When trying to read customers and the user is authorized to do so' do
        before :each do
          @logged_user.update_column(:read_clients, true)
        end
      end

      context 'When trying to create a new customer and the user is not authorized to do so' do
        before :each do
          @logged_user.update_column(:create_clients, false)
        end

        it 'should redirect to the root_path' 


        it 'should indicated the user that access is denied' 

      end

      context 'When trying to create a new customer and the user is authorized to do so' do
        before :each do
          @logged_user.update_column(:create_clients, true)
        end

        it 'should allow the access' 

      end

      context 'When trying to edit a customer and the user is not authorized to do so' do
        before :each do
          @logged_user.update_column(:edit_clients, false)
          @customer = Customer.make(:company => @logged_user.company)
        end

        it 'should redirect to the root_path' 


        it 'should indicated the user that access is denied' 

      end

      context 'When trying to edit a customer and the user is authorized to do so' do
        before :each do
          @logged_user.update_column(:edit_clients, true)
          @customer = Customer.make(:company => @logged_user.company)
        end

        it 'should allow the access' 

      end
    end
  end

  describe "GET 'show'" do
    context 'When the logged user is authorized' do
      before :each do
        Setting.contact_creation_allowed = true
        sign_in_admin
        allow(@logged_user).to receive(:read_clients?).and_return(true)
        @some_customer = Customer.make(:company => @logged_user.company)
      end

      it 'should be succesful' 


      it 'should render the right template' 

    end
  end

  describe "GET 'new'" do
    context 'When the logged user is authorized' do
      before :each do
        Setting.contact_creation_allowed = true
        sign_in_admin
        allow(@logged_user).to receive(:create_clients?).and_return(true)
      end

      it 'should be successful' 


      it 'should render the right template' 

    end
  end

  describe "POST 'create'" do
    context 'When the logged user is authorized' do
      before :each do
        Setting.contact_creation_allowed = true
        sign_in_admin
        allow(@logged_user).to receive(:create_clients?).and_return(true)
      end

      context 'When using valid attributes' do
        before :each do
          company_id = @logged_user.company_id
          @valid_attributes = {:name => 'Lol', :company_id => company_id}
        end

        it 'should be create a new customer instance' 


        it 'should notify the user that the customer was created' 


        it 'should redirect to the root' 

      end

      context 'When using invalid attributes' do
        before :each do
          company_id = @logged_user.company_id
          @invalid_attributes = {:name => '', :company_id => company_id}
        end

        it "should render the 'new' template" 

      end
    end
  end

  describe "GET 'edit'" do
    context 'When the logged user is authorized' do
      before :each do
        Setting.contact_creation_allowed = true
        sign_in_admin
        allow(@logged_user).to receive(:edit_clients?).and_return(true)
        @some_customer = Customer.make(:company => @logged_user.company)
      end

      it 'should be successful' 


      it 'should render the right template' 

    end
  end

  describe "PUT 'update'" do
    context 'When the logged user is authorized' do
      before :each do
        Setting.contact_creation_allowed = true
        sign_in_admin
        allow(@logged_user).to receive(:edit_clients?).and_return(true)
        @some_customer = Customer.make(:company => @logged_user.company)
      end

      context 'When using valid attributes' do
        before :each do
          @valid_attributes = {:name => 'new_name'}
        end

        it 'shoud update the customer record successfully' 


        it "should redirect to the 'edit' action" 


        it 'should tell the user that the customer was updated' 

      end

      context 'When using invalid attributes' do
        it "should render the 'edit' view" 

      end
    end
  end

  describe "DELETE 'destroy'" do
    context 'When the logged user is authorized' do
      before :each do
        Setting.contact_creation_allowed = true
        sign_in_admin
        allow(@logged_user).to receive(:edit_clients?).and_return(true)
        @some_customer = Customer.make(:company => @logged_user.company, :name => 'Juan')
      end

      context "When the customer doesn't have projects and it's not the internal_customer" do
        it 'should be able to delete the customer instance' 


        it 'should redirect to the root' 


        it 'should tell the user that the customer was deleted' 

      end

      context 'When the customer have projects' do
        before :each do
          @some_customer.projects << Project.make
        end

        it 'should not be able to delete the instance' 


        it "should tell the user that it can't delete the customer" 


        it 'should redirect to the root' 

      end

      context "When the customer it's the internal customer of the company" do
        before :each do
          @some_customer.name = @some_customer.company.name
          @some_customer.save
        end

        it 'should redirect to the root' 

      end
    end
  end

  describe "POST 'search'" do
    before :each do
      Setting.contact_creation_allowed = true
      sign_in_normal_user

      @customer_one = Customer.make(:name => 'Juan', :company => @logged_user.company)
      @customer_two = Customer.make(:name => 'Omar', :company => @logged_user.company)
    end

    it 'should fetch the right customers based on the provided search criteria' 

  end
end

