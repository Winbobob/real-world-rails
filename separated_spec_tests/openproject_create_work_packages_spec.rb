require 'spec_helper'

describe 'inline create work package', js: true do
  let(:type) { FactoryGirl.create(:type) }
  let(:types) { [type] }

  let(:permissions) { %i(view_work_packages add_work_packages)}
  let(:role) { FactoryGirl.create :role, permissions: permissions }
  let(:user) do
    FactoryGirl.create :user,
                       member_in_project: project,
                       member_through_role: role
  end
  let(:status) { FactoryGirl.create(:default_status) }
  let(:workflow) do
    FactoryGirl.create :workflow,
                       type_id: type.id,
                       old_status: status,
                       new_status: FactoryGirl.create(:status),
                       role: role
  end

  let!(:project) { FactoryGirl.create(:project, is_public: true, types: types) }
  let!(:existing_wp) { FactoryGirl.create(:work_package, project: project) }
  let!(:priority) { FactoryGirl.create :priority, is_default: true }

  before do
    workflow
    login_as user
  end

  shared_examples 'inline create work package' do
    context 'when user may create work packages' do
      it 'allows to create work packages' 

    end

    context 'when user may not create work packages' do
      let(:permissions) { [:view_work_packages] }

      it 'renders the work package, but no create row' 

    end
  end

  describe 'global create' do
    let(:wp_table) { ::Pages::WorkPackagesTable.new }

    before do
      wp_table.visit!
    end

    it_behaves_like 'inline create work package' do
      let(:callback) {
        ->() {
          # Set project
          project_field = wp_table.edit_field(nil, :project)
          project_field.expect_active!

          project_field.set_value project.name

          # Set type
          type_field = wp_table.edit_field(nil, :type)
          type_field.expect_active!

          type_field.set_value type.name
        }
      }
    end
  end

  describe 'project context create' do
    let(:wp_table) { ::Pages::WorkPackagesTable.new(project) }

    before do
      wp_table.visit!
    end

    it_behaves_like 'inline create work package' do
      let(:callback) {
        ->() { }
      }
    end

    context 'user has permissions in other project' do
      let(:permissions) { [:view_work_packages] }

      let(:project2) { FactoryGirl.create :project }
      let(:role2) {
        FactoryGirl.create :role,
                           permissions: [:view_work_packages,
                                         :add_work_packages]
      }
      let!(:membership) {
        FactoryGirl.create :member,
                           user: user,
                           project: project2,
                           roles: [role2]
      }

      it 'renders the work packages, but no create' 

    end
  end
end
