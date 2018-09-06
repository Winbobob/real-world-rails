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

require 'spec_helper'

RSpec.feature 'Work package timeline navigation', js: true, selenium: true do
  let(:user) { FactoryGirl.create(:admin) }
  let(:project) { FactoryGirl.create(:project) }
  let(:wp_timeline) { Pages::WorkPackagesTimeline.new(project) }
  let(:settings_menu) { Components::WorkPackages::SettingsMenu.new }

  let(:work_package) do
    FactoryGirl.create :work_package,
                       project: project,
                       start_date: Date.today,
                       due_date: (Date.today + 5.days)
  end

  before do
    work_package
    login_as(user)
  end

  it 'can save the open state and zoom of timeline' 


  describe 'with a hierarchy being shown' do
    let!(:child_work_package) do
      FactoryGirl.create :work_package,
                         project: project,
                         parent: work_package,
                         start_date: Date.today,
                         due_date: (Date.today + 5.days)
    end
    let(:hierarchy) { ::Components::WorkPackages::Hierarchies.new }

    it 'toggles the hierarchy in both views' 

  end

  describe 'when table is grouped' do
    let(:project) { FactoryGirl.create(:project) }
    let(:category) { FactoryGirl.create :category, project: project, name: 'Foo' }
    let(:category2) { FactoryGirl.create :category, project: project, name: 'Bar' }
    let(:wp_table) { Pages::WorkPackagesTable.new(project) }
    let(:relations) { ::Components::WorkPackages::Relations.new(wp_cat1) }

    let!(:wp_cat1) do
      FactoryGirl.create :work_package,
                         project: project,
                         category: category,
                         start_date: Date.today,
                         due_date: (Date.today + 5.days)
    end
    let!(:wp_cat2) do
      FactoryGirl.create :work_package,
                         project: project,
                         category: category2,
                         start_date: Date.today + 5.days,
                         due_date: (Date.today + 10.days)
    end
    let!(:wp_none) do
      FactoryGirl.create :work_package,
                         project: project
    end

    let!(:relation) do
      FactoryGirl.create(:relation,
                         from: wp_cat1,
                         to: wp_cat2,
                         relation_type: Relation::TYPE_FOLLOWS)
    end

    let!(:query) do
      query              = FactoryGirl.build(:query, user: user, project: project)
      query.column_names = ['subject', 'category']
      query.show_hierarchies = false
      query.timeline_visible = true

      query.save!
      query
    end

    it 'mirrors group handling when grouping by category' 


    it 'removes the relation element when removed in split screen' 

  end
end

