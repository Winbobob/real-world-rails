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
require 'search_controller'

describe SearchController, type: :controller do
  render_views

  fixtures :all

  before do
    User.current = nil
  end

  it 'should search all projects' 


  it 'should search project and subprojects' 


  it 'should search without searchable custom fields' 


  it 'should search with searchable custom fields' 


  it 'should search all words' 


  it 'should search one of the words' 


  it 'should search titles only without result' 


  it 'should search titles only' 


  it 'should search with invalid project id' 


  it 'should quick jump to work packages' 


  it 'should not jump to an invisible WP' 


  it 'should large integer' 


  it 'should tokens with quotes' 

end

