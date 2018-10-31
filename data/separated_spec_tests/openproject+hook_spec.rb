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
require_relative '../../../legacy_spec_helper'

describe 'Redmine::Hook::Manager' do # FIXME: naming (RSpec-port)
  fixtures :all

  # Some hooks that are manually registered in these tests
  class TestHook < Redmine::Hook::ViewListener; end

  class TestHook1 < TestHook
    def view_layouts_base_html_head(_context)
      'Test hook 1 listener.'
    end
  end

  class TestHook2 < TestHook
    def view_layouts_base_html_head(_context)
      'Test hook 2 listener.'
    end
  end

  class TestHook3 < TestHook
    def view_layouts_base_html_head(context)
      "Context keys: #{context.keys.map(&:to_s).sort.join(', ')}."
    end
  end

  class TestLinkToHook < TestHook
    def view_layouts_base_html_head(_context)
      link_to('Issues', controller: '/work_packages')
    end
  end

  class TestHookHelperController < ActionController::Base
    include HookHelper
  end

  class TestHookHelperView < ActionView::Base
    include HookHelper
  end

  Redmine::Hook.clear_listeners

  before do
    @hook_module = Redmine::Hook
  end

  after do
    @hook_module.clear_listeners
  end

  it 'should clear_listeners' 


  it 'should add_listener' 


  it 'should call_hook' 


  it 'should call_hook_with_context' 


  it 'should call_hook_with_multiple_listeners' 


  # Context: HookHelper.call_hook default_url
  it 'should call_hook_default_url_options' 


  # Context: HookHelper.call_hook
  it 'should call_hook_with_project_added_to_context' 


  it 'should call_hook_from_controller_with_controller_added_to_context' 


  it 'should call_hook_from_controller_with_request_added_to_context' 


  it 'should call_hook_from_view_with_project_added_to_context' 


  it 'should call_hook_from_view_with_controller_added_to_context' 


  it 'should call_hook_from_view_with_request_added_to_context' 


  it 'should call_hook_from_view_should_join_responses_with_a_space' 


  it 'should call_hook_should_not_change_the_default_url_for_email_notifications' 


  def hook_helper
    @hook_helper ||= TestHookHelperController.new
  end

  def view_hook_helper
    @view_hook_helper ||= TestHookHelperView.new(Rails.root.to_s + '/app/views')
  end
end

