require 'rails_helper'

describe Jobs::DisableBootstrapMode do

  context '.execute' do
    let(:admin) { Fabricate(:admin) }

    before do
      SiteSetting.bootstrap_mode_enabled = true
      SiteSetting.default_trust_level = TrustLevel[1]
      SiteSetting.default_email_digest_frequency = 1440
    end

    it 'does not execute if bootstrap mode is already disabled' 


    it 'turns off bootstrap mode if bootstrap_mode_min_users is set to 0' 


    it 'does not amend setting that is not in bootstrap state' 


    it 'successfully turns off bootstrap mode' 

  end
end

