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

require 'spec_helper'

describe Api::V1::Submission do
  include Api::V1::Submission
  include Rails.application.routes.url_helpers
  Rails.application.routes.default_url_options[:host] = 'localhost'

  let(:user) { User.create! }
  let(:course) { Course.create! }
  let(:assignment) { course.assignments.create! }
  let(:session) { {} }
  let(:context) { nil }
  let(:params) { { includes: [field]} }
  let(:submission) { assignment.submissions.build(user: user) }

  describe "submission status" do
    let(:field) { 'submission_status' }
    let(:submission_status) do
      -> (submission) do
        json = submission_json(submission, assignment, user, session, context, [field], params)
        json.fetch(field)
      end
    end

    it "can be Resubmitted" 


    it "can be Missing" 


    it "can be Late" 


    it "can be Unsubmitted by workflow state" 


    it "is Submitted by default" 


    it "can be Submitted by workflow state" 


    it "can be Submitted by submission type" 


    it "can be Submitted by quiz" 


    describe "ordinality" do
      describe "Resubmitted before all others," do
        it "is Resubmitted when it was first Missing" 


        it "is Resubmitted when it was first Late" 


        it "is Resubmitted when it was first Submitted" 


        it "is Resubmitted when it was first Unsubmitted" 

      end

      describe "Missing before Late, Unsubmitted, and Submitted" do
        it "is Missing when it was first Late" 


        it "is Missing when it was first Submitted" 


        it "is Missing when it was first Unsubmitted" 

      end

      describe "Late before Unsubmitted, and Submitted," do
        it "is Late when it was first Submitted" 


        it "is Late when it was first Unsubmitted" 

      end

      it "is Unsubmitted when it was first submitted" 

    end
  end

  describe "grading status" do
    let(:field) { 'grading_status' }
    let(:grading_status) do
      -> (submission) do
        json = submission_json(submission, assignment, user, session, context, [field], params)
        json.fetch(field)
      end
    end

    it "can be Excused" 


    it "can be Needs Review" 


    it "can be Needs Grading" 


    it "can be Graded" 


    it "otherwise returns nil" 


    describe "ordinality" do
      describe "Excused before all others," do
        it "is Excused when it was first Pending Review" 


        it "is Excused when it was first Needs Grading" 


        it "is Excused when it was first graded" 


        it "is Excused when it was first nil" 

      end

      describe "Needs Review before Needs Grading, Graded, and nil," do
        it "is Needs Review when it was first Needs Grading" 


        it "is Needs Review when it was first graded" 


        it "is Needs Review when it was first nil" 

      end

      describe "Needs Grading before Graded and nil," do
        it "is Needs Grading when it was first graded" 


        it "is Needs Grading when it was first nil" 

      end

      it "is Graded when it was first nil" 

    end
  end
end

