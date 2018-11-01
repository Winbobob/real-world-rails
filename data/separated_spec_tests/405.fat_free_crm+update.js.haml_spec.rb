# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/contacts/update" do
  include ContactsHelper

  before do
    login

    assign(:contact, @contact = build_stubbed(:contact, user: current_user))
    assign(:users, [current_user])
    assign(:account, @account = build_stubbed(:account))
    assign(:accounts, [@account])
  end

  describe "no errors:" do
    describe "on contact landing page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/contacts/123"
      end

      it "should flip [edit_contact] form" 


      it "should update sidebar" 

    end

    describe "on contacts index page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/contacts"
      end

      it "should replace [Edit Contact] with contact partial and highlight it" 


      it "should update sidebar" 

    end

    describe "on related asset page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/accounts/123"
      end

      it "should replace [Edit Contact] with contact partial and highlight it" 


      it "should update recently viewed items" 

    end
  end

  describe "validation errors:" do
    before do
      @contact.errors.add(:first_name)
    end

    describe "on contact landing page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/contacts/123"
      end

      it "should redraw the [edit_contact] form and shake it" 

    end

    describe "on contacts index page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/contacts"
      end

      it "should redraw the [edit_contact] form and shake it" 

    end

    describe "on related asset page -" do
      before do
        controller.request.env["HTTP_REFERER"] = @referer = "http://localhost/accounts/123"
      end

      it "errors: should show disabled accounts dropdown" 


      it "should redraw the [edit_contact] form and shake it" 

    end
  end
end

