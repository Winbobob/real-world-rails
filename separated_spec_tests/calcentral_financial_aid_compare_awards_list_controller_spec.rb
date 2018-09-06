describe CampusSolutions::FinancialAidCompareAwardsListController do
  let(:user_id) { '12345' }

  context 'financial aid compare awards list feed' do
    let(:feed) { :get }
    let(:options) { {aid_year: '2016', format: 'json'} }

    context 'unauthenticated user' do
      it 'returns 401' 

    end
    context 'authenticated user' do
      before { session['user_id'] = user_id }
      it 'has some field mapping info' 

      context 'no aid year provided' do
        let(:options) { {format: 'json'} }
        it 'returns empty' 

      end
    end
  end
end

