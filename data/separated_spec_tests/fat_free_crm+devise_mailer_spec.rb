# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe DeviseMailer do
  describe "reset_password_instructions" do
    let(:user) { build(:user, email: "forgot_my_password@example.com") }
    let(:mail) { DeviseMailer.reset_password_instructions(user, user.reset_password_token) }

    before(:each) do
      allow(user).to receive(:reset_password_token).and_return("62fe5299b45513f9d22a2e1454f35dd43d62ba50")
    end

    it "sets fatfree as the sender" 


    it "sets user 'forgot_my_password@example.com' as recipient" 


    it "sets the subject" 


    it "includes password reset link in body" 

  end
end

