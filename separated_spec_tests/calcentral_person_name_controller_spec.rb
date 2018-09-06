describe CampusSolutions::PersonNameController do

  let(:user_id) { '12345' }

  context 'updating name' do
    it 'should not let an unauthenticated user post' 


    context 'authenticated user' do
      before do
        session['user_id'] = user_id
        User::Auth.stub(:where).and_return([User::Auth.new(uid: user_id, is_superuser: false, active: true)])
        expect(CampusSolutions::UserApiExpiry).to receive(:expire).once.with user_id
      end
      it 'should let an authenticated user post' 

    end
  end
  context 'deleting name' do
    it 'should not let an unauthenticated user delete' 


    context 'authenticated user' do
      before do
        session['user_id'] = user_id
        User::Auth.stub(:where).and_return([User::Auth.new(uid: user_id, is_superuser: false, active: true)])
      end
      it 'should let an authenticated user delete' 

    end
  end
end

