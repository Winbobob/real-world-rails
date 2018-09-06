require 'rails_helper'

feature 'Downloading Contacts CSV' do
  before do
    login_super_admin
    @service = create(:service)
    @location = @service.location
    @org_id = @location.organization_id
    @contact = create(
      :contact_with_extra_whitespace,
      location_id: @location.id,
      organization_id: @org_id,
      service_id: @service.id
    )
    visit admin_csv_contacts_path(format: 'csv')
  end

  it 'contains the same headers as in the import Wiki' 


  it 'populates contact attribute values' 

end

