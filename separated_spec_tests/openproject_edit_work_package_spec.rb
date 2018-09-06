require 'spec_helper'
require 'features/page_objects/notification'

describe 'edit work package', js: true do
  let(:dev_role) do
    FactoryGirl.create :role,
                       permissions: [:view_work_packages,
                                     :add_work_packages]
  end
  let(:dev) do
    FactoryGirl.create :user,
                       firstname: 'Dev',
                       lastname: 'Guy',
                       member_in_project: project,
                       member_through_role: dev_role
  end
  let(:manager_role) do
    FactoryGirl.create :role,
                       permissions: [:view_work_packages,
                                     :edit_work_packages]
  end
  let(:manager) do
    FactoryGirl.create :admin,
                       firstname: 'Manager',
                       lastname: 'Guy',
                       member_in_project: project,
                       member_through_role: manager_role
  end

  let(:cf_all) do
    FactoryGirl.create :work_package_custom_field, is_for_all: true, field_format: 'text'
  end

  let(:cf_tp1) do
    FactoryGirl.create :work_package_custom_field, is_for_all: true, field_format: 'text'
  end

  let(:cf_tp2) do
    FactoryGirl.create :work_package_custom_field, is_for_all: true, field_format: 'text'
  end

  let(:type) { FactoryGirl.create :type, custom_fields: [cf_all, cf_tp1] }
  let(:type2) { FactoryGirl.create :type, custom_fields: [cf_all, cf_tp2] }
  let(:project) { FactoryGirl.create(:project, types: [type, type2]) }
  let(:work_package) {
    work_package = FactoryGirl.create(:work_package,
                                      author: dev,
                                      project: project,
                                      type: type,
                                      created_at: 5.days.ago.to_date.to_s(:db))

    note_journal = work_package.journals.last
    note_journal.update_attributes(created_at: 5.days.ago.to_date.to_s)

    work_package
  }
  let(:status) { work_package.status }

  let(:new_subject) { 'Some other subject' }
  let(:wp_page) { Pages::FullWorkPackage.new(work_package) }
  let(:priority2) { FactoryGirl.create :priority }
  let(:status2) { FactoryGirl.create :status }
  let(:workflow) do
    FactoryGirl.create :workflow,
                       type_id: type2.id,
                       old_status: work_package.status,
                       new_status: status2,
                       role: manager_role
  end
  let(:version) { FactoryGirl.create :version, project: project }
  let(:category) { FactoryGirl.create :category, project: project }

  let(:visit_before) { true }

  def visit!
    wp_page.visit!
    wp_page.ensure_page_loaded
  end

  before do
    login_as(manager)

    manager
    dev
    priority2
    workflow
    status

    if visit_before
      visit!
    end
  end

  context 'with progress' do
    let(:visit_before) { false }

    before do
      work_package.update done_ratio: 42
      visit!
    end

    it 'does not hide empty progress while it is being edited' 

  end

  it 'allows updating and seeing the results' 


  it 'correctly assigns and un-assigns users' 


  context 'switching to custom field with required CF' do
    let(:custom_field) {
      FactoryGirl.create(
        :work_package_custom_field,
        field_format: 'string',
        default_value: nil,
        is_required:  true,
        is_for_all:   true
      )
    }
    let!(:type2) { FactoryGirl.create(:type, custom_fields: [custom_field]) }

    it 'shows the required field when switching' 

  end

  it 'allows the user to add a comment to a work package with previewing the stuff before' 


  it 'updates the presented custom fields based on the selected type' 


  it 'shows an error if a subject is entered which is too long' 


  it 'submits the edit mode when pressing enter' 

end

