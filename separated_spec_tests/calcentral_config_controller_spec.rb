describe ConfigController do

  context 'unauthenticated' do
    subject {
      get :get
      JSON.parse response.body
    }
    it 'should return a JSON feed' 

    it 'should contain the correct properties' 

    it 'should not contain sensitive data' 

  end
  context 'authenticated' do
    let(:user_id) { random_id }
    subject {
      session['user_id'] = user_id
      get :get
      JSON.parse response.body
    }
    context 'ordinary user' do
      it 'should contain the uid property' 

      it 'should not contain sensitive data' 

    end
    context 'user can administrate' do
      before do
        expect(AuthenticationState).to receive(:new).and_return double(
          policy: double(can_administrate?: true),
          classic_viewing_as?: false,
          authenticated_as_advisor?: false,
          authenticated_as_delegate?: false
        )
      end
      it 'should contain sensitive data' 

    end
  end
end

