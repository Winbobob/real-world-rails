describe CanvasUserProvisionController do

  describe '#user_import' do
    let(:user_id_string)     { '1234,1235' }

    context 'if session user not present' do
      before { session['user_id'] = nil }
      it 'returns empty hash' 

    end

    context 'if session user is not an admin' do
      before do
        session['user_id'] = '2050'
        User::Auth.stub(:where).and_return([User::Auth.new(uid: '2050', is_superuser: false, active: true)])
      end

      it 'returns 403 error' 

    end

    context 'if admin user authenticated' do
      before do
        session['user_id'] = '2050'
        User::Auth.stub(:where).and_return([User::Auth.new(uid: '2050', is_superuser: true, active: true)])
        allow_any_instance_of(CanvasCsv::UserProvision).to receive(:import_users).and_return true
      end

      it 'returns success response' 


      context 'if StandardError exception raised' do
        it 'returns error response' 

      end

    end

  end

end

