# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe InvitationsController, type: :controller do
  describe "#create" do
    let(:referer) { "http://test.host/cats/foo" }
    let(:invite_params) { {email_inviter: {emails: "abc@example.com"}} }

    before do
      sign_in alice, scope: :user
      request.env["HTTP_REFERER"] = referer
    end

    context "no emails" do
      let(:invite_params) { {email_inviter: {emails: ""}} }

      it "does not create an EmailInviter" 


      it "returns to the previous page" 


      it "flashes an error" 

    end

    context "only valid emails" do
      let(:emails) { "mbs@gmail.com" }
      let(:invite_params) { {email_inviter: {emails: emails}} }

      it "creates an InviteEmail worker" 


      it "returns to the previous page on success" 


      it "flashes a notice" 

    end

    context "only invalid emails" do
      let(:emails) { "invalid_email" }
      let(:invite_params) { {email_inviter: {emails: emails}} }

      it "does not create an InviteEmail worker" 


      it "returns to the previous page" 


      it "flashes an error" 

    end

    context "mixed valid and invalid emails" do
      let(:valid_emails) { "foo@bar.com,mbs@gmail.com" }
      let(:invalid_emails) { "invalid_email" }
      let(:invite_params) { {email_inviter: {emails: valid_emails + "," + invalid_emails}} }

      it "creates an InviteEmail worker" 


      it "returns to the previous page" 


      it "flashes a notice" 

    end

    context "with registration disabled" do
      before do
        AppConfig.settings.enable_registrations = false
      end

      it "displays an error if invitations are closed" 


      it "displays an error when no invitations are left" 

    end

    it "does not display an error when registration is open" 

  end

  describe '#new' do
    it 'renders' 

  end

  describe 'redirect logged out users to the sign in page' do
    it 'redriects #new' 


    it 'redirects #create' 

  end

  describe '.valid_email?' do
    it 'returns false for empty email' 


    it 'returns false for email without @-sign' 


    it 'returns true for valid email' 

  end

  describe '.html_safe_string_from_session_array' do
    it 'returns "" for blank session[key]' 


    it 'returns "" if session[key] is not an array' 


    it 'returns the correct value' 


    it 'sets session[key] to nil' 

  end
end

