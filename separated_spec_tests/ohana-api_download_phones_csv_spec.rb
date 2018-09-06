require 'rails_helper'

feature 'Downloading Phones CSV' do
  before do
    login_super_admin
    @service = create(:service)
    @location = @service.location
    @org_id = @location.organization_id
    @phone = create(
      :phone,
      location_id: @location.id,
      organization_id: @org_id,
      service_id: @service.id
    )
    visit admin_csv_phones_path(format: 'csv')
  end

  it 'contains the same headers as in the import Wiki' 


  it 'populates phone attribute values' 

end

