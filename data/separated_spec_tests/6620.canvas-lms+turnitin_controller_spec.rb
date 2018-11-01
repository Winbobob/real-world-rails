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

require 'spec_helper'

describe SupportHelpers::TurnitinController do
  describe 'require_site_admin' do
    it 'should redirect to root url if current user is not a site admin' 


    it 'should redirect to login if current user is not logged in' 


    it 'should render 200 if current user is a site admin' 

  end

  describe 'helper action' do
    before do
      site_admin_user
      user_session(@user)
    end

    context 'md5' do
      it "should create a new MD5Fixer" 

    end

    context 'error2305' do
      it "should create a new Error2305Fixer" 

    end

    context 'shard' do
      it "should create a new ShardFixer" 


      it "should create a new ShardFixer with after_time" 

    end

    context 'assignment' do
      it "should create a new AssignmentFixer with id" 


      it "should return 400 status without id" 

    end

    context 'refresh_lti_attachment' do
      it "should create a new RefreshLtiAttachmentFixter" 

    end


    context 'pending' do
      it "should create a new StuckInPendingFixer" 

    end

    context 'expired' do
      it "should create a new ExpiredAccountFixer" 

    end
  end

  def fixer(klass)
    @fixer = klass.new(@user.email)
    expect(klass).to receive(:new).with(@user.email, nil).and_return(@fixer)
    expect(@fixer).to receive(:monitor_and_fix)
    @fixer
  end
end

