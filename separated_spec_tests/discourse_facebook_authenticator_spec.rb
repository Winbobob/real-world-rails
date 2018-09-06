require 'rails_helper'

# In the ghetto ... getting the spec to run in autospec
#  thing is we need to load up all auth really early pre-fork
#  it means that the require is not going to get a new copy
Auth.send(:remove_const, :FacebookAuthenticator)
load 'auth/facebook_authenticator.rb'

describe Auth::FacebookAuthenticator do

  context 'after_authenticate' do
    it 'can authenticate and create a user record for already existing users' 


    it 'can create a proper result for non existing users' 

  end

end

