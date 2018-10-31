describe MyUpNextController do

  context 'unauthenticated user' do
    it 'returns an empty feed' 

  end

  context 'authenticated user' do
    let(:user_id) { rand(99999).to_s }
    before do
      session['user_id'] = user_id
    end
    it 'returns a non-empty feed' 

  end

  context 'viewing-as' do
    let(:user_id) { rand(99999).to_s }
    let(:original_user_id) { rand(99999).to_s }
    before do
      session['user_id'] = user_id
      expect(Settings.google_proxy).to receive(:fake).at_least(:once).and_return(true)
      allow(Settings.features).to receive(:reauthentication).and_return(false)
    end
    it 'should not give a real user a cached censored feed' 

    it 'should not return a cached real-user feed' 

  end

end

