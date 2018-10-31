# frozen_string_literal: true

describe HeaderHelper do
  describe '#header_props' do
    let(:mobile_only) { 'mobile_only_stub' }
    let(:profile) do
      {
        avatar: nil,
        name: current_user.name,
        profile: {
          name: 'Profile',
          url: "/profile?uid=#{current_user.uid}"
        },
        account: {
          name: 'Account',
          url: '/users/edit'
        },
        notifications: {
          plural: 'Notifications',
          none: 'There are none',
          clear: 'Clear'
        }
      }
    end
    subject { header_props }

    before(:each) do
      allow(self).to receive('mobile_only').and_return(mobile_only)
      allow(self).to receive('active?').and_return(false)
      allow(self).to receive('active?').with(active_path).and_return(active)
      allow(self).to receive('user_signed_in?').and_return(user_signed_in)
      allow(self).to receive('current_user').and_return(current_user)
    end

    context 'when user is signed in' do
      let(:current_user) { create :user2 }
      let(:user_signed_in) { true }
      let(:active_path) { resources_path }

      context 'has no active link' do
        let(:active) { false }
        it 'returns correct props' 

      end

      context 'has an active link' do
        let(:active) { true }
        it 'returns correct props' 

      end
    end

    context 'when user is not signed in' do
      let(:current_user) { nil }
      let(:user_signed_in) { false }
      let(:active_path) { new_user_session_path }

      context 'has no active link' do
        let(:active) { false }
        it 'returns correct props' 

      end

      context 'has an active link' do
        let(:active) { true }
        it 'returns correct props' 

      end
    end
  end
end

