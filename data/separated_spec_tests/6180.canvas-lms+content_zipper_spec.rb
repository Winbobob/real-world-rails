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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContentZipper do
  # Note that EportfoliosController#export,
  # SubmissionsController#submission_zip, and FoldersController#download are
  # all ALMOST exactly the same code, copied and pasted with slight changes.
  #
  # This really needs to get refactored at some point.
  def grab_zip
    expect { yield }.to change(Delayed::Job, :count).by(1)
    expect(response).to be_successful
    attachment_id = json_parse['attachment']['id']
    expect(attachment_id).to be_present

    a = Attachment.find attachment_id
    expect(a).to be_to_be_zipped

    # a second query should just return status
    expect { yield }.to change(Delayed::Job, :count).by(0)
    expect(response).to be_successful
    expect(json_parse['attachment']['id']).to eq a.id
  end

  context "submission zips" do
    before(:once) do
      course_with_teacher(:active_all => true)
      submission_model(:course => @course)
    end

    before(:each) do
      user_session(@teacher)
    end

    it "should schedule a job on the first request, and then respond with progress updates" 


    it "should recreate the submission zip if the anonymous grading setting changes" 


    it "should recreate the submission zip if the previous one is too old" 


    it "should recreate the submission zip if a submission has been made since its creation" 

  end

  context "eportfolio zips" do
    it "should schedule a job on the first request, and then respond with progress updates" 

  end
end

