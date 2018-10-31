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

describe SIS::CSV::XlistImporter do

  before { account_model }

  context 'account associations' do
    before(:each) do
      process_csv_data_cleanly(
        "account_id,parent_account_id,name,status",
        "A001,,Humanities,active",
        "A002,A001,English,active",
        "A003,A002,English Literature,active",
        "A004,,Awesomeness,active"
      )
        process_csv_data_cleanly(
          "course_id,short_name,long_name,account_id,term_id,status",
          "C001,TC 101,Test Course 101,,,active",
          "C002,TC 101,Test Course 101,A001,,active",
          "C003,TC 101,Test Course 101,A002,,active",
          "C004,TC 101,Test Course 101,A003,,active",
          "C005,TC 101,Test Course 101,A004,,active"
        )
    end

    it 'should have proper account associations when new' 


    it 'should have proper account associations when being undeleted' 


    it 'should have proper account associations when a section is added and then removed' 


    it 'should get account associations updated when the template course is updated' 


    it 'should import active enrollments with states based on enrollment date restrictions' 


    it "should allow enrollments on crosslisted sections' original course" 


  end

end

