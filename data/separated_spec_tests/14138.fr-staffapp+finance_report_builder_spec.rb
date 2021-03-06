require 'rails_helper'

RSpec.describe FinanceReportBuilder do
  subject(:frb) { described_class.new(start_date, end_date) }

  let(:user) { create :user }
  let(:business_entity) { create :business_entity }
  let(:excluded_office) { create :office, name: 'Digital' }
  let(:excluded_business_entity) { create :business_entity, office: excluded_office }
  let(:application1) do
    create(:application_full_remission, :processed_state, fee: 500, decision: 'full', decision_date: Time.zone.parse('2015-12-01'), business_entity: business_entity)
  end
  let(:application2) do
    create(:application_full_remission, :processed_state, fee: 500, decision: 'full', decision_date: Time.zone.parse('2015-12-01'), business_entity: excluded_business_entity)
  end
  let(:current_time) { Time.zone.parse('2016-02-02 15:50:10') }
  let(:start_date) { Time.zone.parse('2015-10-05 12:30:40') }
  let(:end_date) { Time.zone.parse('2016-01-10 16:35:00') }

  describe '#to_csv' do
    subject do
      Timecop.freeze(current_time) do
        frb.to_csv
      end
    end

    it { is_expected.to be_a String }

    it 'does not include digital' 


    it 'contains static meta data' 


    it 'contains dynamic meta data (dates)' 

  end
end

