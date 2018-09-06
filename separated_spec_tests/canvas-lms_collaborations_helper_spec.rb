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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CollaborationsHelper do

  let(:user) { double('user') }
  let(:course) { Course.new(name: "my course").tap {|t| allow(t).to receive_messages(id: 1)} }
  let(:collab) { double('single collaboration').tap {|t| allow(t).to receive_messages(id: 1) } }

  describe "collaboration" do
    it 'renders the collaborations' 


    it 'renders the google auth for google drive collaborations if the user does not have google docs authorized' 


    it 'constructs the data attributes' 


    it 'has the data-update-launch-url attribute if it is a ExternalToolCollaboration' 


  end

  describe "#edit_button" do
    it 'returns the edit button if the user has permissions' 


    it "doesn't return the edit button for an ExternalToolCollaboration that don't have an edit url" 


  end

  describe "#delete_button" do
    it 'returns the delete button if the user has permissions' 

  end

  describe "#collaboration_links" do

    it 'returns collaboration links if the user has permissions' 


    it "doesn't return collaboration links if the user doesn't have permission" 


  end


end

