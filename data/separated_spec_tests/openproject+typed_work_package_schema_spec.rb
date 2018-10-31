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

require 'spec_helper'

describe ::API::V3::WorkPackages::Schema::TypedWorkPackageSchema do
  let(:project) { FactoryBot.build(:project) }
  let(:type) { FactoryBot.build(:type) }

  let(:current_user) { double }
  subject { described_class.new(project: project, type: type) }

  it 'has the project set' 


  it 'has the type set' 


  it 'does not know assignable statuses' 


  it 'does not know assignable versions' 


  describe '#writable?' do
    it 'percentage done is writable' 


    it 'estimated time is writable' 


    it 'start date is writable' 


    it 'finish date is writable' 

  end

  describe '#milestone?' do
    before do
      allow(type)
        .to receive(:is_milestone?)
              .and_return(true)
    end

    it 'is the value the type has' 


    it 'has a writable date' 

  end

  describe '#assignable_custom_field_values' do
    let(:list_cf) { FactoryBot.build_stubbed(:list_wp_custom_field) }
    let(:version_cf) { FactoryBot.build_stubbed(:version_wp_custom_field) }

    it 'is nil for a list cf' 


    it 'is nil for a version cf' 

  end
end

