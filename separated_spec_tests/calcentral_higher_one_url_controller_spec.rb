describe CampusSolutions::HigherOneUrlController do

  let(:user_id) { '12349' }
  let(:higher_one_url) { 'https://commerce.cashnet.com/UCBpaytest?eusername=8062064084e9a8dff7a181266a3ed11e28b80eb30ab4fd84b9bc4de92394d884' }

  context 'higher one url feed' do
    let(:feed) { :get }
    it_behaves_like 'an unauthenticated user'

    context 'authenticated user' do
      let(:feed_key) { 'root' }
      it_behaves_like 'a successful feed'
      it 'has some field mapping info' 

    end
  end

  context 'redirect as a student' do
    before do
      session['user_id'] = user_id
    end
    it 'redirects to higher one' 

  end

  context 'classic view-as' do
    before do
      session['user_id'] = user_id
      session[SessionKey.original_user_id] = random_id
      allow(CalnetCrosswalk::ByUid).to receive(:new).and_return (crosswalk = double)
      allow(crosswalk).to receive(:lookup_campus_solutions_id).and_return random_id
      expect(Settings.features).to receive(:reauthentication).and_return false
    end
    it 'denies all access' 

  end

  context 'delegated access' do
    let(:uid) {random_id}
    let(:campus_solutions_id) {random_id}
    include_context 'delegated access'
    context 'enrollments-only access' do
      let(:privileges) do
        {
          viewEnrollments: true
        }
      end
      it 'denies all access' 

    end
    context 'financial access' do
      let(:privileges) do
        {
          financial: true
        }
      end
      it 'allows access' 

      it 'redirects to higher one' 

    end
  end


end

