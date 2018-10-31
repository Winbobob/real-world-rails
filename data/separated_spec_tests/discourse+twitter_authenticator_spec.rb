require 'rails_helper'

describe Auth::TwitterAuthenticator do

  it "takes over account if email is supplied" 


  it 'can connect to a different existing user account' 


  context 'revoke' do
    let(:user) { Fabricate(:user) }
    let(:authenticator) { Auth::TwitterAuthenticator.new }

    it 'raises exception if no entry for user' 


      it 'revokes correctly' 


  end

end

