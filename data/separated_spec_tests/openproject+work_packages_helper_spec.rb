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

describe WorkPackagesHelper, type: :helper do
  let(:stub_work_package) { FactoryBot.build_stubbed(:work_package) }
  let(:stub_project) { FactoryBot.build_stubbed(:project) }
  let(:stub_type) { FactoryBot.build_stubbed(:type) }
  let(:stub_user) { FactoryBot.build_stubbed(:user) }

  describe '#link_to_work_package' do
    let(:open_status) { FactoryBot.build_stubbed(:status, is_closed: false) }
    let(:closed_status) { FactoryBot.build_stubbed(:status, is_closed: true) }

    before do
      stub_work_package.status = open_status
    end

    describe 'without parameters' do
      it 'should return a link to the work package with the id as the text' 


      it 'should return a link to the work package with type and id as the text if type is set' 


      it 'should additionally return the subject' 


      it 'should prepend an invisible closed information if the work package is closed' 

    end

    describe 'with the all_link option provided' do
      it 'should return a link to the work package with the type, id, and subject as the text' 

    end

    describe 'when truncating' do
      it 'should truncate the subject if the subject is longer than the specified amount' 


      it 'should not truncate the subject if the subject is shorter than the specified amount' 

    end

    describe 'when omitting the subject' do
      it 'should omit the subject' 

    end

    describe 'when omitting the type' do
      it 'should omit the type' 

    end

    describe 'with a project' do
      let(:text) { Regexp.new("^#{stub_project.name} -") }

      before do
        stub_work_package.project = stub_project
      end

      it 'should prepend the project if parameter set to true' 


      it 'should not have the project name if the parameter is missing/false' 

    end

    describe 'when only wanting the id' do
      it 'should return a link with the id as text only even if the work package has a type' 


      it 'should not have the subject as text' 

    end

    describe 'when only wanting the subject' do
      it 'should return a link with the subject as text' 

    end

    describe 'with the status displayed' do
      it 'should return a link with the status name contained in the text' 

    end
  end

  describe '#work_package_css_classes' do
    let(:statuses) { (1..5).map { |_i| FactoryBot.build_stubbed(:status) } }
    let(:priority) { FactoryBot.build_stubbed :priority, is_default: true }
    let(:status) { statuses[0] }
    let(:stub_work_package) {
      FactoryBot.build_stubbed(:work_package,
                                status: status,
                                priority: priority)
    }

    it 'should always have the work_package class' 


    it "should return the position of the work_package's status" 


    it "should return the position of the work_package's priority" 


    it 'should have a closed class if the work_package is closed' 


    it 'should not have a closed class if the work_package is not closed' 


    it 'should have an overdue class if the work_package is overdue' 


    it 'should not have an overdue class if the work_package is not overdue' 


    it 'should have a child class if the work_package is a child' 


    it 'should not have a child class if the work_package is not a child' 


    it 'should have a parent class if the work_package is a parent' 


    it 'should not have a parent class if the work_package is not a parent' 


    it 'should have a created-by-me class if the work_package is a created by the current user' 


    it 'should not have a created-by-me class if the work_package is not created by the current user' 


    it 'should not have a created-by-me class if the work_package is the current user is not logged in' 


    it 'should have a assigned-to-me class if the work_package is a created by the current user' 


    it 'should not have a assigned-to-me class if the work_package is not created by the current user' 


    it 'should not have a assigned-to-me class if the work_package is the current user is not logged in' 

  end
end

