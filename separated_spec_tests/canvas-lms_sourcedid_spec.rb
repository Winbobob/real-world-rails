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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe BasicLTI::Sourcedid do
  subject(:sourcedid) {described_class.new(tool, course, assignment, user)}

  let(:tool) { external_tool_model(context: course) }
  let(:course) { course_model }
  let(:assignment) do
    course.assignments.create!(
      {
          title: "value for title",
          description: "value for description",
          due_at: Time.zone.now,
          points_possible: "1.5",
          submission_types: 'external_tool',
          external_tool_tag_attributes: {url: tool.url}
      }
    )
  end
  let(:user) { course_with_student(course: course).user }

  before do
    fake_secrets = {
      'lti-signing-secret' => 'signing-secret-vp04BNqApwdwUYPUI',
      'lti-encryption-secret' => 'encryption-secret-5T14NjaTbcYjc4',
    }

    allow(Canvas::DynamicSettings).to receive(:find).and_return(fake_secrets)
  end

  it 'creates a signed and encrypted sourcedid' 


  describe ".load!" do
    it 'raises an exception for an invalid sourcedid' 


    it 'raises an exception for a nil sourcedid' 


    context "legacy sourcedid" do
      it 'raises an exception when improperly signed' 


      it 'raises an exception when the tool id is invalid' 


      it 'builds a sourcedid' 

    end

    it 'raises an exception when the course is invalid' 


    it 'raises an exception when the user is not in the course' 


    it 'raises an exception when the assignment is not valid' 


    it 'raises an exception when the assignment is not associated with the tool' 

  end
end

