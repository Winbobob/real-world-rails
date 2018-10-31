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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe Canvas::PasswordPolicy do
  describe "validations" do
    def pseudonym_with_policy(policy)
      account = Account.default
      account.settings[:password_policy] = policy
      account.save
      @pseudonym = Pseudonym.new
      @pseudonym.user = user_factory
      @pseudonym.account = Account.default
      @pseudonym.unique_id = "foo"
    end

    it "should only enforce minimum length by default" 


    it "should enforce minimum length" 


    it "should reject common passwords" 


    it "should enforce repeated character limits" 


    it "should enforce sequence limits" 


    it "should reject passwords longer than 255 characters" 

  end
end

