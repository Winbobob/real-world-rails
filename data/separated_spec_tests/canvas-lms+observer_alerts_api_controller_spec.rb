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

require_relative '../api_spec_helper'

describe ObserverAlertsApiController, type: :request do
  include Api
  include Api::V1::ObserverAlert

  describe '#alerts_by_student' do
    alerts = []
    before :once do
      @course = course_model
      @assignment = assignment_model(context: @course)

      alerts << observer_alert_model(course: @course, alert_type: 'assignment_grade_high',
        threshold: 80, context: @assignment)
      observer_alert_threshold = @observer_alert_threshold

      alerts << observer_alert_model(course: @course, observer: @observer, student: @student, link: @observation_link,
        alert_type: 'assignment_grade_low', threshold: 70, context: @assignment)
      alerts << observer_alert_model(course: @course, observer: @observer, student: @student, link: @observation_link,
        alert_type: 'course_grade_high', threshold: 80, context: @course)

      @observer_alert_threshold = observer_alert_threshold

      @path = "/api/v1/users/#{@observer.id}/observer_alerts/#{@student.id}"
      @params = {user_id: @observer.to_param, student_id: @student.to_param,
        controller: 'observer_alerts_api', action: 'alerts_by_student', format: 'json'}
    end

    it 'returns correct attributes' 


    it 'returns all alerts for student' 


    it 'doesnt return alerts for other students' 


    it 'returns empty array if users are not linked' 

  end

  describe '#alerts_count' do
    before :once do
      @course = course_model
      @assignment = assignment_model(context: @course)

      observer_alert_model(course: @course, alert_type: 'assignment_grade_high',
        threshold: 90, context: @assignment, workflow_state: 'unread')
      student = @student
      observer_alert_model(course: @course, alert_type: 'assignment_grade_high',
        threshold: 90, context: @assignment, workflow_state: 'unread', observer: @observer)
      observer_alert_model(course: @course, alert_type: 'assignment_grade_low',
        threshold: 40, context: @assignment, workflow_state: 'read', observer: @observer)
      @student = student
    end

    it 'only returns the number of unread alerts for the user' 


    it 'will only return the unread count for the specific student id provided' 

  end

  context '#update' do
    before :each do
      @course = course_model
      @assignment = assignment_model(context: @course)

      observer_alert_model(course: @course, alert_type: 'assignment_grade_high', threshold: 80, context: @assignment)

      @path = "/api/v1/users/#{@observer.id}/observer_alerts/#{@observer_alert.id}"
      @params = {user_id: @observer.to_param, observer_alert_id: @observer_alert.to_param,
        controller: 'observer_alerts_api', action: 'update', format: 'json'}
    end

    it 'updates the workflow_state to read' 


    it 'updates the workflow_state to dismissed' 


    it 'doesnt allow other workflow_states' 


    it 'doesnt update any other attribute' 


    it 'errors if users are not linked' 

  end
end

