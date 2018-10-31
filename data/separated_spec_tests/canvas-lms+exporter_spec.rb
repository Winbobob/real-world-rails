# coding: utf-8
#
# Copyright (C) 2015 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../cc_spec_helper')

describe "Exporter" do
  include CC::Exporter::Epub

  before(:once) do
    def cartridge_path
      File.join(File.dirname(__FILE__), "/../../../../fixtures/exporter/cc-with-modules-export.imscc")
    end

    def cartridge_without_modules_path
      File.join(File.dirname(__FILE__), "/../../../../fixtures/exporter/cc-without-modules-export.imscc")
    end

    @attachment = Attachment.create({
      context: course_factory,
      filename: 'exportable-test-file',
      uploaded_data: File.open(cartridge_path)
    })

    @attachment_without_modules = Attachment.create({
      context: course_factory,
      filename: 'exportable-test-file',
      uploaded_data: File.open(cartridge_without_modules_path)
    })

  end

  context "create ePub default settings" do
    let(:exporter) do
      CC::Exporter::Epub::Exporter.new(@attachment.open)
    end

    it "should sort content by module" 


    it "should not contain content type keys" 


    it "should contain a syllabus for assignments and quizzes in modules" 


    it "should contain a section for announcements" 


    it "should contain a table of contents for items in modules" 

  end

  context "default settings with no modules present" do
    let(:exporter) do
      CC::Exporter::Epub::Exporter.new(@attachment_without_modules.open)
    end

    it "should fall back to sorting by content type" 

  end

  context "create ePub with content type sorting" do
    let(:exporter) do
      CC::Exporter::Epub::Exporter.new(@attachment.open, true)
    end

    it "should sort by content" 


    it "should not contain a top-level templates key for module content" 


    it "should contain a syllabus entry for all assignments and quizzes" 


    it "should contain a section for announcements" 


    it "should contain a table of contents for all items" 

  end
end

