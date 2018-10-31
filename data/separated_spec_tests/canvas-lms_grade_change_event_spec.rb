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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

class GradeChangeEventTestHarness
  include Api::V1::GradeChangeEvent

  def url_root
    'http://www.example.com'
  end

  def feeds_calendar_url(feed_code)
    "feed_calendar_url(#{feed_code.inspect})"
  end

  def course_assignment_url(course, assignment)
    url_root
  end

  def api_v1_course_url(course)
    URI.encode("#{url_root}/api/v1/courses/#{course}")
  end

  def api_v1_course_assignment_url(course, assignment)
    URI.encode("#{url_root}/api/v1/courses/#{course}/assignments/#{assignment}")
  end

  def service_enabled?(type)
    false
  end

  def course_assignment_submissions_url(course, assignment, _)
    URI.encode("#{url_root}/api/v1/courses/#{course}/assignments/#{assignment}/submissions?zip=0")
  end
end

describe Api::V1::GradeChangeEvent do
  subject { GradeChangeEventTestHarness.new }

  before do
    skip("needs auditors cassandra keyspace configured") unless Auditors::GradeChange::Stream.available?

    @request_id = SecureRandom.uuid
    allow(RequestContextGenerator).to receive_messages( :request_id => @request_id )

    @domain_root_account = Account.default

    course_with_teacher(account: @domain_root_account)
    course_with_student(course: @course)

    @page_view = PageView.new { |p|
      p.assign_attributes({
        :request_id => @request_id,
        :remote_ip => '10.10.10.10'
      })
    }

    allow(PageView).to receive_messages(
      :find_by_id => @page_view,
      :find_all_by_id => [ @page_view ]
    )

    @events = []

    @assignment = @course.assignments.create!(:title => 'Assignment', :points_possible => 10)
    @submission = @assignment.grade_student(@student, grade: 8, grader: @teacher).first
    @events << Auditors::GradeChange.record(@submission)

    @submission = @assignment.grade_student(@student, grade: 7, grader: @teacher).first
    @events << Auditors::GradeChange.record(@submission)
    @previous_grade = @submission.grade

    @submission = @assignment.grade_student(@student, grade: 6, grader: @teacher, graded_anonymously: true).first
    @event = Auditors::GradeChange.record(@submission)
    @events << @event
  end

  it "should be formatted as a grade change event hash" 


  it "formats excused submissions" 


  it "formats formerly excused submissions" 


  it "should be formatted as an array of grade change event hashes" 


  it "should be formatted as an array of compound grade change event hashes" 


  it "should handle an empty result set" 

end

