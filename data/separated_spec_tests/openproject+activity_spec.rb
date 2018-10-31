#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
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
# See docs/COPYRIGHT.rdoc for more details.
#++
require_relative '../legacy_spec_helper'

describe Activity, type: :model do
  fixtures :all

  before do
    @project = Project.find(1)
    [1, 4, 5, 6].each do |issue_id|
      i = WorkPackage.find(issue_id)
      i.add_journal(User.current, 'A journal to find')
      i.save!
    end

    WorkPackage.all.each(&:recreate_initial_journal!)
    Message.all.each(&:recreate_initial_journal!)
  end

  after do
    Journal.delete_all
  end

  it 'should activity without subprojects' 


  it 'should activity with subprojects' 


  it 'should global activity anonymous' 


  it 'should global activity logged user' 


  it 'should user activity' 


  private

  def find_events(user, options = {})
    events = Redmine::Activity::Fetcher.new(user, options).events(Date.today - 30, Date.today + 1)
    # Because events are provided by the journals, but we want to test for
    # their targets here, transform that
    events.map do |e|
      e.provider.new.activitied_type.find(e.journable_id)
    end
  end
end

