# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe UsersController, :type => :controller do
  include_context :gon
  include PostsHelper

  before do
    @user = alice
    sign_in @user, scope: :user
    allow(@controller).to receive(:current_user).and_return(@user)
  end

  describe '#export_profile' do
    it 'queues an export job' 

  end

  describe "#download_profile" do
    it "downloads a user's export file" 

  end

  describe '#export_photos' do
    it 'queues an export photos job' 

  end

  describe '#download_photos' do
    it "redirects to user's photos zip file"  do
      @user.perform_export_photos!
      get :download_photos
      expect(response).to redirect_to(@user.exported_photos_file.url)
    end
  end

  describe '#public' do
    context "entry xml contents" do
      before do
        @sm = FactoryGirl.create(
          :status_message,
          public: true,
          author: @user.person,
          text:   "Go to http://diasporafoundation.org/ now!"
        )
      end

      it "contains the text" 


      it "contains the title" 


      it "contains the author" 


      it "contains the original author for reshares" 

    end

    it 'includes reshares in the atom feed' 


    it 'do not show reshares in atom feed if origin post is deleted' 


    it 'redirects to a profile page if html is requested' 


    it 'redirects to a profile page if mobile is requested' 

  end

  describe '#update' do
    before do
      @params  = { :id => @user.id,
                  :user => { :diaspora_handle => "notreal@stuff.com" } }
    end

    it "doesn't overwrite random attributes" 


    it 'renders the user edit page' 


    describe 'password updates' do
      let(:password_params) do
        {:current_password => 'bluepin7',
         :password => "foobaz",
         :password_confirmation => "foobaz"}
      end

      let(:params) do
        {id: @user.id, user: password_params, change_password: 'Change Password'}
      end

      it "uses devise's update with password" 

    end

    describe 'language' do
      it "allows the user to change their language" 

    end

    describe "color_theme" do
      it "allows the user to change their color theme" 

    end

    describe 'email' do
      it "disallows the user to change their new (unconfirmed) mail when it is the same as the old" 


      it "allows the user to change their (unconfirmed) email" 


      it 'informs the user about success' 


      it 'informs the user about failure' 


      it "allow the user to change their (unconfirmed) email to blank (= abort confirmation)" 


      it 'sends out activation email on success' 


      it "saves unconfirmed_email when podmail is disabled" 

    end

    describe "email settings" do
      UserPreference::VALID_EMAIL_TYPES.each do |email_type|
        context "for #{email_type}" do
          it "lets the user turn off mail" 


          it "lets the user get mail again" 

        end
      end
    end

    describe 'getting started' do
      it 'can be reenabled' 

    end
  end

  describe '#privacy_settings' do
    it "returns a 200" 

  end

  describe '#edit' do
    it "returns a 200" 


    it 'displays community spotlight checkbox' 


    it 'hides community spotlight checkbox' 


    it 'set @email_pref to false when there is a user pref' 


    it "does not allow token auth" 

  end

  describe '#destroy' do
    it 'does nothing if the password does not match' 


    it 'closes the account' 


    it 'enqueues a delete job' 

  end

  describe '#confirm_email' do
    before do
      @user.update_attribute(:unconfirmed_email, 'my@newemail.com')
    end

    it 'redirects to to the user edit page' 


    it 'confirms email' 


    it 'does NOT confirm email with wrong token' 

  end

  describe 'getting_started' do
    it 'does not fail miserably' 


    it 'does not fail miserably on mobile' 


    context "with inviter" do
      it "preloads data using gon for the aspect memberships dropdown when sharing with the inviter" 


      it "preloads data using gon for the aspect memberships dropdown when not sharing with the inviter" 

    end
  end
end

