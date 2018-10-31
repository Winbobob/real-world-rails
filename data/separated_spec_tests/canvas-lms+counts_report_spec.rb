#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')

describe Reporting::CountsReport do
  before do
    @account1 = Account.create!
  end

  describe "detailed report" do
    describe "courses" do
      it "should count available courses" 


      it "should not count non-available courses" 

    end

    shared_examples_for "user_counts" do
      it "should count users that recently logged in" 


      it "should not count users whose enrollment is deleted" 


      it "should not count users whose pseudonym is deleted" 


      it "should not count users who haven't recently logged in" 

    end

    describe "teachers" do
      before :each do
        course_with_teacher(:account => @account1, :user => user_with_pseudonym, :active_course => 1, :active_enrollment => 1)
        @pseudonym.last_request_at = 1.day.ago
        @pseudonym.save!
      end

      let(:datum) { 'teachers' }
      include_examples "user_counts"
    end

    describe "students" do
      before :each do
        course_with_student(:account => @account1, :user => user_with_pseudonym, :active_course => 1, :active_enrollment => 1)
        @pseudonym.last_request_at = 1.day.ago
        @pseudonym.save!
      end

      let(:datum) { 'students' }
      include_examples "user_counts"
    end

    describe "users" do
      before :each do
        course_with_ta(:account => @account1, :user => user_with_pseudonym, :active_course => 1, :active_enrollment => 1)
        @pseudonym.last_request_at = 1.day.ago
        @pseudonym.save!
      end

      let(:datum) { 'users' }
      include_examples "user_counts"

      it "should include tas" 


      it "should include teachers" 


      it "should include students" 


      it "should include designers" 


      it "should include observers" 


      it "should not include student view users" 

    end

    describe "files" do
      before :each do
        # the account needs a course in it to get data out of the report
        course_factory(account: @account1, active_course: 1)
      end

      it "should count files with the account's local id in the namespace" 


      it "should count files with the account's global id in the namespace" 


      it "should count with a heterogenous mixture of file namespaces" 

    end
  end
end

