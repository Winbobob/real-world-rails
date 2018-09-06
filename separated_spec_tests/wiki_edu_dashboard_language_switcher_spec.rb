# frozen_string_literal: true
require 'rails_helper'

describe 'language_switcher', type: :feature, js: true do
  context 'user logged out' do
    it 'should default to English' 


    it 'should switch to another language using URL param' 

  end

  context 'user logged in' do
    before(:each) do
      page.driver.restart if defined?(page.driver.restart)
      @user = create(:user)
      login_as(@user, scope: :user)
      page.current_window.resize_to(3000, 1080) # Workaround for PhantomJS layout bug
    end

    it 'should default to English' 


    it 'should switch to another language using user model' 


    it 'should use URL parameter first, if set' 

  end
end

