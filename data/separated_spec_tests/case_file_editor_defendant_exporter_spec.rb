RSpec.describe DefendantExporter do
  subject {
    described_class.new(defendant).export
  }

  context 'with MME responses' do
    let(:defendant) {
      Defendant.new(
        multimedia_evidence_response: [
          MmeRecordedResponse.new(
            id: '1',
            defendant_shown: true,
            defendant_comments_if_shown: 'Comments',
            is_defendant_believed_to_be_in_the_mme: true,
            defendant_admits_being_in_mme: true
          )
        ]
      )
    }

    it 'exports an array of MME recorded response objects' 

  end

  context 'without MME responses' do
    let(:defendant) {
      Defendant.new(
        multimedia_evidence_response: [
          MmeNotRecordedResponse.new(
            defendant_admitted_to_location: true,
            how_is_identification_established: 'distinctive facial tattoos'
          )
        ]
      )
    }

    it 'exports a single MME not recorded response object' 

  end
end

