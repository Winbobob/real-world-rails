#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

require 'nokogiri'

describe UsersController do
  describe "#teacher_activity" do
    before do
      course_with_teacher_logged_in(:active_all => true)
      @course.update_attribute(:name, 'coursename1')
      @enrollment.update_attribute(:limit_privileges_to_course_section, true)
      @et = @enrollment
      @s1 = @course.course_sections.first
      @s2 = @course.course_sections.create!(:name => 'Section B')
      @e1 = student_in_course(:active_all => true)
      @e2 = student_in_course(:active_all => true)
      @e1.user.update_attribute(:name, 'studentname1')
      @e2.user.update_attribute(:name, 'studentname2')
      @e2.update_attribute(:course_section, @s2)
    end

    it "should count conversations as interaction" 


    it "should only include students the teacher can view" 


    it "should show user notes if enabled" 


    it "should show individual user info across courses" 


    it "should be available for concluded courses/enrollments" 


    it "should show concluded students to active teachers" 


    context "sharding" do
      specs_require_sharding

      it "should show activity for students located on another shard" 

    end
  end

  describe "#index" do
    it "should render" 


    it "should not show any student view students at the account level" 

  end

  describe "#show" do
    it "should allow admins to view users in their account" 


    it "should show user to account users that have the read_roster permission" 


    it "should show course user to account users that have the read_roster permission" 

  end

  describe "#avatar_image_url" do
    before do
      course_with_student_logged_in(:active_all => true)
      @a = Account.default
      enable_avatars!
    end

    def enable_avatars!
      @a.enable_service(:avatars)
      @a.save!
    end

    def disable_avatars!
      @a.disable_service(:avatars)
      @a.save!
    end

    it "should maintain protocol and domain name in fallback" 


    it "should maintain protocol and domain name in default avatar redirect fallback" 


    it "should forget all cached urls when the avatar changes" 

  end

  describe "#grades" do
    it "should only list courses once for multiple enrollments" 


    it "should let an admin with view_all_grades view" 

  end

  describe "admin_merge" do
    it "should work for the whole flow" 

  end

  context "media_download url" do
    let(:kaltura_client) do
      kaltura_client = instance_double('CanvasKaltura::ClientV3')
      allow(CanvasKaltura::ClientV3).to receive(:new).and_return(kaltura_client)
      kaltura_client
    end

    let(:media_source_fetcher) {
      media_source_fetcher = instance_double('MediaSourceFetcher')
      expect(MediaSourceFetcher).to receive(:new).with(kaltura_client).and_return(media_source_fetcher)
      media_source_fetcher
    }

    before do
      account = Account.create!
      course_with_student(:active_all => true, :account => account)
      user_session(@student)
    end

    it 'should pass the type down to the media fetcher even with a malformed url' 

  end
end

