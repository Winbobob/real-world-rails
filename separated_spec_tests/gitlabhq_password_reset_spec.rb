require 'spec_helper'

feature 'Password reset' do
  describe 'throttling' do
    it 'sends reset instructions when not previously sent' 


    it 'sends reset instructions when previously sent more than a minute ago' 


    it 'throttles multiple resets in a short timespan' 

  end

  describe 'Changing password while logged in' do
    it 'updates the password' 

  end

  def forgot_password(user)
    visit root_path
    click_on 'Forgot your password?'
    fill_in 'Email', with: user.email
    click_button 'Reset password'
    user.reload
  end
end

