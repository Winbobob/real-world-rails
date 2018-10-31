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
require 'roles_controller'

describe RolesController, type: :controller do
  render_views

  fixtures :all

  before do
    User.current = nil
    session[:user_id] = 1 # admin
  end

  it 'should get index' 


  it 'should get new' 


  it 'should post new with validaton failure' 


  it 'should post new without workflow copy' 


  it 'should post new with workflow copy' 


  it 'should get edit' 


  it 'should put update' 


  it 'should destroy' 


  it 'should destroy role in use' 


  it 'should get report' 


  it 'should put bulk update' 


  it 'should clear all permissions' 


  it 'should move highest' 


  it 'should move higher' 


  it 'should move lower' 


  it 'should move lowest' 

end

