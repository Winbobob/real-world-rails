require 'spec_helper'

describe ConfigurationsController do
  render_views

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed in users' do
    before do
      test_sign_in FactoryGirl.create(:user)
    end

    it 'denies access' 

  end

  context 'for signed in admins' do
    before do
      test_sign_in FactoryGirl.create(:admin)
    end

    describe 'GET "edit"' do
      it 'renders the edit template' 

    end

    describe 'PUT "update"' do
      it 'changes the settings' 


      context 'if work_per_day_hours does not change' do
        it 'does not flush the cache' 

      end

      context 'if work_per_day_hours changes' do
        it 'flushes the cache' 

      end
    end
  end
end

