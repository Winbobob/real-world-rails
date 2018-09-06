RSpec.describe NgapOtherWitnessImporter do
  let(:source) {
    {
      'type' => 'NgapOtherWitness',
      'witness_type' => %w[ eye ],
      'name' => {
        'type' => 'OfficerName',
        'given_name' => %w[ Jennie Claire ],
        'surname' => 'Jones',
        'rank' => 'Sergeant',
        'collar_number' => 'AA11'
      },
      'witness' => {
        'nature_of_involvement' => 'Nature of involvement',
        'evidence_they_can_give' => 'Evidence they can give'
      },
      'number' => 'ABC123'
    }
  }

  context 'imported object' do
    subject {
      described_class.new(source).import
    }

    it { is_expected.to be_kind_of(NgapOtherWitness) }

    it 'has top-level properties' 


    it 'has properties from the witness sub-object' 


    context 'name' do
      subject { super().name }

      it { is_expected.to be_kind_of(OfficerName) }

      it 'has given_name' 


      it 'has surname' 


      it 'has rank' 


      it 'has collar number' 

    end
  end
end

