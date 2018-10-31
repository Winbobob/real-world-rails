describe MyBadgesController do

  before(:each) do
    @user_id = rand(99999).to_s
    @fake_drive_list = GoogleApps::DriveList.new(:fake => true)
    @fake_events_list = GoogleApps::EventsRecentItems.new(:fake => true)
    allow(Settings.features).to receive(:reauthentication).and_return(false)
  end

  it 'should be an empty badges feed on non-authenticated user' 


  it 'should be an non-empty badges feed on authenticated user' 


  context 'viewing-as' do
    let(:user_id) { rand(99999).to_s }
    let(:original_user_id) { rand(99999).to_s }
    before do
      session['user_id'] = user_id
      expect(Settings.google_proxy).to receive(:fake).at_least(:once).and_return(true)
    end
    it 'should not give a real user a cached censored feed' 

    it 'should not return Google data from a cached real-user feed' 

  end

end

