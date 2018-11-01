require 'rails_helper'

describe FinishInstallationController do

  describe '#index' do
    context "has_login_hint is false" do
      before do
        SiteSetting.has_login_hint = false
      end

      it "doesn't allow access" 

    end

    context "has_login_hint is true" do
      before do
        SiteSetting.has_login_hint = true
      end

      it "allows access" 

    end
  end

  describe '#register' do
    context "has_login_hint is false" do
      before do
        SiteSetting.has_login_hint = false
      end

      it "doesn't allow access" 

    end

    context "has_login_hint is true" do
      before do
        SiteSetting.has_login_hint = true
        GlobalSetting.stubs(:developer_emails).returns("robin@example.com")
      end

      it "allows access" 


      it "raises an error when the email is not in the allowed list" 


      it "doesn't redirect when fields are wrong" 


      context "working params" do
        let(:params) do
          {
            email: 'robin@example.com',
            username: 'eviltrout',
            password: 'disismypasswordokay'
          }
        end

        it "registers the admin when the email is in the list" 


        it "automatically resends the signup email when the user already exists" 

      end

      it "sets the admins trust level" 

    end
  end

  describe '#confirm_email' do
    context "has_login_hint is false" do
      before do
        SiteSetting.has_login_hint = false
      end

      it "shows the page" 

    end
  end

  describe '#resend_email' do
    before do
      SiteSetting.has_login_hint = true
      GlobalSetting.stubs(:developer_emails).returns("robin@example.com")

      post "/finish-installation/register", params: {
        email: 'robin@example.com',
        username: 'eviltrout',
        password: 'disismypasswordokay'
      }
    end

    it "resends the email" 

  end
end

