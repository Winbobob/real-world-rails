describe BootstrapController do
  let(:user_id) { random_id }

  context 'when previously authenticated by LTI' do
    before do
      session['user_id'] = user_id
      session['lti_authenticated_only'] = true
    end
    it 'should force campus authentication' 

  end

  describe 'reauthentication' do
    let(:original_user_id) {nil}
    before do
      expect(Settings.features).to receive(:reauthentication).and_return(true)
      session['user_id'] = user_id
      session[SessionKey.original_user_id] = original_user_id
    end
    context 'when viewing as' do
      let(:original_user_id) {random_id}
      context 'when not already reauthenticated' do
        it 'should redirect to reauthenticate' 

      end
      context 'when already reauthenticated' do
        before do
          allow(controller).to receive(:cookies).and_return({reauthenticated: true})
        end
        it 'should not redirect' 

      end
    end
    context 'when not viewing as' do
      it 'should not redirect' 

    end
  end

end

