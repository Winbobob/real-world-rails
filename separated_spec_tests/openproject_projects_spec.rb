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
require 'features/projects/projects_page'

describe 'Projects', type: :feature do
  let(:current_user) { FactoryGirl.create(:admin) }

  before do
    allow(User).to receive(:current).and_return current_user
  end

  describe 'creation', js: true do
    let!(:project) { FactoryGirl.create(:project, name: 'Foo project', identifier: 'foo-project') }

    before do
      visit admin_index_path
    end

    it 'can create a project' 


    context 'work_packages module disabled',
            with_settings: { default_projects_modules: %q(wiki) } do
      it 'creates a project and redirects to settings' 

    end

    it 'can create a subproject' 


    it 'does not create a project with an already existing identifier' 



  end

  describe 'project types' do
    let(:phase_type)     { FactoryGirl.create(:type, name: 'Phase', is_default: true) }
    let(:milestone_type) { FactoryGirl.create(:type, name: 'Milestone', is_default: false) }
    let!(:project) { FactoryGirl.create(:project, name: 'Foo project', types: [phase_type, milestone_type]) }

    it "have the correct types checked for the project's types" 

  end

  describe 'deletion', js: true do
    let(:project) { FactoryGirl.create(:project) }
    let(:projects_page) { ProjectsPage.new(project) }

    before do
      projects_page.visit_confirm_destroy
    end

    describe 'disable delete w/o confirm' do
      it { expect(page).to have_css('.danger-zone .button[disabled]') }
    end

    describe 'disable delete with wrong input' do
      let(:input) { find('.danger-zone input') }
      it do
        input.set 'Not the project name'
        expect(page).to have_css('.danger-zone .button[disabled]')
      end
    end

    describe 'enable delete with correct input' do
      let(:input) { find('.danger-zone input') }
      it do
        input.set project.name
        expect(page).to have_css('.danger-zone .button:not([disabled])')
      end
    end
  end

  describe 'identifier edit', js: true do
    let!(:project) { FactoryGirl.create(:project, identifier: 'foo') }

    it 'updates the project identifier' 


    it 'displays error messages on invalid input' 

  end

  describe 'form', js: true do
    let(:project) { FactoryGirl.build(:project, name: 'Foo project', identifier: 'foo-project') }
    let!(:optional_custom_field) do
      FactoryGirl.create(:custom_field, name: 'Optional Foo',
                                        type: ProjectCustomField,
                                        is_for_all: true)
    end
    let!(:required_custom_field) do
      FactoryGirl.create(:custom_field, name: 'Required Foo',
                                        type: ProjectCustomField,
                                        is_for_all: true,
                                        is_required: true)
    end

    it 'seperates optional and required custom fields for new' 


    it 'shows optional and required custom fields for edit without an seperation' 

  end
end

