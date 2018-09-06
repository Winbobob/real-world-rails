require 'rails_helper'

describe EventMailer do
  let(:event) { create(:event) }

  describe '#new_event' do
    let(:mail) { EventMailer.new_event(event) }

    it "includes both locations for a multi-location event" 

  end

  describe '#unpublished_event' do
    let!(:unrelated_user) { create(:user) }
    let!(:organizer) { create(:user) }
    let!(:admin) { create(:user, admin: true) }
    let!(:publisher) { create(:user, publisher: true) }
    let!(:organization_leader) { create(:user) }
    let!(:chapter_leader) { create(:user) }

    before do
      event.organizers << organizer
      event.chapter.leaders << chapter_leader
      event.chapter.organization.leaders << organization_leader
    end

    it 'sends an email to all potential approvers' 

  end
end

