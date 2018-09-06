require 'spec_helper'

describe RegistrationsController do
  describe 'POST create' do
    context 'successful save' do
      before(:each) do
        request.env['devise.mapping'] = Devise.mappings[:user]
        post :create, params: { user: {email: 'random@random.com', password: 'randomrandom', password_confirmation: 'randomrandom'} }
      end

      it 'redirects to index' 


      it 'assigns successful message' 


      it 'should send an welcome massage to new user' 

    end

    context 'unsuccessful save' do
      before(:each) do
        request.env['devise.mapping'] = Devise.mappings[:user]
        ActionMailer::Base.deliveries.clear
      end

      it 'does not email upon failure to register' 


      it 'sets omniauth session to nil' 

    end
    
    context 'deactivated user' do
      before(:each) do
        @user = double('user', id: 1, friendly_id: 'some-id')
        request.env['devise.mapping'] = Devise.mappings[:user]
        expect(controller).to receive(:deactivated_user_with_email).with('random@random.com').and_return(@user)
      end
      
      it "should show user deactivated message and redirect_to root_path" 

      
    end
  end

  describe '#update' do
    let(:valid_session) { {} }

    before(:each) do
      # stubbing out devise methods to simulate authenticated user
      @user = double('user', id: 1, friendly_id: 'some-id')
      request.env['warden'].stub :authenticate! => @user
      controller.stub :current_user => @user

      request.env['devise.mapping'] = Devise.mappings[:user]
      User.stub_chain(:friendly, :find).with(an_instance_of(String)).and_return(@user)
      @user.stub(:skill_list=)
    end

    it 'renders edit on preview' 


    it 'assigns the requested project as @project' 


    context 'successful update' do
      before(:each) do
        @user.stub(:update_attributes).and_return(true)
        put :update, params: { id: 'some-id', user: {display_hire_me: true} }
      end

      it 'redirects to the user show page' 


      it 'shows a success message' 

    end

    context 'unsuccessful update' do
      before(:each) do
        @user.stub(:update_attributes).and_return(false)
        put :update, params: { id: 'some-id', user: {email: ''} }
      end
      it 'renders edit' 


      # How to test this
      it 'shows an unsuccessful message' 

    end
  end
end

