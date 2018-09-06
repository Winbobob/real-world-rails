require "spec_helper"
require "support/pages/abstract_work_package"

describe "multi select custom values", js: true do
  let(:type) { FactoryGirl.create :type }
  let(:project) { FactoryGirl.create :project, types: [type] }

  let(:custom_field) do
    FactoryGirl.create(
      :list_wp_custom_field,
      name: "Ingredients",
      multi_value: true,
      types: [type],
      projects: [project],
      possible_values: ["ham", "onions", "pineapple", "mushrooms"]
    )
  end

  def custom_value_for(str)
    custom_field.custom_options.find { |co| co.value == str }.try(:id)
  end

  let(:wp_page) { Pages::FullWorkPackage.new work_package }
  let(:wp_table) { Pages::WorkPackagesTable.new project }
  let(:hierarchy) { ::Components::WorkPackages::Hierarchies.new }
  let(:columns) { ::Components::WorkPackages::Columns.new }
  let(:user) { FactoryGirl.create :admin }

  context "with existing custom values" do
    let(:work_package) do
      wp = FactoryGirl.create :work_package, project: project, type: type

      wp.custom_field_values = {
        custom_field.id => ["ham", "pineapple", "onions"].map { |s| custom_value_for(s) }
      }

      wp.save
      wp
    end

    let(:work_package2) do
      wp = FactoryGirl.create :work_package, project: project, type: type

      wp.custom_field_values = {
        custom_field.id => ["ham"].map { |s| custom_value_for(s) }
      }

      wp.save
      wp
    end

    describe 'in single view' do
      let(:edit_field) do
        field = wp_page.edit_field "customField#{custom_field.id}"
        field.field_type = 'select'
        field
      end

      before do
        login_as(user)

        wp_page.visit!
        wp_page.ensure_page_loaded
      end

      it "should be shown and allowed to be updated" 

    end

    describe 'in the WP table' do
      let(:edit_field) do
        field = wp_table.edit_field work_package, "customField#{custom_field.id}"
        field.field_type = 'select'
        field
      end

      before do
        work_package
        work_package2

        login_as(user)

        wp_table.visit!
        wp_table.expect_work_package_listed(work_package)
        wp_table.expect_work_package_listed(work_package2)

        columns.add custom_field.name
      end

      it 'should be usable in the table context' 

    end
  end
end

