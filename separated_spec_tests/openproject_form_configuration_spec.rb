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
require 'features/projects/project_settings_page'

describe 'form configuration', type: :feature, js: true do
  let(:admin) { FactoryGirl.create :admin }
  let(:type) { FactoryGirl.create :type }

  let(:project) { FactoryGirl.create :project, types: [type] }
  let(:category) { FactoryGirl.create :category, project: project }
  let(:work_package) do
    FactoryGirl.create :work_package,
                       project: project,
                       type: type,
                       done_ratio: 10,
                       category: category
  end

  let(:wp_page) { Pages::FullWorkPackage.new(work_package) }

  let(:add_button) { page.find '.form-configuration--add-group' }
  let(:reset_button) { page.find '.form-configuration--reset' }
  let(:inactive_group) { page.find '#type-form-conf-inactive-group' }
  let(:inactive_drop) { page.find '#type-form-conf-inactive-group .attributes' }

  def group_selector(name)
    ".type-form-conf-group[data-key='#{name}']"
  end

  def checkbox_selector(attribute)
    ".type-form-conf-attribute[data-key='#{attribute}'] .attribute-visibility input"
  end

  def attribute_selector(attribute)
    ".type-form-conf-attribute[data-key='#{attribute}']"
  end

  def find_group_handle(label)
    page.find("#{group_selector(label)} .group-handle")
  end

  def find_attribute_handle(attribute)
    page.find("#{attribute_selector(attribute)} .attribute-handle")
  end

  def expect_attribute(key:, translation: nil)
    attribute = page.find(attribute_selector(key))

    unless translation.nil?
      expect(attribute).to have_selector('.attribute-name', text: translation)
    end
  end

  def move_to(attribute, group_label)
    handle = find_attribute_handle(attribute)
    group = find(group_selector(group_label))
    drag_and_drop(handle, group)
    expect_group(group_label, group_label, key: attribute)
  end

  def remove_attribute(attribute)
    attribute = page.find(attribute_selector(attribute))
    attribute.find('.delete-attribute').click
  end

  def drag_and_drop(handle, group)
    target = group.find('.attributes')

    scroll_to_element(group)
    page
      .driver
      .browser
      .action
      .move_to(handle.native)
      .click_and_hold(handle.native)
      .perform

    scroll_to_element(group)
    page
      .driver
      .browser
      .action
      .move_to(target.native)
      .release
      .perform
  end

  def add_group(name, expect: true)
    add_button.click
    input = find('.group-edit-in-place--input')
    input.set(name)
    input.send_keys(:return)

    expect_group(name, name) if expect
  end

  def rename_group(from, to)
    find('.group-edit-handler', text: from.upcase).click

    input = find('.group-edit-in-place--input')
    input.click
    input.set(to)
    input.send_keys(:return)

    expect(page).to have_selector('.group-edit-handler', text: to.upcase)
  end

  def expect_no_attribute(attribute, group)
    expect(page).not_to have_selector("#{group_selector(group)} #{attribute_selector(attribute)}")
  end

  def expect_group(label, translation, *attributes)
    expect(page).to have_selector("#{group_selector(label)} .group-edit-handler", text: translation.upcase)

    within group_selector(label) do
      attributes.each do |attribute|
        expect_attribute(attribute)
      end
    end
  end

  def expect_inactive(attribute)
    expect(inactive_drop).to have_selector(".type-form-conf-attribute[data-key='#{attribute}']")
  end

  describe "with EE token" do
    before do
      allow(EnterpriseToken).to receive(:allows_to?).and_return(false)
      allow(EnterpriseToken).to receive(:allows_to?).with(:edit_attribute_groups).and_return(true)
    end

    describe 'default configuration' do
      let(:dialog) { ::NgConfirmationDialog.new }
      before do
        login_as(admin)
        visit edit_type_tab_path(id: type.id, tab: "form_configuration")
      end

      it 'resets the form properly after changes' 


      it 'detects errors for duplicate group names' 


      it 'allows modification of the form configuration' 

    end

    describe 'required custom field' do
      let(:custom_fields) { [custom_field] }
      let(:custom_field) { FactoryGirl.create(:integer_issue_custom_field, is_required: true, name: 'MyNumber') }
      let(:cf_identifier) { "custom_field_#{custom_field.id}" }
      let(:cf_identifier_api) { "customField#{custom_field.id}" }

      before do
        project
        custom_field

        login_as(admin)
        visit edit_type_tab_path(id: type.id, tab: "form_configuration")
      end

      it 'shows the field' 

    end


    describe 'custom fields' do
      let(:project_settings_page) { ProjectSettingsPage.new(project) }

      let(:custom_fields) { [custom_field] }
      let(:custom_field) { FactoryGirl.create(:integer_issue_custom_field, name: 'MyNumber') }
      let(:cf_identifier) { "custom_field_#{custom_field.id}" }
      let(:cf_identifier_api) { "customField#{custom_field.id}" }

      before do
        project
        custom_field

        login_as(admin)
        visit edit_type_tab_path(id: type.id, tab: "form_configuration")

        # Should be initially disabled
        expect_inactive(cf_identifier)

        # Add into new group
        add_group('New Group')
        move_to(cf_identifier, 'New Group')

        # Make visible
        expect_attribute(key: cf_identifier)

        page.execute_script('jQuery(".form-configuration--save").click()')
        expect(page).to have_selector('.flash.notice', text: 'Successful update.', wait: 10)
      end

      context 'inactive in project' do
        it 'can be added to the type, but is not shown' 

      end

      context 'active in project' do
        let(:project) do
          FactoryGirl.create :project,
                             types: [type],
                             work_package_custom_fields: custom_fields
        end

        it 'can be added to type and is visible' 

      end
    end
  end

  describe "without EE token" do
    let(:dialog) { ::NgConfirmationDialog.new }

    it "should disable adding and renaming groups" 

  end
end

