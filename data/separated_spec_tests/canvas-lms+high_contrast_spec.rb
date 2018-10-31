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

require_relative "./common"

describe "high_contrast" do
  include_context "in-process server selenium tests"

  context "InstUI components" do
    before { course_with_teacher_logged_in(:active_all => true) }

    context "WITHOUT high_contrast turned on" do

      it 'meets 3.5:1 contrast for buttons' 


    end

    context "WITH high_contrast turned on" do
      before { @user.enable_feature!(:high_contrast) }

      it 'meets 4.5:1 contrast for buttons' 


    end
  end
end

