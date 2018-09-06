describe CampusSolutions::DelegateAccessController do
  let(:user_id) { '12346' }

  context 'user not authenticated' do
    it 'should not get students' 


    it 'should not permit post' 

  end
  context 'authenticated user' do
    before do
      session['user_id'] = user_id
      allow(User::Auth).to receive(:where).and_return [User::Auth.new(uid: user_id, is_superuser: false, active: true)]
    end
    context 'post' do
      before do
        expect(CampusSolutions::DelegateStudentsExpiry).to receive(:expire).once.with user_id
        expect(User::Api).to receive(:expire).once.with user_id
      end
      it 'should link a claimed student' 

    end
    context 'get' do
      before do
        expect(CampusSolutions::DelegateStudentsExpiry).to receive(:expire).never
        expect(User::Api).to receive(:expire).never
      end
      it 'should get students list' 


      it 'should get terms and conditions' 


      it 'should get Campus Solutions URL for managing delegates' 

    end
  end
end

