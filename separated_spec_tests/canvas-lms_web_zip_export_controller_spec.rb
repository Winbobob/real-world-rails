#
# Copyright (C) 2016 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../apis/api_spec_helper')

describe WebZipExportsController do

  before :once do
    account = Account.default
    account.settings[:enable_offline_web_export] = true
    account.save!
    course_with_teacher(active_all: true)
    student_in_course(active_all: true)
  end

  before(:each) do
    user_session(@student)
  end

  describe "GET :index.json", type: :request do
    before(:once) do
      @course.web_zip_exports.create!(user: @student)
      @course.web_zip_exports.create!(user: @student)
    end

    it "should return all course web zip exports" 


    it "should not return web zip exports for other users" 

  end

  describe "GET :show.json", type: :request do
    let_once(:web_zip_export) do
      @course.web_zip_exports.create!({
        user: @student
      })
    end

    it "should be success" 


    it "should not show web zip exports for other users" 

  end

end

