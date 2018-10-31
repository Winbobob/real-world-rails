# frozen_string_literal: true

describe MedicationsController do
  describe '#print_reminders' do
    let(:user) { FactoryBot.create(:user1) }

    subject { controller.print_reminders(medication) }

    describe 'when medication has no reminders' do
      let(:medication) { FactoryBot.create(:medication, user_id: user.id) }

      it 'is empty' 

    end

    describe 'when medication has refill reminder' do
      let(:medication) { FactoryBot.create(:medication, :with_refill_reminder, user_id: user.id) }

      it 'prints the reminder' 

    end

    describe 'when medication has daily reminder' do
      let(:medication) { FactoryBot.create(:medication, :with_daily_reminder, user_id: user.id) }

      it 'prints the reminders' 

    end

    describe 'when medication has both reminders' do
      let(:medication) { FactoryBot.create(:medication, :with_both_reminders, user_id: user.id) }

      it 'prints the reminders' 

    end

    describe 'DELETE #destroy' do
      let(:user) { create(:user) }
      let!(:medication) { create(:medication, user: user) }

      context 'when the user is logged in' do
        include_context :logged_in_user
        it 'deletes the medication' 


        it 'redirects to the medications index page' 

      end

      context 'when the user is not logged in' do
        before { delete :destroy, params: { id: medication.id } }
        it_behaves_like :with_no_logged_in_user
      end
    end
  end

  describe 'GET #index' do
    let(:user) { create(:user) }
    let!(:medication) { create(:medication, user: user) }

    context 'when signed in' do
      before { sign_in user }
      it 'renders index page' 

    end
    context 'when not signed in' do
      before { get :index }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'GET #new' do
    let(:user) { create(:user) }
    let(:medication) { create(:medication, user: user) }

    context 'when signed in' do
      before { sign_in user }
      it 'renders the new page' 

    end

    context 'when not signed in' do
      before { get :new }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    let(:medication) { create(:medication, user: user) }

    context 'when signed in' do
      before { sign_in user }
      it 'render the show page' 

    end

    context 'when not signed in' do
      before { get :show, params: { id: medication.id } }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user1) }
    let(:valid_medication_params) { attributes_for(:medication) }

    def post_create(medication_params)
      post :create, params: { medication: medication_params }
    end

    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'when valid params are supplied' do
        it 'creates a medication' 


        it 'has no validation errors' 


        it 'redirects to the medication page' 

      end

      context 'when invalid params are supplied' do
        let(:invalid_medication_params) { valid_medication_params.merge(name: nil, dosage: nil) }

        before { post_create invalid_medication_params }

        it 're-renders the creation form' 


        it 'adds errors to the medication ivar' 

      end

      context 'when the user_id is hacked' do
        it 'creates a new medication, ignoring the user_id parameter' 

      end
    end

    context 'when the user is not logged in' do
      before { post :create }
      it_behaves_like :with_no_logged_in_user
    end
  end
end

