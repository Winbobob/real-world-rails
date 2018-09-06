require 'rails_helper'

feature 'Downloading Addresses CSV' do
  before do
    login_super_admin
    @address = create(:address, location_id: 1)
    visit admin_csv_addresses_path(format: 'csv')
  end

  it 'contains the same headers as in the import Wiki' 


  it 'populates address attribute values' 

end

