# frozen_string_literal: true

require 'rails_helper'

describe SettingsController do
  describe '#index' do
    it 'renders for super admins' 


    %i[admin instructor user].each do |role|
      it "redirects for role of #{role}" 

    end
  end

  describe '#all_admins' do
    before do
      # create an admin and super admin
      create(:user)
      create(:admin)
      @super_admin = create(:super_admin)
    end

    context 'when request is json' do
      before do
        allow(controller).to receive(:current_user).and_return(@super_admin)
        get :all_admins, format: :json
      end

      it 'returns all admin users' 


      it 'returns 200 ok' 

    end

    context 'when request is not json' do
      before do
        allow(controller).to receive(:current_user).and_return(@super_admin)
        get :all_admins
      end

      it 'returns 404' 

    end

    context 'when the user is not permitted' do
      before do
        allow(controller).to receive(:current_user).and_return(create(:user, username: 'reg_user'))
        get :all_admins, format: :json
      end

      it 'denies access' 

    end
  end

  describe '#upgrade_admin' do
    before do
      super_admin = create(:super_admin)
      allow(controller).to receive(:current_user).and_return(super_admin)
      @action = :upgrade_admin
      @format_type = :json
    end

    let(:post_params) do
      params = { user: { username: @user.username } }
      post @action, params: params, format: @format_type
    end

    context 'user is not an admin' do
      before do
        @user = create(:user)
        post_params
      end

      it 'turns user into admin' 


      it 'returns http 200' 


      it 'returns the right message' 

    end

    context 'user is already an admin' do
      before do
        @user = create(:admin)
        post_params
      end

      it 'user remains admin' 


      it 'returns http 422' 


      it 'returns the right message' 

    end

    context 'when the user does not exist' do
      before do
        @user = build(:user)
        post_params
      end

      it 'returns a 404' 

    end
  end

  describe '#downgrade_admin' do
    before do
      @action = :downgrade_admin
      @format_type = :json
      super_admin = create(:super_admin)
      allow(controller).to receive(:current_user).and_return(super_admin)
    end

    let(:post_params) do
      params = { user: { username: @user.username } }
      post @action, params: params, format: @format_type
    end

    context 'user is an admin' do
      before do
        @user = create(:admin)
        post_params
      end

      it 'turns admin into instructor' 


      it 'returns http 200' 


      it 'returns the right message' 

    end

    context 'user is already an instructor' do
      before do
        @user = create(:instructor)
        post_params
      end

      it 'user remains instructor' 


      it 'returns http 422' 


      it 'returns the right message' 

    end

    context 'user is super_admin' do
      before do
        @user = create(:super_admin, username: 'tryandrevokeme')
        post_params
      end

      it 'disallows revocation' 


      it 'returns http 422' 


      it 'returns the right message' 

    end

    context 'request is not json' do
      before do
        @format_type = :html
      end
    end
  end
end

