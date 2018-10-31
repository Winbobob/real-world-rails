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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require_dependency "lti/content_item_converter"

module Lti
  describe ContentItemConverter do

    describe '#self.convert_resource_selection' do

      let(:fake_selection) do
        {
          url: 'some_file.txt',
          text: 'some_file.pdf',
          title: 'my title',
          return_type: 'fake',
          height: '100',
          width: '200',
        }
      end

      let(:file_selection) do
        file_selection = fake_selection.clone
        file_selection[:return_type] = 'file'
        file_selection[:content_type] = 'application/json'
        file_selection
      end

      let(:lti_link) do
        file_selection = fake_selection.clone
        file_selection[:return_type] = 'lti_launch_url'
        file_selection
      end

      it 'creates a IMS::LTI::Models::ContentItems::ContentItem' 


      it 'converts url to id' 


      it 'converts url to url' 


      it 'converts text to text' 


      it 'converts title to title' 


      it 'sets media_type to text/html by default' 


      context 'placement advice' do

        it 'creates placement advice' 


        it 'converts width to display_width' 


        it 'converts height to display_height' 


        it 'sets the presentation_document_target to window by default' 


      end

      context 'file_selection' do
        it 'creates a IMS::LTI::Models::ContentItems::FileItem' 


        it 'sets the presentation_document_target to download' 


        it 'uses the content_type first' 


        it 'looks up the mime type from the text first' 


        it 'looks up the mime type from the url if text fails' 


        it 'sets the mime type to nil if text and url fails' 


      end

      context 'lti_link' do
        it 'creates a IMS::LTI::Models::ContentItems::LtiLinkItem' 


        it 'sets the media_type to application/vnd.ims.lti.v1.ltilink' 


        it 'sets the presentation_document_target to frame' 


      end

      context 'url return_type' do
        let(:url_selection) do
          selection = fake_selection.clone
          selection[:return_type] = 'url'
          selection
        end

        it 'sets the media_type to text/html' 


        it 'sets the presentation_document_target to window' 


      end

      context 'image_url return_type' do
        let(:image_selection) do
          selection = file_selection.clone
          selection[:return_type] = 'image_url'
          selection
        end

        it 'looks up the mime type from the text first' 


        it 'looks up the mime type from the url if text fails' 


        it 'sets the mime type to image if text and url fails' 


        it 'sets the presentation_document_target to embed' 


      end

      context 'iframe return_type' do
        let(:iframe_selection) do
          selection = fake_selection.clone
          selection[:return_type] = 'iframe'
          selection
        end

        it 'sets the media_type to text/html' 


        it 'sets the presentation_document_target to window' 


      end

      context 'rich_content return_type' do
        let(:rich_content_selection) do
          selection = fake_selection.clone
          selection[:return_type] = 'rich_content'
          selection
        end

        it 'sets the media_type to text/html' 


        it 'sets the presentation_document_target to window' 


      end

    end

    describe "#self.convert_oembed" do
      let(:photo_oembed) do
        {
          'type' => 'photo',
          'url' => 'http://example.com/photo',
          'title' => 'my title',
          'height' => '100',
          'width' => '200',
        }
      end

      let(:link_oembed) do
        {
          'type' => 'link',
          'url' => 'http://example.com/link',
          'title' => 'my title',
          'text' => 'some text',
          'height' => '100',
          'width' => '200',
        }
      end

      let(:video_oembed) do
        {
          'type' => 'video',
          'url' => 'http://example.com/video',
          'title' => 'my title',
          'text' => 'some text',
          'height' => '100',
          'html' => 'some html',
          'width' => '200',
        }
      end

      let(:rich_oembed) do
        {
          'type' => 'video',
          'url' => 'http://example.com/rich',
          'html' => 'some html',
          'text' => 'some text',
          'title' => 'my title',
          'height' => '100',
          'width' => '200',
        }
      end


      it 'converts url to id' 


      it 'converts url to url' 


      it 'converts title to title' 


      it 'converts the width' 


      it 'converts the height' 


      context 'photo' do
        it 'converts the title to text' 

      end

      context 'link' do
        it 'converts the text to text' 

      end

      context 'rich' do
        it 'converts the html to text' 

      end

    end


  end
end

