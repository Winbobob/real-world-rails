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

describe Api::V1::CourseEvent do
  include Api::V1::CourseEvent

  def url_root
    'http://www.example.com'
  end

  def api_v1_course_url(course)
    URI.encode("#{url_root}/api/v1/courses/#{course}")
  end

  def feeds_calendar_url(feed_code)
    "feed_calendar_url(#{feed_code.inspect})"
  end

  def service_enabled?(type)
    false
  end

  before do
    skip("needs auditors cassandra keyspace configured") unless Auditors::Course::Stream.available?

    @request_id = SecureRandom.uuid
    allow(RequestContextGenerator).to receive_messages( :request_id => @request_id )

    @domain_root_account = Account.default

    course_with_teacher(account: @domain_root_account)

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
    (1..5).each do |index|
      @course.name = "Course #{index}"
      @course.start_at = Date.today + index.days
      @course.conclude_at = @course.start_at + 7.days

      @event = Auditors::Course.record_updated(@course, @teacher, @course.changes, source: :api)
      @events << @event
    end
  end

  it "should be formatted as a course content event hash" 


  it "should be formatted as an array of course content event hashes" 


  it "should be formatted as an array of compound course content event hashes" 


  it "should handle an empty result set" 

end

