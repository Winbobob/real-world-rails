require 'browser_helper'

RSpec.feature 'OBS main page', type: :feature, js: true do
  let(:admin_user) { create(:admin_user) }
  let(:user) { create(:confirmed_user) }

  describe '#index' do
    it 'shows the latest four status messages' 

  end
end

