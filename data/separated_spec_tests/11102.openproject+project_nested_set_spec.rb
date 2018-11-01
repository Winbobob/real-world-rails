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

describe 'ProjectNestedSet', type: :model do
  context 'nested set' do
    before do
      FactoryBot.create(:type_standard)
      Project.delete_all

      @a = Project.create!(name: 'Project A', identifier: 'projecta')
      @a1 = Project.create!(name: 'Project A1', identifier: 'projecta1')
      @a1.set_parent!(@a)
      @a2 = Project.create!(name: 'Project A2', identifier: 'projecta2')
      @a2.set_parent!(@a)

      @b = Project.create!(name: 'Project B', identifier: 'projectb')
      @b1 = Project.create!(name: 'Project B1', identifier: 'projectb1')
      @b1.set_parent!(@b)
      @b11 = Project.create!(name: 'Project B11', identifier: 'projectb11')
      @b11.set_parent!(@b1)
      @b2 = Project.create!(name: 'Project B2', identifier: 'projectb2')
      @b2.set_parent!(@b)

      @c = Project.create!(name: 'Project C', identifier: 'projectc')
      @c1 = Project.create!(name: 'Project C1', identifier: 'projectc1')
      @c1.set_parent!(@c)

      [@a, @a1, @a2, @b, @b1, @b11, @b2, @c, @c1].each(&:reload)
    end

    context '#create' do
      it 'should build valid tree' 

    end

    context '#set_parent!' do
      it 'should keep valid tree' 

    end

    context '#destroy' do
      context 'a root with children' do
        it 'should not mess up the tree' 

      end

      context 'a child with children' do
        it 'should not mess up the tree' 

      end
    end
  end

  def assert_nested_set_values(h)
    assert Project.valid?
    h.each do |project, expected|
      project.reload
      assert_equal expected, [project.parent_id, project.lft, project.rgt], "Unexpected nested set values for #{project.name}"
    end
  end
end

