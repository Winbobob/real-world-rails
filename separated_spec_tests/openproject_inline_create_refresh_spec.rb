require 'spec_helper'

describe 'Refreshing in inline-create row', js: true do
  let(:user) { FactoryGirl.create :admin }
  let(:project) { FactoryGirl.create :project }

  let(:work_packages_page) { WorkPackagesPage.new(project) }
  let(:wp_table) { Pages::WorkPackagesTable.new(project) }

  let!(:query) do
    query              = FactoryGirl.build(:query, user: user, project: project)
    query.column_names = ['subject', 'category']
    query.filters.clear

    query.save!
    query
  end

  before do
    login_as user
    wp_table.visit_query(query)
  end


  it 'correctly updates the set of active columns' 

end

