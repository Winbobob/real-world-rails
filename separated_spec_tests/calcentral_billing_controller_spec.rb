describe CampusSolutions::BillingController do

  let(:user_id) { '12345' }

  context 'billing feed' do
    let(:feed) { :get }
    it_behaves_like 'an unauthenticated user'

    context 'authenticated user' do
      let(:feed_key) { 'summary' }
      it_behaves_like 'a successful feed'
      it 'has some field mapping info' 

    end
  end

end

