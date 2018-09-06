RSpec.describe NgapOtherWitnessExporter do
  let(:witness) {
    NgapOtherWitness.new(
      witness_type: ['eye'],
      name: PersonName.new(
        type: 'PersonName',
        given_name: ['Jennie', 'Claire'],
        surname: 'Jones'
      ),
      nature_of_involvement: 'Nature of involvement',
      evidence_they_can_give: 'Evidence they can give',
      number: 'ABC123'
    )
  }

  context 'exported hash' do
    subject { described_class.new(witness).export }

    it 'includes a type' 


    it 'includes subclass-specific attributes' 


    it 'includes a name object' 


    context 'witness sub-document' do
      subject { super().fetch('witness') }

      it 'includes witness-specific fields' 

    end
  end
end

