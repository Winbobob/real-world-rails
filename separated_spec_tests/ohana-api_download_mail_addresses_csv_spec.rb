require 'rails_helper'

feature 'Downloading Mail Addresses CSV' do
  before do
    login_super_admin
    @mail_address = create(:mail_address)
    visit admin_csv_mail_addresses_path(format: 'csv')
  end

  it 'contains the same headers as in the import Wiki' 


  it 'populates mail address attribute values' 

end

