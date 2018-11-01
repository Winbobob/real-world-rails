describe SessionsController do
  let(:cookie_hash) { {} }
  let(:response_body) { nil }

  describe '#lookup' do
    let(:omniauth_auth) do
      {
        'uid' => user_id
      }
    end
    before(:each) do
      @request.env['omniauth.auth'] = omniauth_auth
      cookie_hash = {}
      :logout
    end

    context 'session management' do
      let(:user_id) { random_id }

      it 'logs the user out when CAS uid does not match original user uid' 

      it 'will create reauth cookie if original user_id not found in session' 

      it 'will reset session when CAS uid does not match uid in session' 

      it 'will redirect to CAS logout, despite LTI user session, when CAS user_id is an unexpected value' 

    end

    context 'with SAML attributes' do
      let(:cs_id) { random_id }
      let(:user_id) { random_id }
      let(:omniauth_auth) do
        dbl = double
        allow(dbl).to receive(:[]).with('uid').and_return user_id
        allow(dbl).to receive(:extra).and_return({
          'berkeleyEduCSID' => cs_id
        })
        dbl
      end
      it 'will cache the Campus Solutions ID if provided through CAS' 

    end
  end

  describe '#reauth_admin' do
    it 'will redirect to designated reauth path' 

  end

end

