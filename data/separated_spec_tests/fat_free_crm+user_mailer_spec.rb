# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe UserMailer do
  describe "assigned_entity_notification" do
    let(:assigner) { build(:user, first_name: "Bob", last_name: "Hope") }
    let(:assignee) { build(:user, email: "assignee@example.com") }

    context "for an account" do
      let(:account) { build_stubbed(:account, id: 16, name: 'Ghostbusters', user: assigner, assignee: assignee) }
      let(:mail) { UserMailer.assigned_entity_notification(account, assigner) }

      it "sets fatfree as the sender" 


      it "sets user 'assignee@example.com' as recipient" 


      it "sets the subject" 


      it "includes the name of the person who re-assigned the lead in the body" 


      it "includes link to the lead in the body" 

    end

    context "for a contact" do
      let(:contact) { build_stubbed(:contact, id: 56, first_name: 'Harold', last_name: 'Ramis', user: assigner, assignee: assignee) }
      let(:mail) { UserMailer.assigned_entity_notification(contact, assigner) }

      it "sets fatfree as the sender" 


      it "sets user 'assignee@example.com' as recipient" 


      it "sets the subject" 


      it "includes the name of the person who re-assigned the lead in the body" 


      it "includes link to the lead in the body" 

    end

    context "for a lead" do
      let(:lead) { build_stubbed(:lead, id: 42, first_name: 'Bill', last_name: 'Murray', user: assigner, assignee: assignee) }
      let(:mail) { UserMailer.assigned_entity_notification(lead, assigner) }

      it "sets fatfree as the sender" 


      it "sets user 'assignee@example.com' as recipient" 


      it "sets the subject" 


      it "includes the name of the person who re-assigned the lead in the body" 


      it "includes link to the lead in the body" 

    end

    context "for an opportunity" do
      let(:opportunity) { create(:opportunity, id: 24, name: 'Big', user: assigner, assignee: assignee) }
      let(:mail) { UserMailer.assigned_entity_notification(opportunity, assigner) }

      it "sets fatfree as the sender" 


      it "sets user 'assignee@example.com' as recipient" 


      it "sets the subject" 


      it "includes the name of the person who re-assigned the lead in the body" 


      it "includes link to the lead in the body" 

    end
  end
end

