require 'rails_helper'

RSpec.describe DecisionCostMigration do
  subject(:migration) { described_class }

  let!(:failed_application) { create :application_no_remission, :processed_state, decision: 'full', decision_cost: 0, decision_type: 'override', application_type: 'none', decision_date: Time.zone.now }

  before do
    create :decision_override, application: failed_application
    create_list :application_full_remission, 7, :processed_state, decision_date: Time.zone.now
  end

  it 'setup creates many records' 


  describe '#run!' do
    before do
      migration.run!
      failed_application.reload
    end

    it 'updates the correct decision_cost' 


    it 'leaves no records to be updated' 

  end

  describe '.affected_records' do
    subject { migration.affected_records.count }

    it { is_expected.to eq 1 }
  end
end

