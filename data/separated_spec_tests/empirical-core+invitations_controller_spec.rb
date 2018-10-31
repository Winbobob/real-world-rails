require 'rails_helper'

describe InvitationsController, type: :controller do
  it { should use_before_action :verify_current_user_owns_classrooms }
  it { should use_before_action :set_classroom_ids_and_inviteee_email }

  let(:classroom) { create(:classroom) }
  let(:user) { classroom.owner }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#create_coteacher_invitation' do
    it 'should set the classroom ids' 


    it 'should give error for invalid email format' 


    it 'should give error for empty email' 


    it 'should give error for empty classroom ids' 


    it 'should kick off the invitation email worker' 


    it 'should render the correct json' 

  end

  describe '#destroy_pending_invitations_to_specific_invitee' do
    context 'when invitation exists' do
      let!(:invitation) { create(:invitation,
        invitation_type: "some type",
        invitee_email: "test@test.com",
        archived: false,
        inviter: user
      )}

      it 'should destroy the given invitation' 

    end

    context 'when invitation does not exists' do
      it 'should respond with the error' 

    end
  end

  describe '#destroy_pending_invitations_from_specific_inviter' do
    context 'when invitation exists' do
      let(:another_user) { create(:user) }
      let!(:invitation) { create(:invitation,
                                 invitation_type: "some type",
                                 invitee_email: user.email,
                                 archived: false,
                                 inviter: another_user
      )}

      it 'should destroy the given invitation' 

    end

    context 'when invitation does not exists' do
      it 'should respond with the error' 

    end
  end
end

