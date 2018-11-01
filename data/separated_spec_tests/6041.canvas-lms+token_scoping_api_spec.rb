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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe "ApplicationController Token Scoping", type: :request do
  describe "url scopes" do
    let(:user) { @user }
    let(:course) { @course }
    let(:quiz) do
      quiz = course.quizzes.create!(title: 'Quiz')
      quiz.publish!
      quiz
    end
    let(:valid_scopes) do
      [
        "url:GET|/api/v1/courses/:course_id/quizzes",
        "url:GET|/api/v1/courses/:course_id/quizzes/:id",
        "url:GET|/api/v1/courses/:course_id/users",
        "url:GET|/api/v1/courses/:id",
        "url:GET|/api/v1/users/:user_id/profile",
        "url:POST|/api/v1/courses/:course_id/assignments",
        "url:POST|/api/v1/courses/:course_id/quizzes",
        "url:PUT|/api/v1/courses/:course_id/quizzes/:id"
      ]
    end
    let(:account) { course.account }
    let(:developer_key) { account.developer_keys.create!(require_scopes: true, scopes: valid_scopes) }

    before(:once) do
      course_with_teacher(user: user_with_pseudonym, active_all: true)
    end

    before { enable_developer_key_account_binding!(developer_key) }

    context "Verificient lti" do
      let(:access_token) do
        AccessToken.create!(
          user: user,
          developer_key: developer_key,
          scopes: valid_scopes
        )
      end

      it "validates access token" 


      it "has access to course" 


      it "fetches quizzes" 


      it "fetches quiz details" 


      it "fetches user info from course" 


      it "has ability to create assignments" 


      it "has ability to create quizzes" 


      it "has ability to update quizzes" 


      it "is not permissible to use unscoped routes" 

    end

  end
end

