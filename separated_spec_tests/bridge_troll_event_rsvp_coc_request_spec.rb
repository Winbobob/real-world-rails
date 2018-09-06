require 'rails_helper'

describe 'code of conduct checkbox for RSVPs' do
  let(:coc_text) { 'I accept the Code of Conduct' }
  let(:chapter) { create(:chapter) }

  before do
    @event = create(:event, chapter: chapter)
    @user = create(:user)
    sign_in_as @user
  end

  context 'for new records', js: true do
    before do
      visit volunteer_new_event_rsvp_path(@event)
    end

    it "requires code of conduct to be checked, and preserves checked-ness on error" 

  end

  context 'for existing records' do
    let(:rsvp) { create(:rsvp, user: @user) }

    it 'is not shown' 

  end

  context 'when the organization has a different code of conduct' do
    let(:organization) do
      create(:organization, name: 'CoolBridge', code_of_conduct_url: 'http://example.com/coc')
    end
    let(:chapter) { create(:chapter, organization: organization) }

    it 'shows a custom code of conduct URL' 

  end
end

