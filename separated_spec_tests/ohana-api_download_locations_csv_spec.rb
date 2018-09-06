require 'rails_helper'

feature 'Downloading Locations CSV' do
  before { login_super_admin }

  context 'location has non-empty array attributes' do
    before do
      @loc = create(
        :loc_with_extra_whitespace,
        accessibility: %i[tape_braille disabled_parking]
      )
      visit admin_csv_locations_path(format: 'csv')
    end

    it 'contains the same headers as in the import Wiki' 


    it 'converts arrays to comma-separated strings' 

  end

  context 'location has nil array attributes' do
    before do
      @loc = create(
        :location, accessibility: nil, languages: nil, admin_emails: nil
      )
      visit admin_csv_locations_path(format: 'csv')
    end

    it 'converts value to nil or empty string' 

  end
end

