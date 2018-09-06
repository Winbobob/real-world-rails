require 'rails_helper'

RSpec.describe ZendeskTicketsJob, type: :job do
  subject { described_class }

  let(:feedback) {
    Feedback.new(
      text: 'text',
      email: 'email@example.com',
      referrer: 'ref',
      user_agent: 'Mozilla'
    )
  }

  let(:client) {
    ZENDESK_CLIENT
  }

  let(:ticket) {
    double(ZendeskAPI::Ticket, save!: nil)
  }

  it 'creates a ticket with feedback and custom fields' 


  it 'calls save! to send the feedback' 


  context 'when the prison name is available' do
    let(:feedback) {
      super().tap { |f| f.prison = 'Rochester' }
    }

    it 'includes it as custom data' 

  end
end

