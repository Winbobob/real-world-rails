#
# Copyright (C) 2017 - present Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/messages_helper')

describe 'submission_grade_changed' do
  before :once do
    submission_model
  end

  let(:notification_name) { :submission_grade_changed }
  let(:asset) { @submission }

  include_examples "a message"

  context ".email" do
    let(:path_type) { :email }

    it "should only include the score if opted in (and still enabled on root account)" 


    it "should include the submission's submitter name if receiver is not the submitter and has the setting turned on" 

  end
end

