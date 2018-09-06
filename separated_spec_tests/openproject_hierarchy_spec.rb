require 'spec_helper'

describe 'Work Package table hierarchy', js: true do
  let(:user) { FactoryGirl.create :admin }
  let(:project) { FactoryGirl.create(:project) }

  let(:wp_table) { Pages::WorkPackagesTable.new(project) }
  let(:hierarchy) { ::Components::WorkPackages::Hierarchies.new }

  before do
    login_as(user)
  end

  describe 'hierarchies in same project' do
    let(:category) { FactoryGirl.create :category, project: project, name: 'Foo' }

    let!(:wp_root) { FactoryGirl.create(:work_package, project: project) }
    let!(:wp_inter) { FactoryGirl.create(:work_package, project: project, parent: wp_root) }
    let!(:wp_leaf) { FactoryGirl.create(:work_package, project: project, category: category, parent: wp_inter) }
    let!(:wp_other) { FactoryGirl.create(:work_package, project: project) }

    let!(:query) do
      query              = FactoryGirl.build(:query, user: user, project: project)
      query.column_names = ['subject', 'category']
      query.filters.clear
      query.add_filter('category_id', '=', [category.id])
      query.show_hierarchies = true

      query.save!
      query
    end

    it 'shows hierarchy correctly' 

  end

  describe 'with a cross project hierarchy' do
    let(:project2) { FactoryGirl.create(:project) }
    let!(:wp_root) { FactoryGirl.create(:work_package, project: project) }
    let!(:wp_inter) { FactoryGirl.create(:work_package, project: project2, parent: wp_root) }
    let(:global_table) { Pages::WorkPackagesTable.new }
    it 'shows the hierarchy indicator only when the rows are both shown' 

  end

  describe 'flat table such that the parent appears below the child' do
    let!(:wp_root) { FactoryGirl.create(:work_package, project: project) }
    let!(:wp_inter) { FactoryGirl.create(:work_package, project: project, parent: wp_root) }
    let!(:wp_leaf) { FactoryGirl.create(:work_package, project: project, parent: wp_inter) }

    let!(:query) do
      query              = FactoryGirl.build(:query, user: user, project: project)
      query.column_names = ['subject', 'category']
      query.filters.clear
      query.show_hierarchies = false

      query.save!
      query
    end

    it 'removes the parent from the flow in hierarchy mode, moving it above' 

  end

  describe 'sorting by assignee' do
    include_context 'work package table helpers'
    let!(:root_assigned) do
      FactoryGirl.create(:work_package, subject: 'root_assigned', project: project, assigned_to: user)
    end
    let!(:inter_assigned) do
      FactoryGirl.create(:work_package, subject: 'inter_assigned', project: project, assigned_to: user, parent: root_assigned)
    end
    let!(:inter) do
      FactoryGirl.create(:work_package, subject: 'inter', project: project, parent: root_assigned)
    end
    let!(:leaf_assigned) do
      FactoryGirl.create(:work_package, subject: 'leaf_assigned', project: project, assigned_to: user, parent: inter)
    end
    let!(:leaf) do
      FactoryGirl.create(:work_package, subject: 'leaf', project: project, parent: inter)
    end
    let!(:root) do
      FactoryGirl.create(:work_package, project: project)
    end

    let(:user) do
      FactoryGirl.create :user,
                         member_in_project: project,
                         member_through_role: role
    end
    let(:permissions) { %i(view_work_packages add_work_packages) }
    let(:role) { FactoryGirl.create :role, permissions: permissions }

    let!(:query) do
      query              = FactoryGirl.build(:query, user: user, project: project)
      query.column_names = ['subject', 'assigned_to']
      query.filters.clear
      query.sort_criteria = [['assigned_to', 'asc']]
      query.show_hierarchies = false

      query.save!
      query
    end

    it 'shows the respective order' 

  end
end

