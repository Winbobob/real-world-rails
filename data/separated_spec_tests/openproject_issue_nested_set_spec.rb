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
require 'legacy_spec_helper'

describe 'IssueNestedSet', type: :model do
  include MiniTest::Assertions # refute

  fixtures :all

  self.use_transactional_fixtures = false

  before do
    WorkPackage.delete_all
  end

  it 'should creating a child in different project should not validate unless allowed' 


  it 'should creating a child in different project should validate if allowed' 


  it 'should invalid move to another project' 


  it 'should moving an to a descendant should not validate' 


  it 'should moving an issue should keep valid relations only' 


  it 'should destroy should destroy children' 


  it 'should destroy parent work package updated during children destroy' 


  it 'should destroy child issue with children' 


  it 'should destroy issue with grand child' 


  it 'should parent dates should be lowest start and highest due dates' 


  it 'should parent done ratio should be average done ratio of leaves' 


  it 'should parent done ratio should be weighted by estimated times if any' 


  it 'should parent estimate should be sum of leaves' 


  it 'should move parent updates old parent attributes' 


  it 'should project copy should copy issue tree' 


  # Helper that creates an issue with default attributes
  def create_issue!(attributes = {})
    (i = WorkPackage.new.tap do |i|
      attr = { project_id: 1, type_id: 1, author_id: 1, subject: 'test' }.merge(attributes)
      i.attributes = attr
    end).save!
    i
  end
end

