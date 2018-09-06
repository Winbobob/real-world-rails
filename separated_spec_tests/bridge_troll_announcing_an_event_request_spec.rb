require 'rails_helper'

describe "Announcing an event", js: true do
  let(:user_organizer) { create(:user, email: "organizer@mail.com", first_name: "Sam", last_name: "Spade") }
  let(:admin) { create(:user, admin: true) }
  let(:event_location) { create(:location) }
  let(:send_email_text) { 'Send Announcement Email' }
  let!(:chapter) { create(:chapter) }

  before do
    create(:course)
    sign_in_as(user_organizer)
    visit_new_events_form_and_expand_all_sections
    fill_in_good_event_details
    fill_in 'What population is this workshop reaching out to?', with: "a population"
    check("coc")
  end

  context "automatically" do
    before do
      choose('event_email_on_approval_true')
      click_on submit_for_approval_button
    end

    context "before approval" do
      it "will not allow the announcement email to be sent by an organizer" 

    end

    context "after approval" do
      before do
        Event.last.update_attribute(:location, event_location)

        sign_in_as admin
        visit unpublished_events_path
        click_on "Publish"

        sign_in_as(user_organizer)
      end

      it "will not allow the announcement to be resent by an organizer" 

    end
  end

  context "manually" do
    before do
      choose('event_email_on_approval_false')
      click_on submit_for_approval_button
    end

    context "before approval" do
      it "will not allow the announcement email to be sent by an organizer" 

    end

    context "after approval" do
      before do
        Event.last.update_attribute(:location, event_location)

        sign_in_as admin
        visit unpublished_events_path
        accept_confirm do
          click_on "Publish"
          expect(page).to have_content('This event has been published')
        end

        sign_in_as(user_organizer)
      end

      it "will allow an organizer to send an announcement email" 

    end
  end
end

