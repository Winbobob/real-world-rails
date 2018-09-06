require 'spec_helper'

describe 'Inline editing milestones', js: true do
  let(:user) { FactoryGirl.create :admin }

  let(:type) { FactoryGirl.create :type, is_milestone: true }
  let(:project) { FactoryGirl.create(:project, types: [type]) }
  let!(:work_package) {
    FactoryGirl.create(:work_package,
                       project: project,
                       type:    type,
                       subject: 'Foobar')
  }

  let!(:wp_table) { Pages::WorkPackagesTable.new(project) }
  let!(:query) do
    query              = FactoryGirl.build(:query, user: user, project: project)
    query.column_names = ['subject', 'start_date', 'due_date']
    query.filters.clear
    query.show_hierarchies = false

    query.save!
    query
  end

  before do
    login_as(user)

    wp_table.visit_query query
    wp_table.expect_work_package_listed work_package
  end

  it 'mapping for start and due date in the table (regression #26044)' 

end

