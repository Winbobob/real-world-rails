describe CampusSolutions::EmergencyPhoneController do

  let(:user_id) { '12345' }

  context 'updating emergency phone' do
    it 'should not let an unauthenticated user post' 


    context 'authenticated user' do
      before do
        session['user_id'] = user_id
        User::Auth.stub(:where).and_return([User::Auth.new(uid: user_id, is_superuser: false, active: true)])
      end
      it 'should let an authenticated user post' 

    end
  end

  context 'deleting emergency phone' do
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

