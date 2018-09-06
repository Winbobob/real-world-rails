describe CampusSolutions::SlrDeeplinkController do

  let(:user_id) { '12345' }

  context 'SLR feed' do
    let(:feed) { :get }
    it_behaves_like 'an unauthenticated user'

    context 'authenticated user' do
      let(:feed_key) { 'root' }
      it_behaves_like 'a successful feed'
      it 'has some field mapping info' 

    end
  end

end

