# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe SubscriptionMailer do
  describe "comment notification" do
    let(:user) { build(:user, email: 'notify_me@example.com') }
    let(:campaign) { build(:campaign, user: user) }
    let(:account) { build(:account, user: user) }
    let(:commentable) { build_stubbed(:opportunity, id: 47, name: 'Opportunity name', account: account, campaign: campaign, user: user) }
    let(:comment) { build(:comment, commentable: commentable, user: user) }
    let(:mail) { SubscriptionMailer.comment_notification(user, comment) }

    it "sets user 'notify_me@example.com' as recipient" 


    it "sets the subject" 


    it "includes link to opportunity in body" 


    it "uses email defined in settings as the sender" 


    it "should fallback to smtp from address as the sender" 


    it "should set default reply-to address if email doesn't exist" 

  end
end

