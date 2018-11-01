require 'rails_helper'

describe NewPostManager do
  let(:user) { Fabricate(:newuser) }
  let(:admin) { Fabricate(:admin) }

  describe 'when new post containing a poll is queued for approval' do
    before do
      SiteSetting.poll_minimum_trust_level_to_create = 0
    end

    it 'should render the poll upon approval' 

  end
end

