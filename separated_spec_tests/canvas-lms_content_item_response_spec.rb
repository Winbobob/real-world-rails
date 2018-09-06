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
#

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe Lti::ContentItemResponse do

  let_once(:context) { course_factory(active_all: true) }
  let_once(:teacher) { course_with_teacher(course: context, active_all: true).user }
  let_once(:assign1) { context.assignments.create!(name: "A1") }
  let_once(:assign2) { context.assignments.create!(name: "A2") }
  let(:controller) do
    controller_mock = double('controller')
    allow(controller_mock).to receive(:api_v1_course_content_exports_url).and_return('api_export_url')
    allow(controller_mock).to receive(:file_download_url).and_return('file_download_url')
    controller_mock
  end

  def subject(media_types)
    described_class.new(context, controller, teacher, media_types, 'common_cartridge')
  end

  describe '#initialize' do
    it 'raises an error if an invalid id is passed in' 


    it 'raises an error if on an invalid export type' 

  end

  describe '#query_params' do
    it 'return correct query params' 


    it 'does not return the select object if there are no media types' 

  end

  describe '#media_type' do
    it 'uses the canvas_media_type when it is not a module item' 


    it 'returns canvas if more than one canvas media is passed in' 


    context 'module_item' do
      it 'sets the media_type to "assignment"' 

      it 'sets the media_type to "quiz"' 

      it 'sets the media_type to "page"' 

      it 'sets the media_type to "discussion_topic"' 

    end
  end

  describe '#tag' do
    it 'returns back a tag' 

  end

  describe '#file' do
    it 'returns a file' 

  end

  describe '#title' do
    it 'gets the title for a file' 


    it 'gets the title for a assignment' 


    it 'gets the title for a discussion_topic' 


    it 'gets the title for a module' 


    it 'gets the title for a page' 


    it 'gets the title for a module_item' 


    it 'gets the title for a quiz' 


    it 'gets the title for a course' 


  end

  describe '#content_type' do
    it 'gets the files content_type' 


    it 'gets the content_type for non files' 

  end

  describe '#url' do
    it 'gets the id for a file' 


    it 'gets the id for non files' 

  end

  describe '#as_json' do
    it 'generates the json for ContentItemSelectionResponse' 


    it 'generates the json for ContentItemSelection' 


  end

end

