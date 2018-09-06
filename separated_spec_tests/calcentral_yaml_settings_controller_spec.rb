describe YamlSettingsController do

  before(:each) do
    @user_id = rand(99999).to_s
    session['user_id'] = @user_id
    expect(Rails.env).to receive(:production?).at_least(1).times.and_return true
    expect(User::Auth).to receive(:where).and_return [user_auth]
  end

  context 'unauthorized user' do
    let(:user_auth) { User::Auth.new(uid: @user_id, is_superuser: false, active: true) }

    it 'should not allow non-admin users to reload settings' 

  end

  context 'authorized user' do
    let(:user_auth) { User::Auth.new(uid: @user_id, is_superuser: true, active: true) }

    context 'Kernel raises error' do
      it 'should abort the reload action if settings are corrupt' 

    end

    context 'valid settings' do
      context 'settings change not detected' do
        it 'should warn user of a possible problem' 

      end

      context 'settings change detected' do
        let(:original_textbooks_value) { Settings.features.textbooks }
        before {
          Settings.features.textbooks = !original_textbooks_value
        }

        it 'should succeed' 

      end
    end
  end

end

