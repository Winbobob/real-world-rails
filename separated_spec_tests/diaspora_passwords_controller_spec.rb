# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe Devise::PasswordsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "#create" do
    context "when there is no such user" do
      it "succeeds" 


      it "doesn't send email" 

    end
    context "when there is a user with that email" do
      it "redirects to the login page" 

      it "sends email (enqueued to Sidekiq)" 

    end
  end
end

