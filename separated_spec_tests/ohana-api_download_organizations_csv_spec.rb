require 'rails_helper'

feature 'Downloading Organizations CSV' do
  before { login_super_admin }

  context 'organization has non-empty array attributes' do
    before do
      @org = create(:org_with_extra_whitespace)
      visit admin_csv_organizations_path(format: 'csv')
    end

    it 'contains the same headers as in the import Wiki' 


    it 'converts arrays to comma-separated strings' 

  end

  context 'organization has nil array attributes' do
    before do
      @org = create(
        :org_with_extra_whitespace,
        accreditations: nil,
        date_incorporated: nil,
        funding_sources: nil,
        licenses: nil
      )
      visit admin_csv_organizations_path(format: 'csv')
    end

    it 'converts value to nil or empty string' 

  end
end

