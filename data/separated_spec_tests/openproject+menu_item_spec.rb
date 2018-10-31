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
require 'legacy_spec_helper'

module RedmineMenuTestHelper
  # Helpers
  def get_menu_item(menu_name, item_name)
    Redmine::MenuManager.items(menu_name).find { |item| item.name == item_name.to_sym }
  end
end

describe Redmine::MenuManager::MenuItem do
  include RedmineMenuTestHelper

  Redmine::MenuManager.map :test_menu do |menu|
    menu.push(:parent, '/test', {})
    menu.push(:child_menu, '/test',  parent: :parent)
    menu.push(:child2_menu, '/test',  parent: :parent)
  end

  # context new menu item
  it 'should new menu item should require a name' 


  it 'should new menu item should require an url' 


  it 'should new menu item should require the options' 


  it 'should new menu item with all required parameters' 


  it 'should new menu item should require a proc to use for the if condition' 


  it 'should new menu item should allow a hash for extra html options' 


  it 'should new menu item should require a proc to use the children option' 


  it 'should new should not allow setting the parent item to the current item' 


  it 'should has children' 

end

