describe CampusSolutions::TermsAndConditionsController do

  let(:user_id) { '12345' }

  context 'updating terms and conditions' do
    it 'should not let an unauthenticated user post' 


    context 'authenticated user' do
      before do
        session['user_id'] = user_id
        User::Auth.stub(:where).and_return([User::Auth.new(uid: user_id, is_superuser: false, active: true)])
      end
      it 'should let an authenticated user post' 

      it 'should reject a post that fails validation' 

    end
  end
end

