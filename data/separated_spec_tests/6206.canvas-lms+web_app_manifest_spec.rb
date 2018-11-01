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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'site-wide', :type => :request do

  context "web app manifest" do

    before(:once) do
      student_in_course
      user_with_pseudonym(:user => @student, :username => 'student@example.com', :password => 'password')
    end

    it "doesn't add link tag if setting is explicitly unset" 


    it "adds the app manifest link tag so it prompts android users to install mobile app" 


  end
end

