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

describe Redmine::MenuManager::Mapper do

  it 'should push onto root' 


  it 'should push onto parent' 


  it 'should push onto grandparent' 


  it 'should push first' 


  it 'should push before' 


  it 'should push after' 


  it 'should push last' 


  it 'should exists for child node' 


  it 'should exists for invalid node' 


  it 'should find' 


  it 'should find missing' 


  it 'should delete' 


  it 'should delete missing' 


  specify 'deleting all items' do
    # Exposed by deleting :last items
    Redmine::MenuManager.map :test_menu do |menu|
      menu.push :not_last, OpenProject::Static::Links.help_link
      menu.push :administration, { controller: 'projects', action: 'show' }, last: true
      menu.push :help, OpenProject::Static::Links.help_link, last: true
    end

    expect {
      Redmine::MenuManager.map :test_menu do |menu|
        menu.delete(:administration)
        menu.delete(:help)
        menu.push :test_overview, { controller: 'projects', action: 'show' }, {}
      end
    }.not_to raise_error
  end
end

