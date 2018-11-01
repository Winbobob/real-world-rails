describe ActAsController do

  def it_succeeds
    post :start, uid: target_uid
    expect(response).to be_success
    expect(session['user_id']).to eq target_uid
    expect(session[SessionKey.original_user_id]).to eq real_user_id
  end
  def it_fails
    post :start, uid: target_uid
    expect(response).to_not be_success
    expect(session['user_id']).to_not eq target_uid
    expect(session[SessionKey.original_user_id]).to be_nil
  end

  describe '#start' do
    let(:target_uid) {'978966'}
    let(:target_roles) do
      {student: true}
    end
    let(:real_user_id) {'1021845'}
    let(:real_active) {true}
    before do
      allow(Settings.features).to receive(:reauthentication).and_return(false)
      allow(User::Auth).to receive(:get).with(real_user_id).and_return(double(
        is_superuser?: real_superuser,
        is_viewer?: real_viewer,
        active?: real_active
      ))
      allow(User::AggregatedAttributes).to receive(:new).with(target_uid).and_return (double(
        get_feed: {roles: target_roles}
      ))
    end
    shared_examples 'successful view-as' do
      it 'works the first time' 

      it 'switches targets' 

    end
    context 'superuser' do
      let(:real_superuser) {true}
      let(:real_viewer) {false}
      it_behaves_like 'successful view-as'
      context 'with confidential student' do
        let(:target_roles) do
          {student: true, confidential: true}
        end
        it_behaves_like 'successful view-as'
      end
    end
    context 'viewer' do
      let(:real_superuser) {false}
      let(:real_viewer) {true}
      it_behaves_like 'successful view-as'
      context 'with confidential student' do
        let(:target_roles) do
          {student: true, confidential: true}
        end
        it 'is denied' 

      end
    end
    context 'possible Canvas masquerader' do
      let(:real_superuser) {true}
      let(:real_viewer) {false}
      before do
        # Override the previous stub.
        allow(User::Auth).to receive(:get).with(nil).and_call_original
      end
      it 'is denied' 

    end
    context 'normal user' do
      let(:real_superuser) {false}
      let(:real_viewer) {false}
      before do
        allow(User::AggregatedAttributes).to receive(:new).with(real_user_id).and_return (double(
          get_feed: {roles: {}}
        ))
      end
      it 'is denied' 

    end
    context 'acting as oneself' do
      let(:real_superuser) {false}
      let(:real_viewer) {true}
      let(:target_uid) {real_user_id}
      it 'refuses to budge' 

    end
  end

end
