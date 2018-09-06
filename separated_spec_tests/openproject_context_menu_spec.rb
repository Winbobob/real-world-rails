require 'spec_helper'

describe 'Work package table context menu', js: true do
  let(:user) { FactoryGirl.create(:admin) }
  let(:work_package) { FactoryGirl.create(:work_package) }

  let(:wp_table) { Pages::WorkPackagesTable.new }
  let(:wp_timeline) { Pages::WorkPackagesTimeline.new(work_package.project) }
  let(:menu) { Components::WorkPackages::ContextMenu.new }

  def goto_context_menu
    # Go to table
    wp_table.visit!
    wp_table.expect_work_package_listed(work_package)

    # Open context menu
    menu.expect_closed
    menu.open_for(work_package)
  end

  before do
    login_as(user)
    work_package
  end

  it 'provides a context menu for a single work package' 


  context 'multiple selected' do
    let!(:work_package2) { FactoryGirl.create(:work_package) }

    before do
      # Go to table
      wp_table.visit!
      wp_table.expect_work_package_listed(work_package)
      wp_table.expect_work_package_listed(work_package2)

      # Select both
      wp_table.table_container.send_keys [:control, 'a']
    end

    it 'shows a subset of the available menu items' 

  end
end

