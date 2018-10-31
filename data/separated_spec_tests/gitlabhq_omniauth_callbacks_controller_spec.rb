require 'spec_helper'

describe Ldap::OmniauthCallbacksController do
  include_context 'Ldap::OmniauthCallbacksController'

  it "displays LDAP sync flash on first sign in" 


  it "skips LDAP sync flash on subsequent sign ins" 


  context 'access denied' do
    let(:valid_login?) { false }

    it 'logs a failure event' 

  end
end

