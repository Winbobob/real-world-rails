require 'rails_helper'

describe GoogleIntegration::RefreshAccessToken do
  let(:current_time) { Time.local(1990, 12, 20) }
  before { Timecop.freeze(current_time) }
  after { Timecop.return }

  it 'returns the new credentials if token is expired' 


  it 'updates the user credentials if token is expired' 


  it 'does not attempt to refresh if current token is not expired' 


  it 'returns the current credentials if not expired' 

end

