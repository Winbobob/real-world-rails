#
# Copyright (C) 2013 Instructure, Inc.
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

shared_examples_for 'a locked api item' do
  def verify_unlocked
    json = api_get_json
    expect(json).not_to be_nil

    expect(json['locked_for_user']).to be_falsey
  end

  def verify_locked(*lock_info_extra)
    json = api_get_json
    expect(json).not_to be_nil

    expect(json['locked_for_user']).to be_truthy, "expected 'locked_for_user' to be true"
    expect(json['lock_explanation']).not_to be_nil, "expected 'lock_explanation' to be present"

    lock_info = json['lock_info']
    expect(lock_info).not_to be_nil, 'expected lock_info to be present'
    expect(lock_info['asset_string']).not_to be_nil, "expected lock_info to contain 'asset_string'"
    lock_info_extra.each { |attribute| expect(lock_info[attribute.to_s]).not_to be_nil, "expected lock_info to contain '#{attribute}'" }
  end

  before(:once) do
    course_with_student(:active_all => true)
  end

  it 'should have the correct helpers' 


  it 'should unlock using unlock_at' 


  it 'should lock using lock_at' 


  it 'should be locked by a context module that is not yet complete' 


  it 'should be locked by a context module that is not yet unlocked' 

end

