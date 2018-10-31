# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe RegistrationsController, type: :controller do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  let(:valid_params) {
    {
      user: {
        username:              "jdoe",
        email:                 "jdoe@example.com",
        password:              "password",
        password_confirmation: "password"
      }
    }
  }

  describe "#check_registrations_open_or_valid_invite!" do
    before do
      AppConfig.settings.enable_registrations = false
    end

    it "redirects #new to the login page" 


    it "redirects #create to the login page" 


    it "does not redirect if there is a valid invite token" 


    it "does redirect if there is an invalid invite token" 


    it "does redirect if there are no invites available with this code" 


    it "does redirect when invitations are closed now" 


    it "does not redirect when the registration is open" 

  end

  describe "#create" do
    render_views

    context "with valid parameters" do
      it "creates a user" 


      it "assigns @user" 


      it "sets the flash" 


      it "redirects to the home path" 


      context "with invite code" do
        it "reduces number of available invites when the registration is closed" 


        it "doesn't reduce number of available invites when the registration is open" 


        it "links inviter with the user" 

      end
    end

    context "with invalid parameters" do
      let(:invalid_params) { valid_params.deep_merge(user: {password_confirmation: "baddword"}) }

      it "does not create a user" 


      it "does not create a person" 


      it "assigns @user" 


      it "sets the flash error" 


      it "doesn't reduce number of available invites" 


      it "renders new" 


      it "keeps invalid params in form" 

    end
  end
end

