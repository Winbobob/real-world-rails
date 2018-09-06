require 'spec_helper'

describe 'Work Package table group headers', js: true do
  let(:user) { FactoryGirl.create :admin }

  let(:project) { FactoryGirl.create(:project) }
  let(:category) { FactoryGirl.create :category, project: project, name: 'Foo' }
  let(:category2) { FactoryGirl.create :category, project: project, name: 'Bar' }

  let!(:wp_cat1) { FactoryGirl.create(:work_package, project: project, category: category) }
  let!(:wp_cat2) { FactoryGirl.create(:work_package, project: project, category: category2) }
  let!(:wp_none) { FactoryGirl.create(:work_package, project: project) }
  let(:wp_table) { Pages::WorkPackagesTable.new(project) }

  let!(:query) do
    query              = FactoryGirl.build(:query, user: user, project: project)
    query.column_names = ['subject', 'category']
    query.show_hierarchies = false

    query.save!
    query
  end

  before do
    login_as(user)

    wp_table.visit_query(query)
    wp_table.expect_work_package_listed(wp_cat1)
    wp_table.expect_work_package_listed(wp_cat2)
    wp_table.expect_work_package_listed(wp_none)
  end

  it 'shows group headers for group by category' 

end

