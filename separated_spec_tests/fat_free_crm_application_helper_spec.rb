# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationHelper do
  it "should be included in the object returned by #helper" 


  describe "link_to_emails" do
    it "should add Bcc: if dropbox address is set" 


    it "should not add Bcc: if dropbox address is not set" 


    it "should truncate long emails" 


    it "should escape HTML entities" 

  end

  it "link_to_discard" 


  describe "shown_on_landing_page?" do
    it "should return true for Ajax request made from the asset landing page" 


    it "should return true for regular request to display asset landing page" 


    it "should return false for Ajax request made from page other than the asset landing page" 


    it "should return false for regular request to display page other than asset landing page" 

  end

  describe "current_view_name" do
    before(:each) do
      @user = mock_model(User)
      allow(helper).to receive(:current_user).and_return(@user)
      allow(controller).to receive(:action_name).and_return('show')
      allow(controller).to receive(:controller_name).and_return('contacts')
    end

    it "should return the contact 'show' outline stored in the user preferences" 

  end
end

