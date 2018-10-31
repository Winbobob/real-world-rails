RSpec.describe StatementWitnessImporter do
  let(:source) {
    {
      'type' => 'StatementWitness',
      'witness_type' => %w['eye'],
      'name' => {
        'type' => 'PersonName',
        'given_name' => ['Jennie', 'Claire'],
        'surname' => 'Jones'
      },
      'witness' => {
        'nature_of_involvement' => 'Nature of involvement',
        'evidence_they_can_give' => 'Evidence they can give'
      },
      'date_of_birth' => '1980-08-01',
      'visually_recorded_interview' => false
    }
  }

  context 'imported object' do
    subject {
      described_class.new(source).import
    }

    it { is_expected.to be_kind_of(StatementWitness) }

    it 'has top-level properties' 


    it 'has properties from the witness sub-object' 


    context 'name' do
      subject { super().name }

      it { is_expected.to be_kind_of(PersonName) }

      it 'has given_name' 


      it 'has surname' 

    end
  end
end

