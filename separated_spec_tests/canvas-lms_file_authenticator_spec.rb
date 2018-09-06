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
#

require 'spec_helper'

describe FileAuthenticator do
  before :each do
    @oauth_host = 'http://oauth.host/'
    @user = user_model
    @acting_as = user_model
    @attachment = attachment_with_context(@user)
    @attachment.filename = "test.txt"
    @authenticator = FileAuthenticator.new(@user, @acting_as, @oauth_host)
  end

  describe "fingerprint" do
    it "should be a hexdigest string" 


    it "should be stable across instances with the same parameters" 


    it "should be unique across instances with different parameters" 

  end

  context "with an inst-fs attachment" do
    before do
      @attachment.instfs_uuid = 1
    end

    describe "download_url" do
      it "should construct an instfs download url" 


      it "should construct a url specific to the authenticator params" 

    end

    describe "inline_url" do
      it "should construct an instfs inline url" 


      it "should construct a url specific to the authenticator params" 

    end

    describe "thumbnail_url" do
      it "should return nil if Attachment.skip_thumbnails" 


      it "should return nil if attachment is not thumbnailable" 


      it "should construct an instfs thumbnail url" 


      it "should pass along the thumbnail geometry" 


      it "should construct a url specific to the authenticator params" 

    end
  end

  context "with a non-inst-fs attachment" do
    before :each do
      @attachment.instfs_uuid = nil
    end

    it "should delegate to attachment.thumbnail_url" 


    it "should delegate to attachment.public_download_url" 


    it "should delegate to attachment.public_inline_url" 

  end
end

