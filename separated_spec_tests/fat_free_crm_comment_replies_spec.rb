# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

require "fat_free_crm/mail_processor/comment_replies"

describe FatFreeCRM::MailProcessor::CommentReplies do
  include MockIMAP

  before do
    @mock_address = "crm-comment@example.com"
  end

  before(:each) do
    @crawler = FatFreeCRM::MailProcessor::CommentReplies.new
  end

  #------------------------------------------------------------------------------
  describe "Processing new emails" do
    before do
      create(:user, email: "aaron@example.com")
    end

    before(:each) do
      mock_connect
      mock_disconnect
    end

    it "should attach a new comment to a contact" 


    it "should attach a new comment to an opportunity, using the 'op' shortcut in subject" 

  end
end

