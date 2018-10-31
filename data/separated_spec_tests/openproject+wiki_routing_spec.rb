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

describe WikiController, type: :routing do
  describe 'routing' do
    it {
      is_expected.to route(:get, '/projects/567/wiki').to(controller: 'wiki',
                                                          action: 'show',
                                                          project_id: '567')
    }

    it 'should connect GET /projects/:project_id/wiki/:name (without format) to wiki/show' 


    it 'should connect GET /projects/:project_id/wiki/:name (with a dot in it) to wiki/show' 


    it 'should connect GET /projects/:project_id/wiki/:name.html to wiki/show' 


    it 'should connect GET /projects/:project_id/wiki/new to wiki/new' 


    it 'should connect GET /projects/:project_id/wiki/:id/new to wiki/new_child' 


    it 'should connect POST /projects/:project_id/wiki/new to wiki/create' 


    it {
      is_expected.to route(:get, '/projects/567/wiki/my_page/edit').to(controller: 'wiki',
                                                                       action: 'edit',
                                                                       project_id: '567',
                                                                       id: 'my_page')
    }

    it do
      expect(get('/projects/abc/wiki/abc_wiki?version=3')).to route_to(controller: 'wiki',
                                                                       action: 'show',
                                                                       project_id: 'abc',
                                                                       id: 'abc_wiki',
                                                                       version: '3')
    end

    it 'should connect GET /projects/:project_id/wiki/:id/parent_page to wiki/edit_parent_page' 


    it 'should connect PATCH /projects/:project_id/wiki/:id/parent_page to wiki/update_parent_page' 


    it 'should connect GET /projects/:project_id/wiki/:id/toc to wiki#index' 


    it {
      is_expected.to route(:get, '/projects/1/wiki/CookBook_documentation/history').to(controller: 'wiki',
                                                                                       action: 'history',
                                                                                       project_id: '1',
                                                                                       id: 'CookBook_documentation')
    }
    it {
      is_expected.to route(:get, '/projects/1/wiki/CookBook_documentation/diff').to(controller: 'wiki',
                                                                                    action: 'diff',
                                                                                    project_id: '1',
                                                                                    id: 'CookBook_documentation')
    }

    it {
      is_expected.to route(:get, '/projects/1/wiki/CookBook_documentation/diff/2').to(controller: 'wiki',
                                                                                      action: 'diff',
                                                                                      project_id: '1',
                                                                                      id: 'CookBook_documentation',
                                                                                      version: '2')
    }

    it {
      is_expected.to route(:get, '/projects/1/wiki/CookBook_documentation/diff/2/vs/1').to(controller: 'wiki',
                                                                                           action: 'diff',
                                                                                           project_id: '1',
                                                                                           id: 'CookBook_documentation',
                                                                                           version: '2',
                                                                                           version_from: '1')
    }

    it {
      is_expected.to route(:get, '/projects/1/wiki/CookBook_documentation/annotate/2').to(controller: 'wiki',
                                                                                          action: 'annotate',
                                                                                          project_id: '1',
                                                                                          id: 'CookBook_documentation',
                                                                                          version: '2')
    }

    it {
      is_expected.to route(:get, '/projects/22/wiki/ladida/rename').to(controller: 'wiki',
                                                                       action: 'rename',
                                                                       project_id: '22',
                                                                       id: 'ladida')
    }

    it {
      is_expected.to route(:get, '/projects/567/wiki/index').to(controller: 'wiki',
                                                                action: 'index',
                                                                project_id: '567')
    }

    it {
      is_expected.to route(:get, '/projects/567/wiki/date_index').to(controller: 'wiki',
                                                                     action: 'date_index',
                                                                     project_id: '567')
    }

    it {
      is_expected.to route(:get, '/projects/567/wiki/export').to(controller: 'wiki',
                                                                 action: 'export',
                                                                 project_id: '567')
    }

    it {
      is_expected.to route(:patch, '/projects/22/wiki/ladida/rename').to(controller: 'wiki',
                                                                         action: 'rename',
                                                                         project_id: '22',
                                                                         id: 'ladida')
    }

    it {
      is_expected.to route(:post, '/projects/22/wiki/ladida/protect').to(controller: 'wiki',
                                                                         action: 'protect',
                                                                         project_id: '22',
                                                                         id: 'ladida')
    }

    it {
      is_expected.to route(:post, '/projects/22/wiki/ladida/add_attachment').to(controller: 'wiki',
                                                                                action: 'add_attachment',
                                                                                project_id: '22',
                                                                                id: 'ladida')
    }

    it {
      is_expected.to route(:put, '/projects/567/wiki/my_page').to(controller: 'wiki',
                                                                  action: 'update',
                                                                  project_id: '567',
                                                                  id: 'my_page')
    }

    it {
      is_expected.to route(:delete, '/projects/22/wiki/ladida').to(controller: 'wiki',
                                                                   action: 'destroy',
                                                                   project_id: '22',
                                                                   id: 'ladida')
    }
  end
end

