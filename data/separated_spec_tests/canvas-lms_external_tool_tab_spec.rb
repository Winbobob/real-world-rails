#
# Copyright (C) 2016 - present Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe Lti::ExternalToolTab do

  let(:context) do
    account = Account.new
    allow(account).to receive(:id).and_return(1)
    account
  end

  let(:course_navigation) do
    {
      text: "Course Placement",
      url:  "http://example.com/ims/lti",
      default: false,
      visibility: 'admins'
    }
  end

  let(:account_navigation) do
    {
      text: "Account Placement",
      url:  "http://example.com/ims/lti",
      default: 'disabled',
      visibility: 'members'
    }
  end

  let(:user_navigation) do
    {
      text: "User Placement",
      url:  "http://example.com/ims/lti",
    }
  end

  let!(:tool) do
    tool = ContextExternalTool.new(
      url: "http://example.com/ims/lti",
      consumer_key: "asdf",
      shared_secret: "hjkl",
      name: "external tool",
      course_navigation: course_navigation,
      account_navigation: account_navigation,
      user_navigation: user_navigation,
    )
    allow(tool).to receive(:id).and_return(2)
    tool
  end

  subject {described_class.new(context, nil, [tool])}

  it 'sets the tab id to the tools asset_string' 


  it 'sets the css_class' 


  it 'sets the external value to true' 


  it 'sets the args to the context_id and tool_id' 


  it 'sets the target if windowTarget is set on the tool' 


  it "doesn't set the target if windowTarget is not set on the tool" 


  it "doesn't set the target if the windowTarget is not `_blank`" 


  it "adds {dispaly: 'borderless'} if the windowTarget is present" 


  it "sorts by tool id" 


  describe "course_navigation" do
    let(:context) do
      course = Course.new
      allow(course).to receive(:id).and_return(3)
      course
    end
    subject {described_class.new(context, :course_navigation, [tool])}

    it 'sets the label based on placement' 


    it 'sets the visibility' 


    it 'sets the href' 


    it 'sets hidden' 


    it 'sets the target if windowTarget is set on the tool' 


  end

  describe "account_navigation" do
    subject {described_class.new(context, :account_navigation, [tool])}

    it 'sets the label based on placement' 


    it 'sets the visibility' 


    it 'sets the href' 


    it 'sets hidden' 


    it 'sets the target if windowTarget is set on the tool' 


  end

  describe "user_navigation" do
    let(:context) do
      user = User.new
      allow(user).to receive(:id).and_return(4)
      user
    end
    subject {described_class.new(context, :user_navigation, [tool])}

    it 'sets the label based on placement' 


    it 'sets the href' 


    it 'sets the target if windowTarget is set on the tool' 

  end

end

