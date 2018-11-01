# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:instance) { Instance.default }

  with_tenant(:instance) do
    let!(:user) { create(:user) }

    describe '#show' do
      before { sign_in(user) }
      subject { get :show, params: { id: user_id } }

      context 'When user is system user' do
        let(:user_id) { User::SYSTEM_USER_ID }
        it 'returns the 404 page' 

      end

      context 'When user is deleted user' do
        let(:user_id) { User::DELETED_USER_ID }
        it 'returns the 404 page' 

      end
    end
  end
end

