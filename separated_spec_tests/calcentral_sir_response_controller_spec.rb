describe CampusSolutions::SirResponseController do

  let(:user_id) { '12350' }
  let(:sir_statuses_feed) {
    {
      sirStatuses: [
        {
          itemStatusCode: 'I',
          chklstItemCd: 'AUSIRF',
          checkListMgmtAdmp: {
            admApplNbr: '00123456'
          }
        }
      ]
    }
  }
  let(:post_response) {
    {
      feed: {
        status: 200
      }
    }
  }

  context 'updating sir response' do
    it 'should not let an unauthenticated user post' 


    context 'authenticated user' do
      before do
        session['user_id'] = user_id
        User::Auth.stub(:where).and_return([User::Auth.new(uid: user_id, is_superuser: false, active: true)])
        CampusSolutions::Sir::SirStatuses.stub_chain(:new, :get_feed).and_return sir_statuses_feed
        CampusSolutions::Proxy.stub(:get).and_return post_response
      end
      it 'should let an authenticated user post' 

      it 'should reject a post that fails validation' 

    end
  end
end

