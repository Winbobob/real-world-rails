RSpec.describe PersonVictimExporter do
  let(:victim) {
    PersonVictim.new(
      witness_type: ['other'],
      name: PersonName.new(
        type: 'PersonName',
        given_name: ['Jennie', 'Claire'],
        surname: 'Jones'
      ),
      date_of_birth: Date.new(1980, 8, 1),
      visually_recorded_interview: false,
      nature_of_involvement: 'Nature of involvement',
      evidence_they_can_give: 'Evidence they can give',
      victim_code_requirements_met: true,
      has_the_victim_made_a_vps_isb: false
    )
  }

  context 'exported hash' do
    subject { described_class.new(victim).export }

    it 'includes a type' 


    it 'includes subclass-specific attributes' 


    it 'includes a name object' 


    context 'victim sub-document' do
      subject { super().fetch('victim') }

      it 'includes victim-specific fields' 


      context 'witness sub-sub-document' do
        subject { super().fetch('witness') }

        it 'includes witness-specific fields' 

      end
    end
  end
end

