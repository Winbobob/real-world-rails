require 'rails_helper'

RSpec.describe Jobs::SendDefaultWelcomeMessage do
  let(:user) { Fabricate(:user) }

  it 'should send the right welcome message' 


  describe 'for an invited user' do
    let(:invite) { Fabricate(:invite, user: user, redeemed_at: Time.zone.now) }

    it 'should send the right welcome message' 

  end
end

