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

describe ObserverAlertThresholdsApiController, type: :request do
  include Api
  include Api::V1::ObserverAlertThreshold

  describe '#index' do
    before :once do
      observer_alert_threshold_model(alert_type: 'assignment_missing')
      @path = "/api/v1/users/#{@observer.id}/observer_alert_thresholds?student_id=#{@student.id}"
      @params = {user_id: @observer.to_param, student_id: @student.to_param,
        controller: 'observer_alert_thresholds_api', action: 'index', format: 'json'}
    end

    context 'with student_id' do
      it 'returns the thresholds' 


      it 'only returns active thresholds' 


      it 'returns an empty array if there arent any thresholds' 


      it 'returns an empty array if users are no longer linked' 

    end

    context 'without student_id' do
      it 'returns the thresholds' 


      it 'returns an empty array if there arent any thresholds' 


      it 'returns an empty array if users are no longer linked' 

    end
  end

  describe '#show' do
    before :once do
      observer_alert_threshold_model(alert_type: 'assignment_missing')
      @path = "/api/v1/users/#{@observer.id}/observer_alert_thresholds/#{@observer_alert_threshold.id}"
      @params = {user_id: @observer.to_param, observer_alert_threshold_id: @observer_alert_threshold.to_param,
        controller: 'observer_alert_thresholds_api', action: 'show', format: 'json'}
    end

    it 'returns the threshold' 


    it 'errors if users are not linked' 

  end

  describe '#create' do
    before :once do
      @observer = user_model
      @student = user_model
      @link = UserObservationLink.create(observer: @observer, student: @student)
      @path = "/api/v1/users/#{@observer.id}/observer_alert_thresholds"
    end

    it 'creates the threshold' 


    it 'errors with bad user_id' 


    it 'errors if users are not linked' 


    it 'errors without required params' 


    it 'ignores improper params' 


    it 'updates if threshold already exists' 


    it 'updates a deleted threshold of that alert_type' 

  end

  describe '#update' do
    before :once do
      observer_alert_threshold_model(alert_type: 'assignment_grade_low', threshold: "88")
      @path = "/api/v1/users/#{@observer.id}/observer_alert_thresholds/#{@observer_alert_threshold.id}"
      @params = {user_id: @observer.to_param, observer_alert_threshold_id: @observer_alert_threshold.to_param,
        controller: 'observer_alert_thresholds_api', action: 'update', format: 'json'}
    end

    it 'updates the threshold' 


    it 'errors if users are not linked' 

  end

  describe '#destroy' do
    before :once do
      observer_alert_threshold_model(alert_type: 'assignment_grade_low', threshold: "88")
      @path = "/api/v1/users/#{@observer.id}/observer_alert_thresholds/#{@observer_alert_threshold.id}"
      @params = {user_id: @observer.to_param, observer_alert_threshold_id: @observer_alert_threshold.to_param,
        controller: 'observer_alert_thresholds_api', action: 'destroy', format: 'json'}
    end

    it 'destroys the threshold' 


    it 'errors if users are not linked' 

  end
end

