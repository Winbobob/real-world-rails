RSpec.describe Admin::UsersController, type: :controller do
  context 'as an anonymous user' do
    let(:user) { FactoryBot.create(:user) }

    describe 'DELETE #destroy' do
      subject { User.find_by(id: user.id) }

      before { delete :destroy, params: { id: user.id } }

      it "doesn't delete the user and redirects to login" 

    end
  end

  context 'as an admin user' do
    let(:user) { FactoryBot.create(:user) }

    before { sign_in create(:admin) }

    describe 'DELETE #destroy' do
      subject { User.find_by(id: user.id) }

      before { delete :destroy, params: { id: user.to_param } }

      it "deletes the user and displays success message" 

    end
  end
end

