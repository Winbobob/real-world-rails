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
require 'projects_controller'

describe ProjectsController, type: :controller do
  include MiniTest::Assertions # refute

  render_views

  fixtures :all

  before do
    session[:user_id] = nil
    Setting.default_language = 'en'
  end

  it 'should index' 


  context '#index' do
    context 'by non-admin user without view_time_entries permission' do
      before do
        Role.find(2).remove_permission! :view_time_entries
        Role.non_member.remove_permission! :view_time_entries
        Role.anonymous.remove_permission! :view_time_entries
        session[:user_id] = 3
      end
      it 'should not show overall spent time link' 

    end
  end

  context '#new' do
    context 'by admin user' do
      before do
        session[:user_id] = 1
      end

      it 'should accept get' 

    end

    context 'by non-admin user with add_project permission' do
      before do
        Role.non_member.add_permission! :add_project
        session[:user_id] = 9
      end

      it 'should accept get' 

    end

    context 'by non-admin user with add_subprojects permission' do
      before do
        Role.find(1).remove_permission! :add_project
        Role.find(1).add_permission! :add_subprojects
        session[:user_id] = 2
      end

      it 'should accept get' 

    end
  end

  context 'POST :create' do
    context 'by admin user' do
      before do
        session[:user_id] = 1
      end

      it 'should create a new project' 


      it 'should create a new subproject' 

    end

    context 'by non-admin user with add_project permission' do
      before do
        Role.non_member.add_permission! :add_project
        session[:user_id] = 9
      end

      it 'should accept create a Project' 


      it 'should fail with parent_id' 

    end

    context 'by non-admin user with add_subprojects permission' do
      before do
        Role.find(1).remove_permission! :add_project
        Role.find(1).add_permission! :add_subprojects
        session[:user_id] = 2
      end

      it 'should create a project with a parent_id' 


      it 'should fail without parent_id' 


      it 'should fail with unauthorized parent_id' 

    end
  end

  context 'with default modules',
          with_settings: { default_projects_modules: %w(work_package_tracking repository) } do
    it 'should create should preserve modules on validation failure' 

  end

  it 'should show by id' 


  it 'should show by identifier' 


  it 'should show should not display hidden custom fields' 


  it 'should show should not fail when custom values are nil' 


  def show_archived_project_should_be_denied
    project = Project.find_by(identifier: 'ecookbook')
    project.archive!

    get :show, params: { id: 'ecookbook' }
    assert_response 403
    assert_nil assigns(:project)
    assert_select 'p', content: /archived/
  end

  it 'should private subprojects hidden' 


  it 'should private subprojects visible' 


  it 'should update' 


  it 'should modules' 


  it 'should get destroy info' 


  it 'should post destroy' 


  it 'should archive' 


  it 'should unarchive' 


  it 'should jump should redirect to active tab' 


  it 'should jump should not redirect to inactive tab' 


  it 'should jump should not redirect to unknown tab' 


  context 'with hooks' do
    # A hook that is manually registered later
    class ProjectBasedTemplate < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context)
        context[:controller].send(:render, html: '<p id="hookselector">Hello from hook!</p>'.html_safe)
      end
    end

    before do
      # Don't use this hook now
      Redmine::Hook.clear_listeners
    end

    after do
      Redmine::Hook.clear_listeners
    end

    it 'should hook response' 

  end
end

