require_relative '../spec_helper'

describe PasswordChangeController do

  before(:each) do
    User.any_instance.stubs(:update_in_central).returns(true)
    PasswordChangeController.any_instance.stubs(:check_password_expired)
    @user = FactoryGirl.create(:user)
  end

  after(:each) do
    @user.destroy
  end

  let (:payload_wrong_old_password) do
    {
      username: @user.username,
      old_password: 'wrong',
      password: @user.password,
      password_confirmation: @user.password
    }
  end

  let (:payload_mismatch_new_password) do
    {
      username: @user.username,
      old_password: @user.password,
      password: 'password',
      password_confirmation: 'password123'
    }
  end

  let (:payload_ok) do
    {
      username: @user.username,
      old_password: @user.password,
      password: 'password123',
      password_confirmation: 'password123'
    }
  end

  let (:payload_password_not_changed) do
    {
      username: @user.username,
      old_password: @user.password,
      password: @user.password,
      password_confirmation: @user.password
    }
  end

  let (:payload_password_short) do
    {
      username: @user.username,
      old_password: @user.password,
      password: '123',
      password_confirmation: '123'
    }
  end

  describe('#update') do
    it 'show errors if old_password is wrong' 


    it 'show errors if new passwords mismatch' 


    it 'show errors if password is unchanged' 


    it 'show errors if password is too short' 


    it 'changes password and authenticate session' 

  end
end

