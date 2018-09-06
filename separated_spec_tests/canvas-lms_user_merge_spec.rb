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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper.rb')

describe UserMerge do
  describe 'with simple users' do
    let!(:user1) { user_model }
    let!(:user2) { user_model }
    let(:course1) { course_factory(active_all: true) }
    let(:course2) { course_factory(active_all: true) }

    it 'should delete the old user' 


    it "should move pseudonyms to the new user" 


    it "should move admins to the new user" 


    it "should use avatar information from merged user if none exists" 


    it "should not overwrite avatar information already in place" 


    it "should move access tokens to the new user" 


    it "should move submissions to the new user (but only if they don't already exist)" 


    it "should not move or delete submission when both users have submissions" 


    it "should prioritize grades over submissions" 


    it "should move and swap submission when one user has a submission" 


    it "should move quiz submissions to the new user (but only if they don't already exist)" 


    it "should move ccs to the new user (but only if they don't already exist)" 


    it "should move and uniquify enrollments" 


    it "should handle enrollment conflicts like a champ" 


    it "should remove conflicting module progressions" 


    it "should remove observer enrollments that observe themselves (target)" 


    it "should remove observer enrollments that observe themselves (source)" 


    it "should move and uniquify observee enrollments" 


    it "should move and uniquify observers" 


    it "should move and uniquify observed users" 


    it "should move conversations to the new user" 


    it "should point other user's observers to the new user" 


    it "should move appointments" 


    it "should move user attachments and handle duplicates" 


    it "should move discussion topics and entries" 


    it "should freshen moved topics" 


    it "should freshen topics with moved entries" 

  end

  it "should update account associations" 


  context "versions" do
    let!(:user1) { user_model }
    let!(:user2) { user_model }

    context "submissions" do
      it "updates the versions table" 


      it "updates the submission_versions table" 

    end

    it "should update quiz submissions" 


    it "should update other appropriate versions" 

  end

  context "sharding" do
    specs_require_sharding

    it 'should merge with user_services acorss shards' 


    it "should merge a user across shards" 


    it "should associate the user with all shards" 


    it "should move ccs to the new user (but only if they don't already exist)" 


    it "should not fail copying retired sms channels" 


    it "should move user attachments and handle duplicates" 


    context "manual invitation" do
      it "should not keep a temporary invitation in cache for an enrollment deleted after a user merge" 

    end
  end

end

