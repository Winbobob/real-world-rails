# encoding: utf-8
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

require File.expand_path(File.dirname(__FILE__) + '/cc_spec_helper')

require 'nokogiri'

describe CC::CCHelper do
  context 'map_linked_objects' do
    it 'should find linked canvas items in exported html content' 

  end

  describe CC::CCHelper::HtmlContentExporter do
    before do
      @kaltura = double('CanvasKaltura::ClientV3')
      allow(CanvasKaltura::ClientV3).to receive(:new).and_return(@kaltura)
      allow(@kaltura).to receive(:startSession)
      allow(@kaltura).to receive(:flavorAssetGetByEntryId).with('abcde').and_return([
      {
        :isOriginal => 1,
        :containerFormat => 'mp4',
        :fileExt => 'mp4',
        :id => 'one',
        :size => 15,
      },
      {
        :containerFormat => 'flash video',
        :fileExt => 'flv',
        :id => 'smaller',
        :size => 3,
      },
      {
        :containerFormat => 'flash video',
        :fileExt => 'flv',
        :id => 'two',
        :size => 5,
      },
      ])
      allow(@kaltura).to receive(:flavorAssetGetOriginalAsset).and_return(@kaltura.flavorAssetGetByEntryId('abcde').first)
      course_with_teacher
      @obj = @course.media_objects.create!(:media_id => 'abcde')
    end

    it "should translate media links using the original flavor" 


    it "should not touch media links on course copy" 


    it "should translate media links using an alternate flavor" 


    it "should ignore media links with no media comment id" 


    it "should find media objects outside the context (because course copy)" 


    it "should export html with a utf-8 charset" 


    it "html-escapes the title" 


    it "html-escapes the meta fields" 


    it "should only translate course when trying to translate /cousers/x/users/y type links" 


    it "should interpret links to the files page as normal course pages" 


    it "should prepend the domain to links outside the course" 


    it "should copy pages correctly when the title starts with a number" 


    it "should copy pages correctly when the title consists only of a number" 


    it "uses the key_generator to translate links" 


    it "preserves query parameters on links" 

  end
end

