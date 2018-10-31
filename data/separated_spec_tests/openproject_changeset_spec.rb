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

describe Changeset, type: :model do
  fixtures :all

  context 'with notified events', with_settings: { notified_events: %w(work_package_updated) } do
    it 'should ref keywords any' 


    it 'should ref keywords' 


    it 'should ref keywords any only' 


    it 'should ref keywords any with timelog' 


    it 'should ref keywords closing with timelog' 


    it 'should ref keywords any line start' 


    it 'should ref keywords allow brackets around a work package number' 


    it 'should ref keywords allow brackets around multiple work package numbers' 


    it 'should commit referencing a subproject work package' 


    it 'should commit referencing a parent project work package' 


    it 'should text tag revision' 


    it 'should text tag hash' 


    it 'should text tag hash all number' 


    it 'should previous' 


    it 'should previous nil' 


    it 'should next' 


    it 'should next nil' 

  end

  context 'enabled scm', with_settings: { enabled_scm: ['subversion'] } do
    it 'should comments empty' 


    it 'should comments nil' 


    it 'should identifier' 

  end
end

