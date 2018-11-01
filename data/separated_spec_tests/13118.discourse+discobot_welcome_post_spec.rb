require 'rails_helper'

describe "Discobot welcome post" do
  let(:user) { Fabricate(:user) }

  before do
    SiteSetting.discourse_narrative_bot_enabled = true
  end

  context 'when discourse_narrative_bot_welcome_post_delay is 0' do
    it 'should not delay the welcome post' 

  end

  context 'When discourse_narrative_bot_welcome_post_delay is greater than 0' do
    before do
      SiteSetting.discourse_narrative_bot_welcome_post_delay = 5
    end

    context 'when user logs in normally' do
      it 'should delay the welcome post until user logs in' 

    end

    context 'when user redeems an invite' do
      let(:invite) { Fabricate(:invite, invited_by: Fabricate(:admin), email: 'testing@gmail.com') }

      it 'should delay the welcome post until the user logs in' 

    end

  end
end

