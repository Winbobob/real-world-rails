require 'rails_helper'

feature "Notifications", :js do
  let(:sender) { create :member }
  let(:recipient) { create :member }

  context "On existing notification" do
    let!(:notification) do
      create :notification,
        sender: sender,
        recipient: recipient,
        body: "Notification body",
        post_id: nil
    end

    background do
      login_as recipient
      visit notification_path(notification)
    end

    scenario "Replying to the notification" do
      click_link "Reply"
      expect(page).to have_content "Notification body"

      fill_in 'notification_body', with: "Response body"
      click_button "Send"

      expect(page).to have_content "Message was successfully sent"
    end
  end

  describe 'pagination' do
    before do
      34.times { FactoryBot.create :notification, recipient: recipient }
      login_as recipient
      visit notifications_path
    end

    it 'has page navigation' 


    it 'paginates at 30 notifications per page' 


    it 'navigates pages' 

  end
end

