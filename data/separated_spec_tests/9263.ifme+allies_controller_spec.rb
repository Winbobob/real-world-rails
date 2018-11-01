# frozen_string_literal: true

describe AlliesController do
  let(:user) { create(:user) }
  let(:ally) { create(:user, name: 'Marco') }
  let(:notification) { double(:notification) }

  describe '#index' do
    subject { get :index }

    context 'when user is logged in' do
      include_context :logged_in_user

      it 'renders the correct template' 


      it 'sets the correct instance variables' 

    end

    context 'when user is not logged in' do
      before { subject }

      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'POST #add' do
    context 'when user is logged in' do
      include_context :logged_in_user

      let(:notification_params) do
        {
          user_id: ally.id.to_s,
          uniqueid: "#{notification_type}_#{user.id}",
          data: {
            user: user.name,
            user_id: user.id,
            uid: user.uid,
            type: notification_type,
            uniqueid: "#{notification_type}_#{user.id}"
          }.to_json
        }
      end

      subject { post :add, params: { ally_id: ally.id } }

      context 'with an existing ally request' do
        let!(:allyship) do
          Allyship.create(
            user_id: user.id,
            ally_id: ally.id,
            status: :pending_from_ally
          )
        end

        let!(:notification) do
          create(:notification, uniqueid: "new_ally_request_#{ally.id}", user_id: user.id)
        end

        let!(:notification_type) { 'accepted_ally_request' }

        it 'updates the allyship status to "accepted"' 


        it 'deletes the allyship request notification' 


        it 'creates an accepted allyship request notification' 


        it 'sends an email notification to the ally' 

      end

      context 'with no existing allyship request' do
        let(:notification_type) { 'new_ally_request' }

        it 'creates a pending allyship request' 


        it 'creates a new allyship request notification' 

      end
    end

    context 'when user is not logged in' do
      before { post :add }

      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'DELETE #remove' do
    let!(:allyship) { double(:allyship) }

    context 'when user is logged in' do
      include_context :logged_in_user

      it 'deletes the allyship' 

    end

    context 'when user is not logged in' do
      before { delete :remove }
      it_behaves_like :with_no_logged_in_user
    end
  end
end

