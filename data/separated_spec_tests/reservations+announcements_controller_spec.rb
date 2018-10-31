# frozen_string_literal: true

require 'spec_helper'

shared_examples_for 'page success' do
  it { is_expected.to respond_with(:success) }
  it { is_expected.not_to set_flash }
end

shared_examples_for 'access denied' do
  it { is_expected.to redirect_to(root_url) }
  it { is_expected.to set_flash }
end

describe AnnouncementsController, type: :controller do
  before(:each) { mock_app_config }

  describe 'with admin' do
    before do
      sign_in FactoryGirl.create(:admin)
    end
    context 'GET index' do
      before do
        get :index
      end
      it_behaves_like 'page success'
      it { is_expected.to render_template(:index) }
      it 'should assign @announcements to all Announcements' 

    end
    context 'GET new' do
      before do
        get :new
      end
      it 'sets the default announcement' 

      it_behaves_like 'page success'
      it { is_expected.to render_template(:new) }
    end
    context 'GET edit' do
      before do
        get :edit, params: { id: FactoryGirl.create(:announcement) }
      end
      it_behaves_like 'page success'
      it { is_expected.to render_template(:edit) }
    end
    context 'POST create' do
      context 'with correct params' do
        before do
          @attributes = FactoryGirl.attributes_for(:announcement)
          post :create, params: { announcement: @attributes }
        end
        it 'should create the new announcement' 

        it 'should pass the correct params' 

        it { is_expected.to redirect_to(announcements_path) }
        it { is_expected.to set_flash }
      end
      context 'with incorrect params' do
        before do
          @attributes = FactoryGirl.attributes_for(:announcement)
          @attributes[:ends_at] = Time.zone.today - 1.day
          post :create, params: { announcement: @attributes }
        end
        it { is_expected.to render_template(:new) }
      end
    end
    context 'PUT update' do
      before do
        @new_attributes = FactoryGirl.attributes_for(:announcement)
        @new_attributes[:message] = 'New Message!!'
        put :update, params: { id: FactoryGirl.create(:announcement),
                               announcement: @new_attributes }
      end
      it 'updates the announcement' 

    end
    context 'DELETE destroy' do
      before do
        delete :destroy, params: { id: FactoryGirl.create(:announcement) }
      end
      it 'should delete the announcement' 

      it { is_expected.to redirect_to(announcements_path) }
    end
  end
  context 'is not admin' do
    before do
      sign_in FactoryGirl.create(:user)
      @announcement = FactoryGirl.create(:announcement)
      @attributes = FactoryGirl.attributes_for(:announcement)
    end

    context 'GET index' do
      before do
        get :index
      end
      it_behaves_like 'access denied'
    end
    context 'POST create' do
      before do
        post :create, params: { announcement: @attributes }
      end
      it_behaves_like 'access denied'
    end
    context 'PUT update' do
      before do
        put :update, params: { id: @announcement }
      end
      it_behaves_like 'access denied'
    end
    context 'DELETE destroy' do
      before do
        delete :destroy, params: { id: @announcement }
      end
      it_behaves_like 'access denied'
    end
  end
  context 'GET hide as' do
    shared_examples 'can hide announcement' do
      before do
        @announcement = FactoryGirl.create(:announcement)
        request.env['HTTP_REFERER'] = 'where_i_came_from'
        get :hide, params: { id: @announcement }
      end
      it 'should set some cookie values' 

    end
    context 'superuser' do
      before do
        sign_in FactoryGirl.create(:superuser)
      end
      it_behaves_like 'can hide announcement'
    end
    context 'admin' do
      before do
        sign_in FactoryGirl.create(:admin)
      end
      it_behaves_like 'can hide announcement'
    end
    context 'patron' do
      before do
        sign_in FactoryGirl.create(:user)
      end
      it_behaves_like 'can hide announcement'
    end
    context 'checkout person' do
      before do
        sign_in FactoryGirl.create(:checkout_person)
      end
      it_behaves_like 'can hide announcement'
    end
    context 'guest' do
      before do
        sign_in FactoryGirl.create(:guest)
      end
      it_behaves_like 'can hide announcement'
    end
    context 'banned user' do
      before do
        sign_in FactoryGirl.create(:banned)
      end
      it_behaves_like 'can hide announcement'
    end
  end
end

