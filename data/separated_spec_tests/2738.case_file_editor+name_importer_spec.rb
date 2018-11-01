RSpec.describe NameImporter do
  subject {
    described_class.importer(source).import
  }

  context 'when the object is a person name' do
    let(:source) {
      {
        'type' => 'PersonName',
        'given_name' => %w[ Jennie Claire ],
        'surname' => 'Jones'
      }
    }

    it { is_expected.to be_kind_of(PersonName) }

    it 'has given_name' 


    it 'has surname' 

  end

  context 'when the object is a officer name' do
    let(:source) {
      {
        'type' => 'OfficerName',
        'given_name' => %w[ Jennie Claire ],
        'surname' => 'Jones',
        'rank' => 'Sergeant',
        'collar_number' => 'AA11'
      }
    }

    it { is_expected.to be_kind_of(OfficerName) }

    it 'has given_name' 


    it 'has surname' 

    it 'has rank' 

    it 'has collar number' 

  end

  context 'when the object is an organisation name' do
    let(:source) {
      {
        'type' => 'OrganisationName',
        'organisation_name' => 'ACME, Inc.'
      }
    }

    it { is_expected.to be_kind_of(OrganisationName) }

    it 'has organisation_name' 

  end
end

