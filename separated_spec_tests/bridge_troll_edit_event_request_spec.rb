require 'rails_helper'

describe "Edit Event" do
  before do
    @user_organizer = create(:user, email: "organizer@mail.com", first_name: "Sam", last_name: "Spade")
    @drafted_event = create(:event, title: 'draft title', current_state: :draft)
    @drafted_event.organizers << @user_organizer

    expect(@drafted_event).to be_draft
    sign_in_as(@user_organizer)
    visit edit_event_path(@drafted_event)
  end

  context 'event saved previously as draft' do
    it 'allows a draft to be saved' 

  end
end

