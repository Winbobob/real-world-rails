#
# Copyright (C) 2011 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "communication_channels/confirm.html.erb" do
  before do
    user_factory
    assign(:user, @user)
    @cc = @communication_channel = assign(:communication_channel, @user.communication_channels.create!(:path => 'johndoe@example.com'))
    assign(:nonce, @cc.confirmation_code)
    assign(:body_classes, [])
    assign(:domain_root_account, assign(:root_account, Account.default))
    allow(view).to receive(:require_terms?).and_return(nil) # since controller-defined helper methods don't get plumbed down here
  end

  shared_examples_for "user registration" do
    it "should only show the registration form if no merge opportunities" 


    it "should follow the simple path for not logged in" 


    it "should follow the simple path for logged in as a matching user" 


    it "should follow the simple path for logged in as a non-matching user" 


    it "should follow the mostly-simple-path for not-logged in with multiple pseudonyms" 


    it "should render for multiple merge opportunities" 

  end

  context "invitations" do
    before do
      course_factory(active_all: true)
      assign(:course, @course)
      @enrollment = assign(:enrollment, @course.enroll_user(@user))
    end

    it "should render transfer enrollment form" 


    context "open registration" do
      before do
        @user.update_attribute(:workflow_state, 'creation_pending')
        assign(:pseudonym, @user.pseudonyms.build(:account => Account.default))
      end
      include_examples "user registration"
    end
  end

  context "merging" do
    before do
      @user.register
    end

    it "should render to merge with the current user" 


    it "should render to merge with the current user that doesn't have a pseudonym in the default account" 


    it "should render to merge multiple users" 

  end

  context "self-registration" do
    before do
      assign(:pseudonym, @user.pseudonyms.create!(:unique_id => 'johndoe@example.com'))
    end

    include_examples "user registration"
  end
end

