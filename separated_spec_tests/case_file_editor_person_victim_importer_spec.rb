RSpec.describe PersonVictimImporter do
  let(:source) {
    {
      'type' => 'PersonVictim',
      'name' => {
        'type' => 'PersonName',
        'given_name' => ['Jennie', 'Claire'],
        'surname' => 'Jones'
      },
      'date_of_birth' => '1980-08-01',
      'visually_recorded_interview' => false,
      'special_measures' => false,
      'wish_to_use_video_link' => false,
      'victim' => {
        'witness_type' => ['other'],
        'victim_code_requirements_met' => true,
        'has_the_victim_made_a_vps_isb' => false,
        'witness' => {
          'nature_of_involvement' => 'Nature of involvement',
          'evidence_they_can_give' => 'Evidence they can give'
        }
      }
    }
  }

  context 'imported object' do
    subject {
      described_class.new(source).import
    }

    it { is_expected.to be_kind_of(PersonVictim) }

    it 'has top-level properties' 


    it 'has properties from the victim sub-object' 


    it 'has properties from the witness sub-sub-object' 


    context 'name' do
      subject { super().name }

      it { is_expected.to be_kind_of(PersonName) }

      it 'has given_name' 


      it 'has surname' 

    end
  end
end

