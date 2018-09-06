require 'rails_helper'

feature 'Downloading Regular Schedules CSV' do
  before do
    login_super_admin
    create_service
    @regular_schedule = @location.regular_schedules.
                        create!(attributes_for(:regular_schedule))
    visit admin_csv_regular_schedules_path(format: 'csv')
  end

  it 'contains the same headers as in the import Wiki' 


  it 'formats the date and time values' 

end

