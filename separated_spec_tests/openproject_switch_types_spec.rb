require 'spec_helper'

describe 'Switching types in work package table', js: true do
  let(:user) { FactoryGirl.create :admin }

  describe 'switching to required CF' do
    let(:cf_req_text) {
      FactoryGirl.create(
        :work_package_custom_field,
        field_format: 'string',
        is_required: true,
        is_for_all: false
      )
    }
    let(:cf_text) {
      FactoryGirl.create(
        :work_package_custom_field,
        field_format: 'string',
        is_required: false,
        is_for_all: false
      )
    }

    let(:type_task) { FactoryGirl.create(:type_task, custom_fields: [cf_text]) }
    let(:type_bug) { FactoryGirl.create(:type_bug, custom_fields: [cf_req_text]) }

    let(:project) {
      FactoryGirl.create(
        :project,
        types: [type_task, type_bug],
        work_package_custom_fields: [cf_text, cf_req_text]
      )
    }
    let(:work_package) do
      FactoryGirl.create(:work_package,
                         subject: 'Foobar',
                         type: type_task,
                         project: project)
    end
    let(:wp_table) { Pages::WorkPackagesTable.new(project) }

    let(:query) do
      query = FactoryGirl.build(:query, user: user, project: project)
      query.column_names = ['subject', 'type', "cf_#{cf_text.id}"]

      query.save!
      query
    end

    let(:type_field) { wp_table.edit_field(work_package, :type) }
    let(:text_field) { wp_table.edit_field(work_package, :customField1) }
    let(:req_text_field) { wp_table.edit_field(work_package, :customField2) }

    before do
      login_as(user)
      query
      project
      work_package

      wp_table.visit_query(query)
      wp_table.expect_work_package_listed(work_package)
    end

    it 'switches the types correctly' 


    context 'switching to single view' do
      let(:wp_split) { wp_table.open_split_view(work_package) }
      let(:type_field) { wp_split.edit_field(:type) }
      let(:text_field) { wp_split.edit_field(:customField1) }
      let(:req_text_field) { wp_split.edit_field(:customField2) }

      it 'allows editing and cancelling the new required fields' 

    end
  end

  describe 'switching to required bool CF with default value' do
    let(:cf_req_bool) {
      FactoryGirl.create(
        :work_package_custom_field,
        field_format: 'bool',
        is_required: true,
        default_value: false
      )
    }

    let(:type_task) { FactoryGirl.create(:type_task) }
    let(:type_bug) { FactoryGirl.create(:type_bug, custom_fields: [cf_req_bool]) }

    let(:project) {
      FactoryGirl.create(
        :project,
        types: [type_task, type_bug],
        work_package_custom_fields: [cf_req_bool]
      )
    }
    let(:work_package) do
      FactoryGirl.create(:work_package,
                         subject: 'Foobar',
                         type: type_task,
                         project: project)
    end
    let(:wp_page) { Pages::FullWorkPackage.new(work_package) }
    let(:type_field) { wp_page.edit_field :type }

    before do
      login_as user
      wp_page.visit!
      wp_page.ensure_page_loaded
    end

    it  'can switch to the bug type without errors' do
      type_field.expect_state_text type_task.name
      type_field.update type_bug.name

      # safegurards
      wp_page.expect_notification message: 'Successful update.'
      wp_page.dismiss_notification!
      wp_page.expect_no_notification message: 'Successful update.'

      type_field.expect_state_text type_bug.name

      work_package.reload
      expect(work_package.type_id).to eq(type_bug.id)
      expect(work_package.send("custom_field_#{cf_req_bool.id}")).to eq(false)
    end
  end

  describe 'switching to list CF' do
    let!(:wp_page) { Pages::FullWorkPackageCreate.new }
    let!(:type_with_cf) { FactoryGirl.create(:type_task, custom_fields: [custom_field]) }
    let!(:type) { FactoryGirl.create(:type_bug) }
    let(:permissions) { %i(view_work_packages add_work_packages) }
    let(:role) { FactoryGirl.create :role, permissions: permissions }
    let(:user) do
      FactoryGirl.create :user,
                         member_in_project: project,
                         member_through_role: role
    end

    before do
      workflow
      login_as user
    end

    let(:custom_field) do
      FactoryGirl.create(
        :list_wp_custom_field,
        name: "Ingredients",
        multi_value: true,
        possible_values: ["ham", "onions", "pineapple", "mushrooms"]
      )
    end

    let!(:project) do
      FactoryGirl.create(
        :project,
        types: [type, type_with_cf],
        work_package_custom_fields: [custom_field]
      )
    end
    let!(:status) { FactoryGirl.create(:default_status) }
    let!(:workflow) do
      FactoryGirl.create :workflow,
                         type_id: type.id,
                         old_status: status,
                         new_status: FactoryGirl.create(:status),
                         role: role
    end

    let!(:priority) { FactoryGirl.create :priority, is_default: true }

    let(:cf_edit_field) do
      field = wp_page.edit_field "customField#{custom_field.id}"
      field.field_type = 'select'
      field
    end

    before do
      login_as(user)

      visit new_project_work_packages_path(project.identifier, type: type.id)
    end

    it 'can switch to the type with CF list' 

  end
end

