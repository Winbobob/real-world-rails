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

require File.expand_path(File.dirname(__FILE__) + "/common")

describe "i18n js" do
  include_context "in-process server selenium tests"

  before (:each) do
    course_with_teacher_logged_in
    get "/"
    # get I18n global for all the tests
    driver.execute_script "require(['i18nObj'], function (I18n) { window.I18n = I18n });"
  end

  context "strftime" do
    it "should format just like ruby" 

  end

  context "locales" do
    it "should pull in core translations for all locales" 

  end

  context "scoped" do
    it "should use the scoped translations" 

  end
end

