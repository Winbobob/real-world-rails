require 'spec_helper'

require 'features/work_packages/shared_contexts'
require 'features/work_packages/details/inplace_editor/shared_examples'

describe 'activity comments', js: true, selenium: true do
  let(:project) { FactoryGirl.create :project, is_public: true }
  let!(:work_package) {
    FactoryGirl.create(:work_package,
                       project: project,
                       journal_notes: initial_comment)
  }
  let(:wp_page) { Pages::SplitWorkPackage.new(work_package, project) }
  let(:selector) { '.work-packages--activity--add-comment' }
  let(:comment_field) {
    WorkPackageTextAreaField.new wp_page,
                                 'comment',
                                 selector: selector
  }
  let(:initial_comment) { 'the first comment in this WP' }

  before do
    login_as(user)
    allow(user.pref).to receive(:warn_on_leaving_unsaved?).and_return(false)
  end

  context 'with permission' do
    let(:user) { FactoryGirl.create :admin }

    before do
      wp_page.visit!
      wp_page.ensure_page_loaded
    end

    describe 'preview' do
      let(:field) { comment_field }
      it_behaves_like 'a previewable field'
    end

    context 'in edit state' do
      before do
        comment_field.activate!
      end

      describe 'editing' do
        it 'buttons are disabled when empty' 

      end

      describe 'submitting comment' do
        it 'does not submit with enter' 


        it 'submits with click' 


        it 'submits comments repeatedly' 

      end

      describe 'cancel comment' do
        it do
          expect(comment_field.editing?).to be true
          comment_field.input_element.set 'this is a comment'

          # Escape should NOT cancel the editing
          comment_field.cancel_by_escape
          expect(comment_field.editing?).to be true

          expect(page).to_not have_selector('.user-comment .message', text: 'this is a comment')

          # Click should cancel the editing
          comment_field.cancel_by_click
          expect(comment_field.editing?).to be false

          expect(page).to_not have_selector('.user-comment .message', text: 'this is a comment')
        end
      end

      it 'saves while in preview mode' 


      describe 'autocomplete' do
        let!(:wp2) { FactoryGirl.create(:work_package, project: project, subject: 'AutoFoo') }

        it 'autocompletes the other work package' 

      end

      describe 'quoting' do
        it 'can quote a previous comment' 

      end

      describe 'with an existing comment' do
        it 'allows to edit an existing comment' 

      end
    end
  end

  context 'with no permission' do
    let(:user) { FactoryGirl.create(:user, member_in_project: project, member_through_role: role) }
    let(:role) { FactoryGirl.create :role, permissions: %i(view_work_packages) }

    before do
      wp_page.visit!
      wp_page.ensure_page_loaded
    end

    it 'does not show the field' 

  end
end

