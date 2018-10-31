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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe StickySisFields do
  def create_abstract_course
    AbstractCourse.process_as_sis do
      AbstractCourse.create!(:name => "1",
        :short_name => "2",
        :account => Account.default,
        :root_account => Account.default,
        :enrollment_term => Account.default.default_enrollment_term)
    end
  end

  it 'should set sis stickiness for changed fields' 


  it 'should set sis stickiness for changed fields without reloading' 


  it 'should set sis stickiness for changed fields with new models' 


  context 'clear_sis_stickiness' do
    it 'should clear out fields that are in the saved list' 


    it 'should clear out fields that are in the stuck list' 


    it 'should ignore fields that already unstuck' 

  end

  context 'add_sis_stickiness' do
    it 'should ignore fields that are in the saved list' 


    it 'should ignore fields that are in the stuck list' 


    it 'should add fields that are in the unstuck list' 


    it "should add fields that aren't anywhere yet" 

  end

  it "doesn't write to the database when there's not a change" 


  it "writes to the database when there's a change" 


  it "should always return an empty list and not run callbacks when just overriding" 


  it "should always return an empty list and run callbacks when overriding and adding" 


  it "should always return an empty list and run callbacks when overriding and clearing" 


  it "should allow setting via stuck_sis_fields=" 


  context "clear_sis_stickiness option" do
    it "should clear out the saved list" 


    it "should clear out the work lists and cache" 

  end

  it "should only process changed fields marked as sticky" 


  it "should leave fields (that may be invalid) in the db alone if untouched" 


  it "should allow removing changed fields" 


  it "should allow removing changed and added fields" 


  context "process_as_sis" do
    it "should work nested (should save and restore options)" 


    describe "callback firing" do
      before(:once) do
        @ac = AbstractCourse.create!(
          name: "1",
          short_name: "2",
          account: Account.default,
          root_account: Account.default,
          enrollment_term: Account.default.default_enrollment_term
        )
      end

      it "fires on normal save" 


      it "doesn't fire processing_as_sis with default args" 


      it "doesn't fire processing_as_sis with sis_stickiness" 


      it "fires processing_as_sis and clearing sis_stickiness" 


      it "fires processing_as_sis and adding sis_stickiness" 

    end
  end

end

