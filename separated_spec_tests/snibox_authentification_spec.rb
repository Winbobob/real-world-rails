require 'rails_helper'

describe 'Authentication', js: true do
  before do
    ENV.delete('DEMO') if ENV['DEMO'].present?
  end

  it 'show login page for anon user' 


  context 'user not exist' do
    it 'allow user to view sign up page' 


    it 'user able to sign up' 


    it 'unable to reset password for unregistered email' 

  end

  describe 'user exist' do
    it 'not allow new users to view sign up page' 


    it 'able to login' 


    it 'able to reset password for registered email' 

  end
end

