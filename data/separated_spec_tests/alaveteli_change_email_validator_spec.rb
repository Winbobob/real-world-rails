# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

def validator_with_user_and_params(user, params = {})
  validator = ChangeEmailValidator.new(params)
  validator.logged_in_user = user
  validator
end

describe ChangeEmailValidator do

  let(:user) { FactoryGirl.create(:user) }

  describe '#old_email' do

    it 'must have an old email' 


    it 'must be a valid email' 


    it 'must have the same email as the logged in user' 


  end

  describe '#new_email' do

    it 'must have a new email' 


    it 'must be a valid email' 


  end

  describe '#password' do

    it 'password_and_format_of_email validation fails when password is nil' 


    it 'does not require a password if changing email' 


    it 'must have a password if not changing email' 


    it 'must be the correct password' 


  end

end

