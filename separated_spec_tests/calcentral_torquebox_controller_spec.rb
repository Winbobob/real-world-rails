describe TorqueboxController do

  let (:user_id) { random_id }
  before do
    session['user_id'] = user_id
  end

  context 'a non-superuser' do
    before do
      expect(User::Auth).to receive(:where).and_return([User::Auth.new(uid: user_id, is_superuser: false, active: true)])
      expect(TorqueboxInspector).to receive(:new).never
    end
    it 'blocks destructive action' 

  end

  context 'a superuser' do
    before do
      expect(User::Auth).to receive(:where).and_return([User::Auth.new(uid: user_id, is_superuser: true, active: true)])
      expect(TorqueboxInspector).to receive(:new).and_return double(bg_purge: {purge_count: 5})
    end
    it 'permits mayhem' 

  end

end

