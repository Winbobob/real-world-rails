require 'browser_helper'

RSpec.feature 'Bootstrap_Requests', type: :feature, js: true, vcr: true do
  let(:submitter) { create(:confirmed_user, login: 'kugelblitz') }
  let(:receiver) { create(:confirmed_user, login: 'titan') }
  let(:target_project) { receiver.home_project }
  let(:target_package) { create(:package, name: 'goal', project_id: target_project.id) }

  context 'for role addition' do
    describe 'for packages' do
      it 'can be submitted' 

    end
  end
end

