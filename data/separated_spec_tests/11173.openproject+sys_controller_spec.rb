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
require 'sys_controller'

describe SysController, type: :controller do
  fixtures :all

  before do
    Setting.enabled_scm = %w(subversion git)
  end

  describe 'when enabled',
           with_settings: { sys_api_enabled?: true } do

    it 'should projects with repository enabled' 


    it 'should fetch changesets' 


    it 'should fetch changesets one project' 


    it 'should fetch changesets unknown project' 

  end

  describe 'when disabled', with_settings: { sys_api_enabled?: false } do
    it 'should disabled ws should respond with 403 error' 

  end
end

