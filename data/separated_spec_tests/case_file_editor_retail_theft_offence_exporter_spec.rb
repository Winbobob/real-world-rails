RSpec.describe RetailTheftOffenceExporter do
  let(:offence) {
    RetailTheftOffence.new(
      cjs_offence_code: 'h410',
      from_date: '2014-01-01',
      to_date: '2014-01-01',
      offence_title: 'Offence Title from PNLD',
      charge_wording: 'This is the charge wording',
      points_to_prove_met_by:
        'Description of how the points to prove have been met.',
      anticipated_plea: 'guilty',
      committed_on_bail: false,
      property_ids: [1],
      retail_theft_interview_extension: RetailTheftInterviewExtension.new(
        admit_taking_property: 'admits_all',
        admit_being_dishonest: true,
        admit_intending_to_permanently_deprive: true
      )
    )
  }

  context 'exported hash' do
    subject { described_class.new(offence).export }

    it 'includes a type' 


    it 'includes subclass-specific attributes' 


    context 'offence sub-document' do
      subject { super().fetch('offence') }

      it 'includes a type' 


      it 'includes offence-specific attributes' 

    end

    context 'retail theft interview extension' do
      it 'is included' 

    end
  end
end

