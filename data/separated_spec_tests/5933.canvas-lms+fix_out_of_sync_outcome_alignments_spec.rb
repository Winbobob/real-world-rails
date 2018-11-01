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

describe DataFixup::FixOutOfSyncOutcomeAlignments do
  before do
    course_with_teacher(:active_all => true)
    outcome_with_rubric
    @rubric_association_object = @course.assignments.create!(:title => 'blah')
    @rubric_association = @rubric.rubric_associations.create!({
      :association_object => @rubric_association_object,
      :context => @course,
      :purpose => 'grading'
    })
  end

  it "should not delete active alignments" 


  it "should delete alignments to deleted rubrics" 


  it "should delete alignments to rubrics that no longer should be aligned" 


  it "should delete alignments to assignments without rubrics" 


  it "should delete alignments to assignments with rubrics without matching alignments" 

end

