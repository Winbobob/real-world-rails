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

describe ProjectsHelper, type: :helper do
  include ApplicationHelper
  include ProjectsHelper

  before do
    User.delete_all
    Version.delete_all
    Project.delete_all

    set_language_if_valid('en')
    User.current = nil
  end

  let(:test_project)  { FactoryGirl.create :valid_project }

  describe 'a version' do
    let(:version) { FactoryGirl.create :version, project: test_project }

    it 'can be formatted' 


    it 'can be formatted within a project' 


    it 'does not create a link, without permission' 


    describe 'with a valid user' do
      let(:user) { FactoryGirl.create :user, member_in_project: test_project }
      before do login_as(user) end

      it 'generates a link' 


      it 'generates a link within a project' 

    end

    describe 'when generating options-tags' do
      it 'generates nothing without a version' 


      it 'generates an option tag' 

    end
  end

  describe 'a system version' do
    let(:version) { FactoryGirl.create :version, project: test_project, sharing: 'system' }

    it 'can be formatted' 

  end

  describe 'an invalid version' do
    let(:version) { Object }

    it 'does not generate a link' 

  end
end

