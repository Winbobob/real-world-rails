require 'spec_helper'

describe ApplicationController, :type => :controller do

  let(:user_full_name) { 'Bill Clinton' }
  let(:user) { User.new(:full_name => user_full_name) }
  let(:session) { double('session', :user => user) }

  before :each do
    controller.session[:last_access_time] = Clock.now.rfc2822
  end

  describe 'current_user_full_name' do
    it 'should return the user full name from the session' 

  end

  describe 'session expiry' do
    it 'should extend session lifetime' 

  end

  describe 'locale' do
    it 'should be set to default' 


    it 'should be change the locale' 


    context "when hasn't translations to locale" do
      before :each do
        user = double('user', :locale => :ar)
        session = double('session', :user => user)
        allow(controller).to receive(:current_session).and_return(session)
      end

      xit 'should set be set to default' do

      end
    end
  end

  describe 'current_user' do
    it 'should be set to default' 

  end

  describe 'user' do
    it 'should return me the current logged in user' 

  end

  describe '#encrypt_exported_files' do
    before :each do
      controller.params[:password] = 'test_password'
    end

    it 'should send encrypted zip with one file' 


    it 'should send encrypted zip with multiple files' 


    it 'should send proper filename to the browser' 

  end

end

