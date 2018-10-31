require 'rails_helper'

RSpec.describe PastEventEmailsPresenter do
  subject(:presenter) { PastEventEmailsPresenter.new(event) }
  let(:event) { FactoryBot.create(:event) }
  let!(:event_emails) { FactoryBot.create_list(:event_email, 2, event: event) }
  let!(:event_emails_recipients) do
    volunteer_rsvp = FactoryBot.create(:volunteer_rsvp, event: event)
    student_rsvp = FactoryBot.create(:student_rsvp, event: event)
    event_emails.first.recipient_rsvps << [volunteer_rsvp, student_rsvp]
  end

  describe '#emails' do
    it 'presents past event emails' 

  end

  describe '#recipient_counts' do
    it 'presents an object listing recipient counts by total and type' 

  end
end

