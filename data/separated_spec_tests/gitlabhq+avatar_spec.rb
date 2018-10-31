require 'spec_helper'

describe API::Avatar do
  let(:gravatar_service) { double('GravatarService') }

  describe 'GET /avatar' do
    context 'avatar uploaded to GitLab' do
      context 'user with matching public email address' do
        let(:user) { create(:user, :with_avatar, email: 'public@example.com', public_email: 'public@example.com') }

        before do
          user
        end

        it 'returns the avatar url' 

      end

      context 'no user with matching public email address' do
        before do
          expect(GravatarService).to receive(:new).and_return(gravatar_service)
          expect(gravatar_service).to(
            receive(:execute)
              .with('private@example.com', nil, 2, { username: nil })
              .and_return('https://gravatar'))
        end

        it 'returns the avatar url from Gravatar' 

      end
    end

    context 'avatar uploaded to Gravatar' do
      context 'user with matching public email address' do
        let(:user) { create(:user, email: 'public@example.com', public_email: 'public@example.com') }

        before do
          user

          expect(GravatarService).to receive(:new).and_return(gravatar_service)
          expect(gravatar_service).to(
            receive(:execute)
              .with('public@example.com', nil, 2, { username: user.username })
              .and_return('https://gravatar'))
        end

        it 'returns the avatar url from Gravatar' 

      end

      context 'no user with matching public email address' do
        before do
          expect(GravatarService).to receive(:new).and_return(gravatar_service)
          expect(gravatar_service).to(
            receive(:execute)
              .with('private@example.com', nil,  2, { username: nil })
              .and_return('https://gravatar'))
        end

        it 'returns the avatar url from Gravatar' 

      end

      context 'public visibility level restricted' do
        let(:user) { create(:user, :with_avatar, email: 'public@example.com', public_email: 'public@example.com') }

        before do
          user

          stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PUBLIC])
        end

        context 'when authenticated' do
          it 'returns the avatar url' 

        end

        context 'when unauthenticated' do
          it_behaves_like '403 response' do
            let(:request) { get api('/avatar'), { email: 'public@example.com' } }
          end
        end
      end
    end
  end
end

