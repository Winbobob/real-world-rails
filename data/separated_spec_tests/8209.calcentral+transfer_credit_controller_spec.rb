describe TransferCreditController do
  before do
    allow(MyAcademics::MyTransferCredit).to receive(:from_session).and_return double get_feed_as_json: { feed: 'test' }
  end

  describe '#get_feed' do
    let(:make_request) { get :get_feed }
    it_behaves_like 'a user authenticated api endpoint'

    context 'when authenticated user exists' do
      let(:uid) { random_id }
      subject { make_request }

      context 'normal user session' do
        it 'should return a feed' 

      end
    end
  end
end

