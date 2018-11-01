require "rails_helper"

RSpec.describe GdprExportMailer, type: :mailer, api: true do
  let!(:participant) { create :participant }
  let!(:comment) { create :comment, participant: participant }
  let!(:comment2) { create :comment, participant: participant }

  let(:gdpr_fields) {
    [
      {
        table: 'Participant',
        id_field: 'id',
        fields: [
          :id,
          :email,
          :address,
          :name
        ]
      },
      {
        table: 'Comment',
        id_field: 'participant_id',
        fields: [
          :id,
          :comment_markdown
        ]
      }
    ]
  }

  describe '#methods' do
    it 'produces an Base64 encoded attachment' 


    it 'successfully sends a message' 


    context 'Participant' do
      it "#rows" 


      it '#plucked' 


      it '#query' 

    end

    context 'Comment' do
      it "#rows" 


      it '#plucked' 


      it '#query' 

    end

  end
end

