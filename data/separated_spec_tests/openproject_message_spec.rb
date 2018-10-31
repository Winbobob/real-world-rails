#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2017 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.rdoc for more details.
#++
require 'legacy_spec_helper'

describe Message, type: :model do
  fixtures :all

  before do
    Setting.notified_events = ['message_posted']
    @board = Board.find(1)
    @user = User.find(1)
  end

  it 'should create' 


  it 'should reply' 


  it 'should moving message should update counters' 


  it 'should destroy topic' 


  it 'should destroy reply' 


  it 'should editable by' 


  it 'should destroyable by' 


  it 'should set sticky' 


  specify 'email notifications for creating a message' do
    assert_difference('ActionMailer::Base.deliveries.count', 3) do
      message = Message.new(board: @board, subject: 'Test message', content: 'Test message content', author: @user)
      assert message.save
    end
  end
end

