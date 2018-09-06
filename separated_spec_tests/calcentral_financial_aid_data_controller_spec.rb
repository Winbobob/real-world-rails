describe CampusSolutions::FinancialAidDataController do
  let(:user_id) { '12345' }

  context 'financial data feed' do
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
      context 'view-as' do
        before(:each) {
          expect(Settings.features).to receive(:reauthentication).and_return false
          session[original_user_id] = random_id
          model = double get_feed_as_json: { key: 'value' }
          expect(model).to receive(:aid_year=).with '2016'
          expect(filter_type).to receive(:from_session).and_return model
          expect(CampusSolutions::MyFinancialAidData).to_not receive :from_session
        }
        subject {
          response = get feed, options
          JSON.parse response.body
        }
        context 'advisor' do
          let(:filter_type) { CampusSolutions::MyFinancialAidFilteredForAdvisor }
          let(:original_user_id) { SessionKey.original_advisor_user_id }
          it 'should filter the feed' 

        end
      end
      context 'delegate user' do
        before(:each) {
          model = double get_feed_as_json: { key: 'value' }
          expect(model).to receive(:aid_year=).with '2016'
          expect(filter_type).to receive(:from_session).and_return model
          expect(CampusSolutions::MyFinancialAidData).to_not receive :from_session
        }
        subject {
          response = get feed, options
          JSON.parse response.body
        }
        let(:uid) {user_id}
        let(:campus_solutions_id) {random_id}
        let(:privileges) do
          {
            financial: true
          }
        end
        include_context 'delegated access'
        let(:filter_type) { CampusSolutions::MyFinancialAidFilteredForDelegate }
        it 'should filter the feed' 

      end
    end
  end

end

