require 'rails_helper'
describe 'ContactRequestService' do
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:group) { create(:formal_group) }
  let(:contact_request) { ContactRequest.new(message: 'a contact request', recipient_id: another_user.id) }

  before { group.add_member! user }

  describe 'create' do
    it 'sends an email if you can contact the user' 


    it 'does not send an email if you cannot contact the user' 

  end
end

