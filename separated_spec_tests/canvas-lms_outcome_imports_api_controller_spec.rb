#
# Copyright (C) 2018 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe OutcomeImportsApiController, type: :request do
  before :once do
    @user = user_with_pseudonym :active_all => true
    @account = Account.default
    @account.account_users.create!(user: @user)

    @outcome_count = LearningOutcome.count
    @group_count = LearningOutcomeGroup.count
    @import_count = OutcomeImport.count
  end

  def expect_keys(json, keys)
    expect(keys - json.keys).to eq([])
    keys.each { |k| json.delete(k) }
    json
  end

  it "should return 404 when no latest import is available" 


  it 'should kick off an outcome import via multipart attachment' 


  it "should allow raw post without content-type" 


  it "should allow raw post without charset" 


  it "should handle raw post content-types with attributes" 


  it "should reject non-utf-8 encodings on content-type" 


  it "should error on user with no outcomes permissions" 


  it "should work with import permissions" 


  it "should include processing_errors when there are errors" 

end

