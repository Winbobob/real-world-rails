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

describe SIS::CSV::CourseImporter do

  before { account_model }

  it 'should skip bad content' 


  it "should create new courses" 


  it "should support term stickiness" 


  it "should support account stickiness" 


  it "should support term stickiness from abstract courses" 


  it "shouldn't blow away the account id if it's already set" 


  it "should support falling back to a fallback account if the primary one doesn't exist" 


  it "should rename courses that have not had their name manually changed" 


  it "should not rename courses that have had their names manually changed" 


  it 'should override term dates if the start or end dates are set' 


  it 'should support start/end date and restriction stickiness' 


  it 'should not change templated course names or course codes if the course has those fields marked as sticky' 


  it 'should not change templated course names or course codes if the templated course has those fields marked as sticky' 


  it "should use the default term if none given" 


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

    it 'should change course account associations when a course account changes' 

  end

  it "should make workflow_state sticky" 


  it 'sets and updates course_format' 


  it 'rejects invalid course_format' 


  it 'should allow unpublished to be passed for active' 


  it 'should create rollback data' 


  context "blueprint courses" do
    before :once do
      account_model
      @mc = @account.courses.create!(:sis_source_id => "blahprint")
      @template = MasterCourses::MasterTemplate.set_as_master_course(@mc)
    end

    it "should give a warning when trying to associate an existing blueprint course" 


    it "should give a warning when trying to associate an already associated course" 


    it "shouldn't fail if a course is already associated to the target" 


    it "should allow destroying" 


    it "should be able to associate courses in bulk" 


    it "should try to queue a migration afterwards" 


    it "should try to queue the migration in another job if one is already running" 

  end
end

