#
# Copyright (C) 2016 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')
require_dependency "canvas/jwt_workflow"

module Canvas
  describe JWTWorkflow do
    before(:each) do
      @c = Course.new
      @u = User.new
    end

    describe 'register/state_for' do
      it 'uses block registerd with workflow to build state' 


      it 'returns an empty hash if if workflow is not registered' 


      it 'merges state of muliple workflows in order of array' 

    end

    describe 'workflows' do
      describe ':rich_content' do
        before(:each) do
          allow(@c).to receive(:grants_right?)
          allow(@c).to receive(:feature_enabled?)
          @wiki = Wiki.new
          allow(@c).to receive(:wiki).and_return(@wiki)
          allow(@c).to receive(:respond_to?).with(:wiki).and_return(true)
          allow(@wiki).to receive(:grants_right?)
        end

        it 'sets can_upload_files to false' 


        it 'sets can_upload_files to true' 


        it 'sets usage_rights_required to false' 


        it 'sets usage_rights_required to true' 


        it 'sets can_create_pages to false if context does not have a wiki' 


        it 'sets can_create_pages to false if user does not have create_page rights' 


        it 'sets can_create_pages to true if user has create_page rights' 

      end

      describe ':ui' do
        before(:each) do
          allow(@u).to receive(:prefers_high_contrast?)
        end

        it 'sets use_high_contrast to true' 


        it 'sets use_high_contrast to false' 

      end
    end
  end
end

