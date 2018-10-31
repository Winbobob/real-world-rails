require 'rails_helper'

describe AvatarsHelper do
  include UploadHelpers

  let(:user) { create(:user) }

  describe '#project_icon' do
    it 'returns an url for the avatar' 

  end

  describe '#avatar_icon_for' do
    let!(:user) { create(:user, avatar: File.open(uploaded_image_temp_path), email: 'bar@example.com') }
    let(:email) { 'foo@example.com' }
    let!(:another_user) { create(:user, avatar: File.open(uploaded_image_temp_path), email: email) }

    it 'prefers the user to retrieve the avatar_url' 


    it 'falls back to email lookup if no user given' 

  end

  describe '#avatar_icon_for_email' do
    let(:user) { create(:user, avatar: File.open(uploaded_image_temp_path)) }

    context 'using an email' do
      context 'when there is a matching user' do
        it 'returns a relative URL for the avatar' 

      end

      context 'when no user exists for the email' do
        it 'calls gravatar_icon' 

      end

      context 'without an email passed' do
        it 'calls gravatar_icon' 

      end
    end
  end

  describe '#avatar_icon_for_user' do
    let(:user) { create(:user, avatar: File.open(uploaded_image_temp_path)) }

    context 'with a user object passed' do
      it 'returns a relative URL for the avatar' 

    end

    context 'without a user object passed' do
      it 'calls gravatar_icon' 

    end
  end

  describe '#gravatar_icon' do
    let(:user_email) { 'user@email.com' }

    context 'with Gravatar disabled' do
      before do
        stub_application_setting(gravatar_enabled?: false)
      end

      it 'returns a generic avatar' 

    end

    context 'with Gravatar enabled' do
      before do
        stub_application_setting(gravatar_enabled?: true)
      end

      it 'returns a generic avatar when email is blank' 


      it 'returns a valid Gravatar URL' 


      it 'uses HTTPs when configured' 


      it 'returns custom gravatar path when gravatar_url is set' 


      it 'accepts a custom size argument' 


      it 'defaults size to 40@2x when given an invalid size' 


      it 'accepts a scaling factor' 


      it 'ignores case and surrounding whitespace' 

    end
  end

  describe '#user_avatar' do
    subject { helper.user_avatar(user: user) }

    it "links to the user's profile" 


    it "has the user's name as title" 


    it "contains the user's avatar image" 

  end

  describe '#user_avatar_without_link' do
    let(:options) { { user: user } }
    subject { helper.user_avatar_without_link(options) }

    it 'displays user avatar' 


    context 'with css_class parameter' do
      let(:options) { { user: user, css_class: '.cat-pics' } }

      it 'uses provided css_class' 

    end

    context 'with size parameter' do
      let(:options) { { user: user, size: 99 } }

      it 'uses provided size' 

    end

    context 'with url parameter' do
      let(:options) { { user: user, url: '/over/the/rainbow.png' } }

      it 'uses provided url' 

    end

    context 'with lazy parameter' do
      let(:options) { { user: user, lazy: true } }

      it 'adds `lazy` class to class list, sets `data-src` with avatar URL and `src` with placeholder image' 

    end

    context 'with has_tooltip parameter' do
      context 'with has_tooltip set to true' do
        let(:options) { { user: user, has_tooltip: true } }

        it 'adds has-tooltip' 

      end

      context 'with has_tooltip set to false' do
        let(:options) { { user: user, has_tooltip: false } }

        it 'does not add has-tooltip or data container' 

      end
    end

    context 'with user_name parameter' do
      let(:options) { { user_name: 'Tinky Winky', user_email: 'no@f.un' } }

      context 'with user parameter' do
        let(:options) { { user: user, user_name: 'Tinky Winky' } }

        it 'prefers user parameter' 

      end

      it 'uses user_name and user_email parameter if user is not present' 

    end
  end
end

