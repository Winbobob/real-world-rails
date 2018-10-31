# frozen_string_literal: true
describe PageRedirectConcern, type: :controller do
  controller(MomentsController) do
  end

  let(:user) { create(:user) }

  describe '#if_not_signed_in' do
    context 'when user is not signed in' do
      it 'redirect to the sign in page' 

    end

    context 'when user is signed in' do
      before(:each) do
        sign_in user
      end

      it 'does not redirect to the sign in page' 

    end
  end

  describe '#redirect_to_path' do
    before(:each) do
      sign_in user
    end

    it 'directs to path' 

  end
end

