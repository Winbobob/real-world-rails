#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

class ExternalToolTestController
  include Api::V1::ExternalTools
end

describe Api::V1::ExternalTools do
  let(:controller) {ExternalToolTestController.new}

  describe "#external_tool_json" do
    before(:each) do
      course_with_student
    end

    let(:tool) do
      params = {:name => "a", :url => 'www.google.com/tool_launch', :domain => "google.com", :consumer_key => '12345',
                :shared_secret => 'secret', :privacy_level => 'public'}
      tool = @course.context_external_tools.new(params)
      tool.settings = {:selection_width => 1234, :selection_height => 99, :icon_url => 'www.google.com/icon'}
      tool.save
      tool
    end

    it "generates json" 


    it "gets default extension settings" 


    it "gets extension labels" 

  end
end

