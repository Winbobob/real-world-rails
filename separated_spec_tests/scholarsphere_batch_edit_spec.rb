# frozen_string_literal: true

require 'feature_spec_helper'

describe 'Batch management of works', type: :feature do
  let(:current_user) { create(:user) }

  let(:first_creator) do
    create(:alias, display_name: 'First Creator', agent: Agent.new(given_name: 'First', sur_name: 'Creator'))
  end

  let(:second_creator) do
    create(:alias, display_name: 'Second Creator', agent: Agent.new(given_name: 'Second', sur_name: 'Creator'))
  end

  let!(:work1) do
    create(:public_work, :with_complete_metadata,
           creators: [first_creator, second_creator],
           depositor: current_user.login)
  end

  let!(:work2) do
    create(:public_work, :with_complete_metadata,
           creators: [first_creator, second_creator],
           depositor: current_user.login)
  end

  before do
    sign_in_with_named_js(:batch_edit, current_user, disable_animations: true)
    visit '/dashboard/works'
  end

  context 'when editing and viewing multiple works' do
    before do
      check('check_all')
      click_on('batch-edit')
    end

    it 'edits a field and displays the changes', js: true do
      expect(page).to have_content 'Changes will be applied to the following'

      # Update standard fields
      batch_edit_fields.each do |field|
        fill_in_batch_edit_field(field, with: "Updated batch #{field}")
      end

      # Update creators
      first('.remove-creator').click
      fill_in 'batch_edit_item[creators][1][display_name]', with: 'Dr. Creator C. Creator, MD'
      click_button('Add another Creator')
      fill_in 'batch_edit_item[creators][2][display_name]', with: 'Another Creator'
      fill_in 'batch_edit_item[creators][2][given_name]', with: 'Another'
      fill_in 'batch_edit_item[creators][2][sur_name]', with: 'Creator'
      click_button('creator_save')
      within '#form_creator' do
        sleep 0.1 until page.text.include?('Changes Saved')
        expect(page).to have_content 'Changes Saved', wait: Capybara.default_max_wait_time * 4
      end

      # Update rights for all works to a single value
      select 'GNU General Public License', from: 'batch_edit_item_rights'
      click_button('rights_save')
      within '#form_rights' do
        sleep 0.1 until page.text.include?('Changes Saved')
        expect(page).to have_content 'Changes Saved', wait: Capybara.default_max_wait_time * 4
      end

      # Verify changes
      work1.reload
      work2.reload
      batch_edit_fields.each do |field|
        expect(work1.send(field)).to contain_exactly("Updated batch #{field}")
        expect(work2.send(field)).to contain_exactly("Updated batch #{field}")
      end
      expect(work1.creators.map(&:display_name)).to contain_exactly('Dr. Creator C. Creator, MD', 'Another Creator')
      expect(work1.creators.map(&:agent).map(&:sur_name)).to contain_exactly('Creator', 'Creator')
      expect(work1.creators.map(&:agent).map(&:given_name)).to contain_exactly('Another', 'Second')
      expect(work2.creators.map(&:display_name)).to contain_exactly('Dr. Creator C. Creator, MD', 'Another Creator')
      expect(work2.creators.map(&:agent).map(&:sur_name)).to contain_exactly('Creator', 'Creator')
      expect(work2.creators.map(&:agent).map(&:given_name)).to contain_exactly('Another', 'Second')
    end

    it "displays the field's existing value" 

  end

  context 'when selecting multiple works for deletion', js: true do
    subject { GenericWork.count }

    before do
      check 'check_all'
      click_button 'Delete Selected'
    end
    it { is_expected.to be_zero }
  end
end

