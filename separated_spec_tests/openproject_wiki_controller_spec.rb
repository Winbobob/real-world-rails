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
require 'wiki_controller'

describe WikiController, type: :controller do
  render_views

  fixtures :all

  before do
    User.current = nil
  end

  def wiki
    Project.first.wiki
  end

  def redirect_page
    wiki.find_page(wiki.start_page) || wiki.pages.first
  end

  it 'should show start page' 


  it 'should show page with name' 


  it 'should show with sidebar' 


  it 'should show unexistent page without edit right' 


  it 'should show unexistent page with edit right' 


  it 'should create page' 


  it 'should create page with attachments' 


  it 'should update page' 


  it 'should update page with failure' 


  # NOTE: this test seems to depend on other tests in suite
  # because running whole suite is fine, but running only this test
  # results in failure
  it 'should update stale page should not raise an error' 


  it 'should history' 


  it 'should history with one version' 


  it 'should diff' 


  it 'should annotate' 


  it 'should get rename' 


  it 'should get rename child page' 


  it 'should rename with redirect' 


  it 'should rename without redirect' 


  it 'should destroy child' 


  it 'should destroy parent' 


  it 'should destroy parent with nullify' 


  it 'should destroy parent with cascade' 


  it 'should destroy parent with reassign' 


  it 'should index' 


  it 'should index should include atom link' 


  context 'GET :export' do
    context 'with an authorized user to export the wiki' do
      before do
        session[:user_id] = 2
        get :export, params: { project_id: 'ecookbook' }
      end

      it { is_expected.to respond_with :success }
      it { should_assign_to :pages }
      it { should_respond_with_content_type 'text/html' }
      it 'should export all of the wiki pages to a single html file' 

    end

    context 'with an unauthorized user' do
      before do
        get :export, params: { project_id: 'ecookbook' }

        it { is_expected.to respond_with :redirect }
        it { is_expected.to redirect_to('wiki index') { { action: 'show', project_id: @project, id: nil } } }
      end
    end
  end

  context 'GET :date_index' do
    before do
      get :date_index, params: { project_id: 'ecookbook' }
    end

    it { is_expected.to respond_with :success }
    it { should_assign_to :pages }
    it { should_assign_to :pages_by_date }
    it { is_expected.to render_template 'wiki/date_index' }

    it 'should include atom link' 

  end

  it 'should not found' 


  it 'should protect page' 


  it 'should unprotect page' 


  it 'should show page with edit link' 


  it 'should show page without edit link' 


  it 'should edit unprotected page' 


  it 'should edit protected page by nonmember' 


  it 'should edit protected page by member' 


  it 'should history of non existing page should return 404' 

end

