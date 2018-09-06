require 'spec_helper'
require 'features/work_packages/work_packages_page'

describe 'Work package details toolbar', js: true, selenium: true do
  let(:project) { FactoryGirl.create :project_with_types, is_public: true }
  let!(:work_package) { FactoryGirl.create :work_package, project: project }
  let(:work_packages_page) { WorkPackagesPage.new(project) }

  describe 'toggle watch state' do
    let(:user) { FactoryGirl.create :admin }
    before do
      login_as(user)
      work_packages_page.visit_index(work_package)
    end

    it 'toggles the watch state' 

  end
end

