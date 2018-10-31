describe AdvisorActAsController do

  shared_examples 'successful view-as' do
    it 'succeeds' 

  end
  shared_examples 'failed view-as' do
    it 'fails' 

  end

  describe '#start' do
    let(:target_uid) {'978966'}
    let(:target_roles) do
      {student: true}
    end
    let(:real_user_id) {'1021845'}
    let(:real_advisor) {true}
    before do
      session['user_id'] = real_user_id
      allow(Settings.features).to receive(:reauthentication).and_return(false)
      allow(User::Auth).to receive(:get).with(real_user_id).and_return(double(
        is_superuser?: false,
        is_viewer?: false,
        active?: true
      ))
      allow(User::AggregatedAttributes).to receive(:new).with(target_uid).and_return (double(
        get_feed: {roles: target_roles}
      ))
      allow(User::AggregatedAttributes).to receive(:new).with(real_user_id).and_return (double(
        get_feed: {roles: {advisor: real_advisor}}
      ))
    end
    context 'advisor seeks student' do
      it_behaves_like 'successful view-as'
    end
    context 'advisor seeks non-student' do
      let(:target_roles) do
        {staff: true}
      end
      it_behaves_like 'failed view-as'
    end
    context 'advisor seeks confidential student' do
      let(:target_roles) do
        {student: true, confidential: true}
      end
      it_behaves_like 'failed view-as'
    end
    context 'non-advisor seeks student' do
      let(:real_advisor) {false}
      it_behaves_like 'failed view-as'
    end
  end

end

