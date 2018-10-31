#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SelfEnrollmentsController do
  describe "GET 'new'" do
    before do
      Account.default.allow_self_enrollment!
      course_factory(active_all: true)
      @course.update_attribute(:self_enrollment, true)
    end

    it "should render if the course is open for enrollment" 


    it "should do the delegated auth dance" 


    it "forwards authentication_provider param" 


    it "renders directly if authentication_provider=canvas" 


    it "should not render for an incorrect code" 


    it "should render even if self_enrollment is disabled" 


    it "should default assign login_label_name to 'email'" 


    it "should change login_label_name when set on domain_root_account" 

  end
end

