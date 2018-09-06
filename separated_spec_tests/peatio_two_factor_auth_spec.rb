require 'spec_helper'

describe '2-step verification' do
  let!(:identity) { create :identity }
  let!(:member) { create :member, email: identity.email }

  it 'allows user to set it up and disable it' 

end

