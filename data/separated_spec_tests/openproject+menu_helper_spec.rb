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

describe Redmine::MenuManager::MenuHelper, type: :helper do
  include Redmine::MenuManager::MenuHelper
  include ::Rails::Dom::Testing::Assertions::SelectorAssertions
  fixtures :all

  # Used by assert_select
  def html_document
    Nokogiri::HTML(@response.body)
  end

  before do
    @response = ActionDispatch::TestResponse.new
    # Stub the current menu item in the controller
    def @controller.current_menu_item
      :index
    end
  end

  it 'should render single menu node' 


  it 'should render menu node' 


  it 'should render menu node with nested items' 


  it 'should render menu node with children' 


  it 'should render menu node with nested items and children' 


  it 'should render menu node with children without an array' 


  it 'should render menu node with incorrect children' 


  it 'should first level menu items for should yield all items if passed a block' 


  it 'should first level menu items for should return all items' 


  it 'should first level menu items for should skip unallowed items on a project' 


  it 'should first level menu items for should skip items that fail the conditions' 

end

