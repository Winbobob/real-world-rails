#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ErrorsController do
  def authenticate_user!
    @user = User.create!
    Account.site_admin.account_users.create!(user: @user)
    user_session(@user)
  end

  describe 'index' do
    before { authenticate_user! }

    it "should not error" 

  end

  describe "POST create" do

    def assert_recorded_error(msg = "Thanks for your help!  We'll get right on this")
      expect(flash[:notice]).to eql(msg)
      expect(response).to be_redirect
      expect(response).to redirect_to(root_url)
    end

    it 'creates a new error report' 


    it "doesnt need authentication" 


    it "should be successful without data" 


    it "is successful with limited data" 


    it "should not choke on non-integer ids" 


    it "should not return nil.id if report creation failed" 


    it "should not record the user as nil.id if report creation failed" 


    it "should record the user if report creation failed" 


    it "records the real user if they are in student view" 


    it "records the masqueradee user if not in student view" 


  end
end

