# frozen_string_literal: true

require 'spec_helper'

# note, these tests are complex in order to test the admin security features
# -- namely, it was necessary to test two contexts for each method: the user
# being an admin, and not.
describe RequirementsController, type: :controller do
  before(:each) do
    mock_app_config
    @requirement = FactoryGirl.create(:requirement, contact_name: 'Adam Bray')
  end
  describe 'GET index' do
    context 'is admin' do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
        get :index
      end
      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template(:index) }
      it { is_expected.not_to set_flash }
      it 'should populate an array of all requirements' 

    end
    context 'not an admin' do
      it 'should redirect to root url if not an admin' 

    end
  end
  describe 'GET show' do
    context 'is an admin' do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
        get :show, params: { id: @requirement }
      end
      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template(:show) }
      it { is_expected.not_to set_flash }
      it 'should set @requirement to the selected requirement' 

    end
    context 'not an admin' do
      it 'should redirect to root url if not an admin' 

    end
  end
  describe 'GET new' do
    context 'is admin' do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
        get :new
      end
      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template(:new) }
      it { is_expected.not_to set_flash }
      it 'assigns a new requirement to @requirement' 

    end
    context 'not an admin' do
      it 'should redirect to root url if not an admin' 

    end
  end
  describe 'GET edit' do
    context 'is admin' do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
        get :edit, params: { id: @requirement }
      end
      it 'should set @requirement to the selected requirement' 

      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template(:edit) }
      it { is_expected.not_to set_flash }
    end
    context 'not admin' do
      it 'should redirect to root url if not an admin' 

    end
  end
  describe 'PUT update' do
    context 'is admin' do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
      end
      context 'with valid attributes' do
        before(:each) do
          attrs = FactoryGirl.attributes_for(:requirement,
                                             contact_name: 'John Doe')
          put :update, params: { id: @requirement, requirement: attrs }
        end
        it 'should set @requirement to the correct requirement' 

        it 'should update the attributes of @requirement' 

        it { is_expected.to redirect_to(@requirement) }
        it { is_expected.to set_flash }
      end
      context 'with invalid attributes' do
        before(:each) do
          attrs = FactoryGirl.attributes_for(:requirement, contact_name: '')
          put :update, params: { id: @requirement, requirement: attrs }
        end
        it 'should not update the attributes of @requirement' 

        it { is_expected.to render_template(:edit) }
        it { is_expected.not_to set_flash }
      end
    end
    context 'not admin' do
      it 'should redirect to root url if not an admin' 

    end
  end
  describe 'POST create' do
    context 'is admin' do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
      end
      context 'with valid attributes' do
        before(:each) do
          post :create,
               params: { requirement: FactoryGirl.attributes_for(:requirement) }
        end
        it 'saves a new requirement' 

        it { is_expected.to redirect_to(Requirement.last) }
        it { is_expected.to set_flash }
      end
      context 'with invalid attributes' do
        before(:each) do
          attrs = FactoryGirl.attributes_for(:requirement, contact_name: nil)
          post :create, params: { requirement: attrs }
        end
        it 'fails to save a new requirment' 

        it { is_expected.not_to set_flash }
        it { is_expected.to render_template(:new) }
      end
    end
    context 'not admin' do
      it 'should redirect to root url if not an admin' 

    end
  end
  describe 'DELETE destroy' do
    context 'is admin' do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
      end
      it 'assigns the selected requirement to @requirement' 

      it 'removes @requirement from the database' 

      it 'should redirect to the requirements index page' 

    end
    context 'not admin' do
      it 'should redirect to root url if not an admin' 

    end
  end
end

