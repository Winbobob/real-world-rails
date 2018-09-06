# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:super_admin) { create(:super_admin) }
  let(:course) { create(:course) }

  controller do
    def index
      head 200
    end
  end

  describe '#new_session_path' do
    it 'returns the sign in path' 

  end

  describe 'invalid authenticity tokens' do
    it 'returns an html 401' 

    it 'returns a json 401' 

  end

  describe '#require_permissions' do
    controller do
      def index
        require_permissions
        head 200
      end
    end

    context 'when user lacks permissions' do
      it 'returns an html 401' 


      it 'returns a json 401' 

    end
  end

  describe '#require_participating_user' do
    controller do
      def index
        require_participating_user
        head 200
      end
    end

    context 'when user is not enrolled' do
      it 'returns an html 401' 


      it 'returns a json 401' 

    end
  end

  describe '#require_admin_permissions' do
    controller do
      def index
        require_admin_permissions
        head 200
      end
    end

    context 'when user is not an admin' do
      it 'returns an html 401' 


      it 'returns a json 401' 

    end

    context 'when user is an admin' do
      it 'does not return a 401' 

    end

    context 'when user is a super_admin' do
      it 'does not return a 401' 

    end
  end

  describe '#require_super_admin_permissions' do
    controller do
      def index
        require_super_admin_permissions
        head 200
      end
    end

    context 'when user is < admin' do
      it 'returns an html 401' 


      it 'returns a json 401' 


      it 'returns custom error message' 

    end

    context 'when user is an admin' do
      it 'returns an html 401' 


      it 'returns a json 401' 

    end

    context 'when user is a super_admin' do
      it 'does not return a 401' 

    end
  end

  describe '#require_signed_in' do
    controller do
      def index
        require_signed_in
        head 200
      end
    end

    context 'when user is not signed in' do
      it 'returns an html 401' 

      it 'returns a json 401' 

    end

    context 'when user is signed in' do
      it 'returns a 200' 

    end
  end

  describe '#set_locale' do
    let(:user) { create(:user, locale: 'zh-hans') }

    def index
      render nothing: true
    end

    it 'sets the locale from user preference' 


    it 'sets the locale from a param' 


    it 'falls back to a default if locale is not available' 

  end
end

