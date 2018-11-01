require 'rails_helper'

describe FeedbunchAuth::RegistrationsController, type: :controller do

  context 'POST create' do

    before :each do
      @user = FactoryBot.build :user

      # Necessary for Devise to be able to detect mappings during testing. Not sure why but these tests fail if this line
      # is removed
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    it 'returns redirect to signup success path' 


    it 'does not destroy confirmed user' 


  end

  context 'DELETE destroy' do

    before :each do
      @user = FactoryBot.create :user
      login_user_for_unit @user
    end

    it 'locks user and enqueues job to destroy it' 


    it 'does not lock user nor enqueue job if wrong password is submitted' 


    it 'redirects to root path' 


    it 'redirects to edit profile path if wrong password is submitted' 

  end

end

