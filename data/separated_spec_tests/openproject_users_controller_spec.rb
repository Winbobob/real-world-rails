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

require_relative '../legacy_spec_helper'
require 'users_controller'

describe UsersController, type: :controller do
  include Redmine::I18n

  fixtures :all

  before do
    User.current = nil
    session[:user_id] = 1 # admin
  end

  it 'should index' 


  it 'should index' 


  it 'should index with name filter' 


  it 'should index with group filter' 


  it 'should show should not display hidden custom fields' 


  it 'should show should not fail when custom values are nil' 


  it 'should show inactive' 


  it 'should show should not reveal users with no visible activity or project' 


  it 'should show inactive by admin' 


  it 'should show displays memberships based on project visibility' 


  it 'should show current should require authentication' 


  it 'should show current' 


  it 'should new' 


  it 'should create' 


  it 'should create with failure' 


  it 'should edit' 


  it 'should update with failure' 


  it 'should update with group ids should assign groups' 


  it 'should update with password change should send a notification' 

end

