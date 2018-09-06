#
# Copyright (C) 2011-14 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe GradingStandardsApiController, type: :request do
  let(:account) { Account.default }
  let(:course) { Course.create! }
  let(:account_standard) { grading_standard_for account }
  let(:course_standard) { grading_standard_for course }

  let(:account_resources_path) { "/api/v1/accounts/#{account.id}/grading_standards" }
  let(:course_resources_path) { "/api/v1/courses/#{course.id}/grading_standards" }
  let(:account_resource_path) { "#{account_resources_path}/#{account_standard.id}" }
  let(:course_resource_path) { "#{course_resources_path}/#{course_standard.id}" }

  let(:account_resources_params) do
    {
      controller: 'grading_standards_api',
      action: 'context_index',
      format: 'json',
      account_id: account.id.to_s
    }
  end
  let(:course_resources_params) do
    {
      controller: 'grading_standards_api',
      action: 'context_index',
      format: 'json',
      course_id: course.id.to_s
    }
  end
  let(:account_resource_params) do
    account_resources_params.merge({
      action: 'context_show',
      grading_standard_id: account_standard.id
    })
  end
  let(:course_resource_params) do
    course_resources_params.merge({
      action: 'context_show',
      grading_standard_id: course_standard.id
    })
  end
  let(:account_create_params) do
    account_resources_params.merge({
      action: 'create'
    })
  end
  let(:course_create_params) do
    course_resources_params.merge({
      action: 'create'
    })
  end

  context "account admin" do
    before(:each) do
      account_admin_user
    end

    describe 'get grading standards' do
      it "returns a list of account grading standards" 


      it "returns a list of course grading standards" 

    end

    describe '#context_show' do
      it "returns a single account grading standard" 


      it "returns a single course grading standard" 


      it "returns a 404 if the grading standard does not exist" 

    end

    describe 'grading standards creation' do
      let(:grading_scheme_entry) do
        [
          {"name"=>"A", "value"=>"90"},
          {"name"=>"B", "value"=>"80"},
          {"name"=>"C", "value"=>"70"},
          {"name"=>"D", "value"=>"0"},
        ]
      end

      it "creates account level grading standards" 


      it "creates course level grading standards" 


      it "returns error if no grading scheme provided" 


      it "returns error if grading scheme does not contain a grade for 0%" 


      it "returns error if grading scheme contains negative values" 


      it "returns error if grading scheme contains duplicate values" 

    end
  end

  context "teacher" do
    let(:grading_scheme_entry) do
      [
        {"name"=>"A", "value"=>"90"},
        {"name"=>"B", "value"=>"80"},
        {"name"=>"C", "value"=>"70"},
        {"name"=>"D", "value"=>"0"},
      ]
    end

    before(:each) do
      user_factory
      enrollment = course.enroll_teacher(@user)
      enrollment.accept!
    end

    describe "grading standard creation" do
      it "returns unauthorized for account grading standards" 


      it "returns ok for course grading standards" 

    end

    describe '#context_show' do
      it "returns a single account grading standard" 


      it "returns a single course grading standard" 

    end
  end
end

