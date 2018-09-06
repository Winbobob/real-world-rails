require 'rails_helper'

RSpec.describe AdditionalRespondentsForm, type: :form do
  let(:additional_respondents_form) { described_class.new(claim) }

  let(:attributes) do
    {
      of_collection_type: 'true',
      collection_attributes: {
        "0" => {
          name: 'Butch McTaggert',
          acas_early_conciliation_certificate_number: 'XX123456/12/12',
          address_building: '1', address_street: 'High Street',
          address_locality: 'Anytown', address_county: 'Anyfordshire',
          address_post_code: 'W2 3ED'
        },
        "1" => {
          name: 'Pablo Noncer',
          acas_early_conciliation_certificate_number: 'XX123456/12/12',
          address_building: '2', address_street: 'Main Street',
          address_locality: 'Anycity', address_county: 'Anyford',
          address_post_code: 'W2 3ED'
        }
      }
    }
  end

  let(:claim) { Claim.create }

  describe '#collection_attributes=' do
    before do
      allow(claim.secondary_respondents).to receive(:build).and_return(*collection)
      allow(claim.secondary_respondents).to receive(:empty?).and_return true, false
      additional_respondents_form.assign_attributes attributes
    end

    let(:collection) { [Respondent.new(claim_id: claim.id), Respondent.new(claim_id: claim.id)] }

    it 'builds new respondents with attributes' 


    it 'new additional respondents are decorated as Respondents' 

  end

  describe '#collection' do
    before { resource }

    let(:resource) { claim.secondary_respondents.build }
    let(:form)     { additional_respondents_form.collection.first }

    describe 'decorates any secondary respondents in an AdditionalRespondent' do
      it { expect(additional_respondents_form.collection.length).to be 1 }
      it { expect(form).to be_a Form }
      it { expect(form.target).to eq resource }
    end
  end

  describe '#errors' do
    before { 3.times { claim.respondents.create } }

    it 'maps the errors of #respondents' 

  end

  describe '#save' do
    context 'when there are no secondary respondents' do
      it 'creates the secondary respondents' 

    end

    context 'when there are existing secondary respondents' do
      before do
        2.times { claim.secondary_respondents.create }
      end

      it 'updates the secondary respondents' 

    end

    context 'when all #respondents are valid' do
      before do
        additional_respondents_form.assign_attributes attributes
      end

      it 'returns true' 

    end

    context 'when some respondents are not valid' do
      before { additional_respondents_form.of_collection_type = 'true' }

      it 'returns false' 

    end
  end
end

