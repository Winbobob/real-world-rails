require 'rails_helper'

feature 'Participant Invitations' do
  let(:user) { create(:person) }
  let(:invitation) { create(:participant_invitation, role: 'organizer') }
  let(:event) { create(:event) }

  before { login_user(user) }

  context "User has received a participant invitation" do
    it "can accept the invitation" 


    context "User receives incorrect or missing link in participant invitation email" do
      it "shows a custom 404 error" 

    end
  end
end

