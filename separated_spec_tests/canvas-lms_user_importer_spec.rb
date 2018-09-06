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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

def gen_ssha_password(password)
  salt = SecureRandom.random_bytes(10)
  "{SSHA}" + Base64.encode64(Digest::SHA1.digest(password+salt).unpack('H*').first+salt).gsub(/\s/, '')
end

describe SIS::CSV::UserImporter do

  before { account_model }

  it "should create new users and update names" 


  it "should create new users with display name" 


  it "should create new users with full name" 


  it "should create new users with sortable name" 


  it "should preserve first name/last name split" 


  it "uses sortable_name if none of first_name/last_name/full_name is given" 


  it "uses short_name is none of first_name/last_name/full_name/sortable_name is given" 


  it "uses login_id as a name if no form of name is given" 


  it "should leave the name alone if no name is supplied for an existing user" 


  it "should ignore first and last names if full name is provided" 


  it "should not override the sortable name if full name is provided" 


  it "should set passwords and not overwrite current passwords" 


  it "should recognize integration_id and work" 


  it "should recognize there's no integration_id and still work" 


  it "should recognize a blank integration_id and still work" 


  it "should not set integration_id to nil when it is not passed" 


  it "should allow setting and resetting of passwords" 


  it "should catch active-record-level errors, like invalid unique_id" 


  it "should not allow a secondary user account with the same login id." 


  it "should not allow a secondary user account to change its login id to some other registered login id" 


  it "should not show error when an integration_id is taken" 


  it "should process user row when integration_id is not set" 


  it "should allow a secondary user account to change its login id to some other registered login id if the other changes it first" 


  it "should allow a user to update information" 


  it "should have the correct count when the pseudonym doesn't change" 


  it "should allow a user to update display name specifically" 


  it "should allow a user to update full name name specifically" 


  it "should allow a user to update sortable name specifically" 


  it "should allow a user to update emails and bounce count specifically" 


  it "clears the email cache when email is changed and full_name is supplied" 


  it "should update sortable name properly when full name is updated" 


  it "should add two users with different user_ids, login_ids, but the same email" 


  it "should not notify about a merge opportunity to an SIS user in the same account" 


  it "should not notify about merge opportunities for users that have no means of logging in" 


  it "should not have problems updating a user to a conflicting email" 


  it "should not have a problem adding an existing e-mail that differs in case" 


  it "should re-activate retired e-mails" 


  it "should send merge opportunity notifications when reactivating an email" 


  it "should not send merge opportunity notifications if the conflicting cc is retired or unconfirmed" 


  it "should create everything in the deleted state when deleted initially" 


  it "should not add a user with the same login id as another user" 


  it "should not throw an error to sentry for all errors" 


  it "should not confirm an email communication channel that has an invalid email" 


  it "should not present an error for the same login_id with different case for same user" 


  it "should use an existing pseudonym if it wasn't imported from sis and has the same login id" 


  it "should strip white space on fields" 


  it "should use an existing communication channel" 


  it "should work when a communication channel already exists, but there's no sis_communication_channel" 


  it "should handle stickiness" 


  it "should handle display name stickiness" 


  it "should handle full name stickiness" 


  it "should handle sortable name stickiness" 


  it 'should leave users around always' 


  it 'should leave users enrollments when there is another pseudonym' 


  it 'should remove enrollments when a user is deleted' 


  it 'should remove group_memberships when a user is deleted' 


  it 'removes account memberships when a user is deleted' 


  it 'removes subaccount memberships when a user is deleted' 


  context 'account associations' do
    before(:each) do
      process_csv_data_cleanly(
        "account_id,parent_account_id,name,status",
        "A001,,Humanities,active",
        "A002,A001,English,active",
        "A003,A002,English Literature,active",
        "A004,,Awesomeness,active"
      )
    end

    it "should work with users created as both active and deleted" 


    it 'should work when a user gets undeleted' 


    it 'should delete user enrollments for the current account when deleted, and update appropriate account associations' 

  end

  it "should not steal the communication channel of the previous user" 


  it "should not resurrect a non SIS user" 


  it "should not resurrect a non SIS pseudonym" 


  it "should error nicely when resurrecting an SIS user that conflicts with an active user" 


  it "sets authentication providers" 


  it "warns on invalid authentication providers" 


  it "allows UTF-8 in usernames" 

end

