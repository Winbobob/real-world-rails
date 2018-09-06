describe StoredUsersController do

  let(:error_response) do
    {
      'success' => false,
      'message' => 'Please provide a numeric UID.'
    }
  end
  let(:success_response) do
      {
        'success' => true
      }
  end
  let(:users_found) do
    {
      :saved => [
        {
          :ldapUid => '1'
        }
      ],
      :recent => [
        {
          :ldapUid => '2'
        }
      ]
    }
  end
  let(:session_user_id) { random_id }

  before do
    session['user_id'] = session_user_id
    allow(User::Auth).to receive(:where).and_return [ User::Auth.new(uid: session_user_id, is_superuser: true, active: true) ]
  end

  describe '#get' do
    it 'should return stored users' 

  end

  describe '#store_saved_uid' do
    it 'should return error_response on invalid uid' 


    it 'should return success_response on valid uid' 

  end

  describe '#store_recent_uid' do
    it 'should return error_response on invalid uid' 


    it 'should return success_response on valid uid' 

  end

  describe '#delete_saved_uid' do
    it 'should return error_response on invalid uid' 


    it 'should return success_response on valid uid' 

  end

  describe '#delete_all_recent' do
    it 'should return success_response' 

  end

  describe '#delete_all_saved' do
    it 'should return success_response' 

  end

end

