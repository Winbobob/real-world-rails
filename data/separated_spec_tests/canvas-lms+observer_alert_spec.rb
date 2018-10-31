#
# Copyright (C) 2018 - present Instructure, Inc.
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

require_relative '../../../spec_helper.rb'

class ObserverAlertApiHarness
  include Api::V1::ObserverAlert
  include ApplicationHelper

  def course_assignment_url(context_id, assignment)
    "/courses/#{context_id}/assignments/#{assignment.id}"
  end

  def course_discussion_topic_url(context_id, announcement)
    "/courses/#{context_id}/announcements/#{announcement.id}"
  end

  def course_url(course)
    "/courses/#{course.id}"
  end

end

describe "Api::V1::ObserverAlert" do
  subject(:api) { ObserverAlertApiHarness.new }

  describe "#observer_alert_json" do
    let(:user) { user_model }
    let(:session) { Object.new }

    it "returns json" 


    context "returns a correct html_url" do
      before :once do
        @course = course_model
      end

      it "for discussion_topic" 


      it "for assignment" 


      it "for course" 


      it "for assignment_missing" 

    end
  end
end

