require 'spec_helper'

describe 'Work package relations tab', js: true, selenium: true do
  include_context 'ui-autocomplete helpers'

  let(:user) { FactoryGirl.create :admin }

  let(:project) { FactoryGirl.create :project }
  let(:work_package) { FactoryGirl.create(:work_package, project: project) }
  let(:work_packages_page) { ::Pages::SplitWorkPackage.new(work_package) }
  let(:relations) { ::Components::WorkPackages::Relations.new(work_package) }

  let(:visit) { true }

  before do
    login_as user

    if visit
      visit_relations
    end
  end

  def visit_relations
    work_packages_page.visit_tab!('relations')
    work_packages_page.expect_subject
    loading_indicator_saveguard
  end

  def add_hierarchy(container, query, expected_text)
    # Locate the create row container
    container = find(container)

    # Enter the query and select the child
    autocomplete = container.find(".wp-relations--autocomplete")
    select_autocomplete(autocomplete, query: query, select_text: expected_text)

    container.find('.wp-create-relation--save').click

    expect(page).to have_selector('.wp-relations-hierarchy-subject',
                                  text: expected_text,
                                  wait: 10)
  end

  def remove_hierarchy(selector, removed_text)
    expect(page).to have_selector(selector, text: removed_text)
    container = find(selector)
    container.hover

    container.find('.wp-relation--remove').click
    expect(page).to have_no_selector(selector, text: removed_text, wait: 10)
  end

  describe 'as admin' do
    let!(:parent) { FactoryGirl.create(:work_package, project: project) }
    let!(:child) { FactoryGirl.create(:work_package, project: project) }
    let!(:child2) { FactoryGirl.create(:work_package, project: project, subject: 'Something new') }

    it 'allows to mange hierarchy' 

  end

  describe 'relation group-by toggler' do
    let(:project) { FactoryGirl.create :project, types: [type_1, type_2] }
    let(:type_1) { FactoryGirl.create :type }
    let(:type_2) { FactoryGirl.create :type }

    let(:to_1) { FactoryGirl.create(:work_package, type: type_1, project: project) }
    let(:to_2) { FactoryGirl.create(:work_package, type: type_2, project: project) }

    let!(:relation_1) do
      FactoryGirl.create :relation,
                         from: work_package,
                         to: to_1,
                         relation_type: :follows
    end
    let!(:relation_2) do
      FactoryGirl.create :relation,
                         from: work_package,
                         to: to_2,
                         relation_type: :relates
    end

    let(:toggle_btn_selector) { '#wp-relation-group-by-toggle' }
    let(:visit) { false }

    it 'allows to toggle how relations are grouped' 

  end

  describe 'with limited permissions' do
    let(:permissions) { %i(view_work_packages) }
    let(:user_role) do
      FactoryGirl.create :role, permissions: permissions
    end

    let(:user) do
      FactoryGirl.create :user,
                         member_in_project: project,
                         member_through_role: user_role
    end

    context 'as view-only user, with parent set' do
      let(:parent) { FactoryGirl.create(:work_package, project: project) }
      let(:work_package) { FactoryGirl.create(:work_package, parent: parent, project: project) }

      it 'shows no links to create relations' 

    end

    context 'with manage_subtasks permissions' do
      let(:permissions) { %i(view_work_packages manage_subtasks) }
      let!(:parent) { FactoryGirl.create(:work_package, project: project) }
      let!(:child) { FactoryGirl.create(:work_package, project: project) }

      it 'should be able to link parent and children' 

    end

    context 'with relations permissions' do
      let(:permissions) do
        %i(view_work_packages add_work_packages manage_subtasks manage_work_package_relations)
      end

      let!(:relatable) { FactoryGirl.create(:work_package, project: project) }
      it 'should allow to manage relations' 


      it 'should allow to move between split and full view (Regression #24194)' 


      it 'should allow to change relation descriptions' 

    end
  end
end

