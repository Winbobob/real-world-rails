# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Devise::SessionsController, type: :controller do
  controller do
  end

  requires_login

  let(:instance) { Instance.default }

  with_tenant(:instance) do
    context 'Users with multiple email addresses' do
      describe 'Log in' do
        let(:password) { 'lolololol' }
        let(:user) { create(:user, emails_count: 2) }

        it 'allows users to log in with their primary email address' 


        it 'allows users to log in with their secondary email address' 

      end
    end
  end
end

