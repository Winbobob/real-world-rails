require 'rails_helper'

RSpec.describe InvitationsController, :type => :controller do
  let (:invitation) { FactoryGirl.create(:invitation) }
  let(:user) { FactoryGirl.create(:user) }

  describe 'GET #show' do
    context 'signed in' do
      before { sign_in user }

      context 'with correct token' do
        before do
          allow(Invitation).to receive(:find_by!).with(token: invitation.token).
                            and_return(invitation)
          allow(invitation).to receive(:accept!).and_return(invitation)
          allow(session).to receive(:delete)
          get :show, id: invitation.token
        end

        it { expect(invitation).to have_received(:accept!).with(user) }
        it { expect(session).to have_received(:delete).with(:invitation_token) }
        it { expect(response).to redirect_to(walkthrough_party_path(invitation.invitable))}
      end

      context 'user already a rep of party' do
        it 'renders invitation not found template' 

      end
    end

    context 'signed out' do
      context 'with correct token' do
        before { get :show, id: invitation.token }

        it { expect(session[:invitation_token]).to eq(invitation.token) }
        it { expect(response).to redirect_to(new_user_registration_path) }
      end
    end

    context 'with incorrect token' do
      before { get :show, id: 123 }

      it { expect(session[:invitation_token]).to be_nil }
      it { expect(response).to render_template(:invitation_not_found) }
    end

    context 'invitation already accepted' do
      it 'renders invitation not found template' 

    end
  end

  describe "#destroy" do
    it 'destroys invitation' 

  end
end

