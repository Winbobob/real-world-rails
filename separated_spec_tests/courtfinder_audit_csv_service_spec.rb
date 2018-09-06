require 'spec_helper'

describe AuditCsvService do
  before do
    PaperTrail.enabled = true
    PaperTrail.whodunnit = user.id
  end

  after do
    PaperTrail.enabled = false
  end

  describe 'Generate CSV file for audit' do
    let(:csv_header) do
      [
        "datetime", "user_email", "ip_address", "court_name",
        "field_name", "action", "value_before", "value_after"
      ]
    end
    let(:user) { create :user }
    let(:court_facility) { create :court_facility, court: court }
    let(:court) { create :court, name: 'Test court a' }

    context 'no records' do
      it 'return csv with sctructure' 

    end

    context 'item type Court' do
      before do
        court.update(name: 'Test court b')
      end

      it 'return csv with structure' 

    end

    context 'item event destroy' do
      before do
        court_facility.update(description: 'test')
        court_facility.destroy
      end

      it 'return csv with structure' 

    end

    context 'other types of events' do
      before do
        court_facility
      end

      it 'return csv with structure' 

    end
  end
end

