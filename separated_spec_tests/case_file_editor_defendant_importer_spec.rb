RSpec.describe DefendantImporter do
  subject {
    described_class.new(source).import
  }

  context 'with MME' do
    let(:source) {
      {
        'multimedia_evidence_response' => [
          {
            'id' => '1',
            'type' => 'MmeRecordedResponse',
            'defendant_shown' => true,
            'defendant_comments_if_shown' => 'These are the defendant comments if shown.',
            'is_defendant_believed_to_be_in_the_mme' => true,
            'defendant_admits_being_in_mme' => true
          }
        ]
      }
    }

    describe 'multimedia_evidence_response' do
      subject { super().multimedia_evidence_response }

      it 'has one element' 


      describe 'first' do
        subject { super().first }

        it 'is an MmeRecordedResponse' 


        it 'has all the fields in the source' 

      end
    end
  end

  context 'without MME' do
    let(:source) {
      {
        'multimedia_evidence_response' => [
          {
            'type' => 'MmeNotRecordedResponse',
            'defendant_admitted_to_location' => true,
            'how_is_identification_established' => 'distinctive facial tattoos'
          }
        ]
      }
    }

    describe 'multimedia_evidence_response' do
      subject { super().multimedia_evidence_response }

      it 'has one element' 


      describe 'first' do
        subject { super().first }

        it 'is an MmeNotRecordedResponse' 


        it 'has all the fields in the source' 

      end
    end
  end

  context 'without an MME entry' do
    let(:source) { {} }

    describe 'multimedia_evidence_response' do
      subject { super().multimedia_evidence_response }

      it 'is empty' 

    end
  end
end

