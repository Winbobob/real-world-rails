require 'spec_helper'

describe 'Modal focus in work package table', js: true do
  let(:user) { FactoryGirl.create :admin }

  let!(:project) { FactoryGirl.create(:project) }
  let!(:work_package) { FactoryGirl.create(:work_package, project: project) }
  let(:wp_table) { Pages::WorkPackagesTable.new(project) }
  let!(:query) do
    query = FactoryGirl.build(:query, user: user, project: project)
    query.show_hierarchies = false
    query.save!
    query
  end

  before do
    login_as user

    wp_table.visit_query query
    loading_indicator_saveguard
    find('#work-packages-settings-button').click
  end

  describe 'columns' do
    it 'sets the focus in the column selection' 

  end

  describe 'sorting' do
    it 'sets the focus in the sort selection' 

  end

  describe 'group by' do
    it 'sets the focus in the sort selection' 

  end
end

