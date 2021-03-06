require 'rails_helper'

RSpec.describe ReferenceGenerator, type: :service do
  subject(:generator) { described_class.new(application) }

  let!(:office) { create :office }
  let!(:jurisdiction) { create :jurisdiction }
  let!(:business_entity) { create :business_entity, office: office, jurisdiction: jurisdiction, be_code: 'AB987', sop_code: '987654321' }

  before { Settings.reference.date = '2016-06-30' }

  describe '#attributes' do

    context 'when the current date is after the new SOP reference date' do
      subject(:attributes) do
        Timecop.freeze(current_time) do
          generator.attributes
        end
      end

      let(:current_time) { Time.zone.parse(Settings.reference.date) }
      let(:application) { create :application, office: office, jurisdiction: jurisdiction, business_entity: nil, reference: nil }

      context 'when there is no existing reference number for the same entity code' do
        it 'returns hash with the new reference' 

      end

      context 'when there is an existing reference number for the same entity code' do
        let(:existing_application1) { create :application, :processed_state, reference: 'PA16-000018' }
        let(:existing_application2) { create :application, :processed_state, reference: 'PA16-000019' }

        before do
          existing_application2
          existing_application1
          application
        end

        it 'returns hash with the reference next in sequence' 


        context 'no sql caching for this' do
          it 'returns hash with the reference next in sequence' 

        end
      end

      context 'when there are two business entities for the same jurisdiction' do
        before do
          create :business_entity, office: office, jurisdiction: jurisdiction, be_code: 'CB975', sop_code: '123456789'
          business_entity.update_attributes(valid_to: Time.zone.now)
        end

        it 'it no-longer makes a difference' 

      end
    end
  end
end

