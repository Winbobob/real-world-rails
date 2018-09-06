#
# Copyright (C) 2016 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe Api::V1::Collaboration do
  include Api::V1::Collaboration

  before(:once) do
    @current_user  = user_with_pseudonym(:active_all => true)
    course = course_with_teacher(user: @current_user).course
    @collaboration = ExternalToolCollaboration.new(:title => 'Test collaboration',
                                       :description => 'Let us collaborate',
                                       :type => 'ExternalToolCollaboration',
                                       :url => 'https://google.com',
                                       :user => @current_user)
    @collaboration.context = course
    @collaboration.data = {updateUrl: 'https://google.com'}
    @collaboration.save!
  end

  it 'should properly serialize' 


  it 'should include the owning users name' 


  it 'should include the update_url' 

end

