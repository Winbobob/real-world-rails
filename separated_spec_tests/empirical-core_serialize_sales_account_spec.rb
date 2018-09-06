require 'rails_helper'

describe 'SerializeSalesAccount' do
  let(:school) do
    create(:school,
      name: 'Kool School',
      mail_city: 'New York',
      mail_state: 'NY',
      mail_zipcode: '11104',
      leanm: 'Kool District',
      phone: '555-666-3210',
      charter: 'N',
      free_lunches: 0,
      ppin: nil,
      nces_id: '111111111',
      ulocal: '41',
    )
  end

  it 'includes the account_uid' 


  it 'generates basic school params' 


  it 'generates school premium status' 


  it 'generates teacher data' 


  it 'generates student data' 

end

