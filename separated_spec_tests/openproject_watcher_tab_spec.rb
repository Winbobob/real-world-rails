require 'spec_helper'

require 'features/work_packages/work_packages_page'
require 'support/work_packages/work_package_field'

describe 'Watcher tab', js: true, selenium: true do
  let(:project) { FactoryGirl.create(:project) }
  let(:work_package) { FactoryGirl.create(:work_package, project: project) }

  let(:user) { FactoryGirl.create(:user, member_in_project: project, member_through_role: role) }
  let(:role) { FactoryGirl.create(:role, permissions: permissions) }
  let(:permissions) {
    %i(view_work_packages
       view_work_package_watchers
       delete_work_package_watchers
       add_work_package_watchers)
  }

  let(:watch_button) { find '#watch-button' }

  def expect_button_is_watching
    title = I18n.t('js.label_unwatch_work_package')
    expect(page).to have_selector("#unwatch-button[title='#{title}']")
    expect(page).to have_selector('#unwatch-button .button--icon.icon-watched')
  end

  def expect_button_is_not_watching
    title = I18n.t('js.label_watch_work_package')
    expect(page).to have_selector("#watch-button[title='#{title}']")
    expect(page).to have_selector('#watch-button .button--icon.icon-unwatched')
  end

  shared_examples 'watch and unwatch with button' do
    it 'watching the WP modifies the watcher list' 

  end

  shared_examples 'watchers tab' do
    include_context 'ui-autocomplete helpers'

    before do
      login_as(user)
      wp_page.visit_tab! :watchers
      expect(page).to have_selector('.tabrow li.selected', text: 'WATCHERS')
    end

    it 'modifying the watcher list modifies the watch button' 


    context 'with a user with arbitrary characters' do
      let!(:html_user) {
        FactoryGirl.create :user,
                           firstname: '<em>foo</em>',
                           member_in_project: project,
                           member_through_role: role
      }

      it 'escapes the user name' 

    end

    context 'with all permissions' do
      it_behaves_like 'watch and unwatch with button'
    end

    context 'without watchers permission' do
      let(:permissions) { %i(view_work_packages view_work_package_watchers) }
      it_behaves_like 'watch and unwatch with button'
    end
  end

  context 'split screen' do
    let(:wp_page) { Pages::SplitWorkPackage.new(work_package) }
    it_behaves_like 'watchers tab'
  end

  context 'full screen' do
    let(:wp_page) { Pages::FullWorkPackage.new(work_package) }
    it_behaves_like 'watchers tab'
  end
end
