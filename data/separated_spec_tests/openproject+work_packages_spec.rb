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

require 'spec_helper'

describe WorkPackagesController, type: :routing do
  it 'should connect GET /work_packages to work_packages#index' 


  it 'should connect GET /projects/blubs/work_packages to work_packages#index' 


  it 'connects GET /work_packages/new to work_packages#index' 


  it 'connects GET /projects/:project_id/work_packages/new to work_packages#index' 


  it 'should connect GET /work_packages/:id/overview to work_packages#show' 


  it 'should connect GET /projects/:project_id/work_packages/:id/overview to work_packages#index' 


  it 'should connect GET /work_packages/details/:state to work_packages#index' 


  it 'should connect GET /projects/:project_id/work_packages/details/:id/:state' +
     ' to work_packages#index' do
    expect(get('/projects/1/work_packages/details/2/overview'))
      .to route_to(controller: 'work_packages',
                   action: 'index',
                   project_id: '1',
                   state: 'details/2/overview')
  end

  it 'should connect GET /work_packages/:id to work_packages#show' 



  it 'should connect GET /work_packages/:work_package_id/moves/new to work_packages/moves#new' 


  it 'should connect POST /work_packages/:work_package_id/moves to work_packages/moves#create' 


  it 'should connect GET /work_packages/moves/new?ids=1,2,3 to work_packages/moves#new' 


  it 'should connect POST /work_packages/moves to work_packages/moves#create' 

end

