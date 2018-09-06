require 'rails_helper'

feature 'Downloading Holiday Schedules CSV' do
  before { login_super_admin }

  context 'when holiday_schedule contains nil date attributes' do
    before do
      create_service
      @holiday_schedule = @location.holiday_schedules.
                          create!(attributes_for(:holiday_schedule))
      visit admin_csv_holiday_schedules_path(format: 'csv')
    end

    it 'contains the same headers as in the import Wiki' 


    it 'populates holiday_schedule attribute values' 

  end

  context 'when holiday_schedule contains non-empty date attributes' do
    before do
      create_service
      @holiday_schedule = @location.holiday_schedules.
                          create!(attributes_for(:holiday_schedule, :open))
      visit admin_csv_holiday_schedules_path(format: 'csv')
    end

    it 'formats the date and time values' 

  end
end

