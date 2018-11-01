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
  # Assertions
  def assert_number_of_items_in_menu(menu_name, count)
    assert Redmine::MenuManager.items(menu_name).size >= count, "Menu has less than #{count} items"
  end

  def assert_menu_contains_item_named(menu_name, item_name)
    assert Redmine::MenuManager.items(menu_name).map(&:name).include?(item_name.to_sym), "Menu did not have an item named #{item_name}"
  end

  # Helpers
  def get_menu_item(menu_name, item_name)
    Redmine::MenuManager.items(menu_name).find { |item| item.name == item_name.to_sym }
  end
end

describe Redmine do
  include RedmineMenuTestHelper

  it 'should top_menu' 


  it 'should account_menu' 


  it 'should application_menu' 


  it 'should admin_menu' 


  it 'should project_menu' 

end

