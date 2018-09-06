require 'spec_helper'

feature 'Group Badges' do
  include WaitForRequests

  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:badge_link_url) { 'https://gitlab.com/gitlab-org/gitlab-ee/commits/master'}
  let(:badge_image_url) { 'https://gitlab.com/gitlab-org/gitlab-ee/badges/master/build.svg'}
  let!(:badge_1) { create(:group_badge, group: group) }
  let!(:badge_2) { create(:group_badge, group: group) }

  before do
    group.add_owner(user)
    sign_in(user)

    visit(group_settings_badges_path(group))
  end

  it 'shows a list of badges', :js do
    page.within '.badge-settings' do
      wait_for_requests

      rows = all('.panel-body > div')
      expect(rows.length).to eq 2
      expect(rows[0]).to have_content badge_1.link_url
      expect(rows[1]).to have_content badge_2.link_url
    end
  end

  context 'adding a badge', :js do
    it 'user can preview a badge' 


    it do
      page.within '.badge-settings' do
        fill_in 'badge-link-url', with: badge_link_url
        fill_in 'badge-image-url', with: badge_image_url

        click_button 'Add badge'
        wait_for_requests

        within '.panel-body' do
          expect(find('a')[:href]).to eq badge_link_url
          expect(find('a img')[:src]).to eq badge_image_url
        end
      end
    end
  end

  context 'editing a badge', :js do
    it 'form is shown when clicking edit button in list' 


    it 'updates a badge when submitting the edit form' 

  end

  context 'deleting a badge', :js do
    def click_delete_button(badge_row)
      badge_row.find('[aria-label="Delete"]').click
    end

    it 'shows a modal when deleting a badge' 


    it 'deletes a badge when confirming the modal' 

  end
end

