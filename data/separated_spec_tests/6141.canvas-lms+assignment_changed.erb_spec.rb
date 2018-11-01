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

describe 'assignment_changed' do
  include MessagesCommon

  before :once do
    assignment_model(:title => "Quiz 1")
  end

  let(:notification_name) { :assignment_changed }
  let(:asset) { @assignment }

  context ".email" do
    let(:path_type) { :email }
    it "should render" 

  end

  context ".sms" do
    let(:path_type) { :sms }
    it "should render" 

  end

  context ".summary" do
    let(:path_type) { :summary }
    it "should render" 

  end
end

