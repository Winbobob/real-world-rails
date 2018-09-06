describe CampusSolutions::AddressController do

  let(:user_id) { '12345' }

  context 'updating address' do
    it 'should not let an unauthenticated user post' 


    context 'authenticated user' do
      before do
        session['user_id'] = user_id
        User::Auth.stub(:where).and_return([User::Auth.new(uid: '1234', is_superuser: false, active: true)])
      end
      it 'should let an authenticated user post' 

      it 'should reject a post that fails validation' 

    end
  end

  context 'deleting address' do
    it 'should not let an unauthenticated user delete' 


    context 'authenticated user' do
      before do
        session['user_id'] = user_id
        User::Auth.stub(:where).and_return([User::Auth.new(uid: '1234', is_superuser: false, active: true)])
      end
      it 'should let an authenticated user delete' 

    end
  end
end


