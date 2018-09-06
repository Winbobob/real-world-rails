require 'rails_helper'

feature 'Downloading Programs CSV' do
  before do
    login_super_admin
    @program = create(:program)
    visit admin_csv_programs_path(format: 'csv')
  end

  it 'contains the same headers as in the import Wiki' 


  it 'populates program attribute values' 

end

