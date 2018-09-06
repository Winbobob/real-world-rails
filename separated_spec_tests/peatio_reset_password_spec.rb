require 'spec_helper'

describe 'password' do
  let!(:identity) { create :identity }
  let!(:password) { 'New1Password' }
  let!(:member) { create :member, email: identity.email }

  it 'can be reset by user' 

end

