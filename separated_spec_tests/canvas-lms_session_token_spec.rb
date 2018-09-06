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

require_relative '../sharding_spec_helper'

describe 'session token', type: :request do
  before do
    user_with_pseudonym
  end

  let(:access_token) { @user.access_tokens.create!(:purpose => "test").full_token }

  it "should work" 


  it "should set used_remember_me_token" 


  it "should reject bad tokens" 


  it "should remove the token from the url when already logged in" 

end

