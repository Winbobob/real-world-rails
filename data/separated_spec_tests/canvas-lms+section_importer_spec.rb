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

describe SIS::CSV::SectionImporter do

  before { account_model }

  it 'should skip bad content' 


  it 'should not die when a course is deleted' 


  it 'should not require a name when section is being deleted' 


  it 'should still require a name for new deleted sections' 


  it 'should create rollback data' 


  it 'should ignore unsupported column account_id' 


  it 'should support stickiness' 


  it 'should create sections' 


  it 'should override term dates if the start or end dates are set' 


  it 'should support start/end date and restriction stickiness' 



  it 'should verify xlist files' 


  it 'should work with xlists with no xlist course' 


  it 'should preserve data into copied xlist courses' 


  it 'should work with xlists with an xlist course defined' 


  it 'should work with xlist courses in crazy orders' 


  it 'should be idempotent with active xlists' 


  it 'should be idempotent with deleted xlists' 


  it 'should be able to move around a section and then uncrosslist back to the original' 


  it 'should be able to handle additional section updates and not screw up the crosslisting' 


  it 'should be able to move a non-crosslisted section between courses' 


  it 'should uncrosslist a section if it is getting moved from the original course' 


  it 'should uncrosslist a section if the course has been deleted' 


  it 'should leave a section alone if a section has been crosslisted manually' 


  it 'should leave a section alone if a section has been decrosslisted manually' 


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

    it 'should change course account associations when a section is not crosslisted and the original section\'s course changes via sis' 


    it 'should change course account associations when a section is crosslisted and the original section\'s course changes via sis' 

  end

end

