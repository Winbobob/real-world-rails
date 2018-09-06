require 'rails_helper'

describe Jobs::EnableBootstrapMode do

  context '.execute' do
    let(:admin) { Fabricate(:admin) }

    before do
      SiteSetting.bootstrap_mode_enabled = false
    end

    it 'raises an error when user_id is missing' 


    it 'does not execute if bootstrap mode is already enabled' 


    it 'does not turn on bootstrap mode if first admin already exists' 


    it 'does not amend setting that is not in default state' 


    it 'successfully turns on bootstrap mode' 

  end
end

