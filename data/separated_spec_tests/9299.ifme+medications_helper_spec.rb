# frozen_string_literal: true

describe MedicationsHelper do
  let(:current_user) { create(:user) }
  let(:medication) { create(:medication, user: current_user) }

  before do
    @medication = medication
  end

  def get_field(field_name)
    @fields.find {|f| f[:id] == field_name}
  end

  describe '#common_fields' do
    before do
      @fields = common_fields
    end

    it 'returns common medication fields' 


    context 'when refill reminder is active' do
      let(:medication) { create(:medication, :with_refill_reminder, user: current_user) }
      it 'sets a medication refill reminder' 

    end

    context 'when take medication reminder is active' do
      let(:medication) { create(:medication, :with_daily_reminder, user: current_user) }
      it 'sets a medication take medication reminder' 

    end
  end

  describe '#google_fields' do
    before do
      @fields = google_fields
    end

    it 'adds google field to common fields' 

  end

  describe '#days_checkbox' do
    it 'returns weekly dosage checkboxes information' 

  end
end

