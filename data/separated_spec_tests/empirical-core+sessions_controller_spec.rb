require 'rails_helper'

describe SessionsController, type: :controller do
  it { should use_before_filter :signed_in! }
  it { should use_before_filter :set_cache_buster }

  describe '#create' do
    let!(:user) { create(:user) }

    before do
      user.update(password: "test123")
      user.reload
    end

    context 'when user is nil' do
      it 'should report login failiure' 

    end

    context 'when user has signed up with google' do
      before do
        allow_any_instance_of(User).to receive(:signed_up_with_google) { true }
      end

      it 'should report login failiure' 

    end

    context 'when user has no password digest' do
      before do
        allow_any_instance_of(User).to receive(:password_digest) { nil }
      end

      it 'should report login failiure' 

    end

    context 'when user is authenticated' do
      context 'when redirect present' do
        it 'should redirect to the given url' 

      end

      context 'when redirect not present' do
        before do
          user.update(password: "test123")
        end

        it 'should redirect to profile path' 

      end
    end
  end

  describe '#login_through_ajax' do
    let!(:user) { create(:user) }

    before do
      user.update(password: "test123")
      user.reload
    end

    context 'when user is nil' do
      it 'should report login failiure' 

    end

    context 'when user has signed up with google' do
      before do
        allow_any_instance_of(User).to receive(:signed_up_with_google) { true }
      end

      it 'should report login failiure' 

    end

    context 'when user has no password digest' do
      before do
        allow_any_instance_of(User).to receive(:password_digest) { nil }
      end

      it 'should report login failiure' 

    end

    context 'when user is authenticated' do
      context 'when session post auth redirect present' do
        before do
          session[:post_auth_redirect] = root_path
        end

        it 'should redirect to the value' 

      end

      context 'when params redirect present' do
        it 'should redirect to the value given' 

      end

      context 'when user is auditor and has a school subscription' do
        before do
          allow_any_instance_of(User).to receive(:subscription) { double(:subscription, school_subscription?: true) }
          allow_any_instance_of(User).to receive(:auditor?) { true }
        end

        it 'should redirect to subscriptions path' 

      end

      context 'when none of the above' do
        it 'should redirect to root path' 

      end
    end
  end

  describe '#destroy' do
    let(:user) { create(:user ) }

    before do
      allow(controller).to receive(:current_user) { user }
    end

    context'when session admin id present' do
      let!(:admin) { create(:admin) }

      before do
        session[:admin_id] = admin.id
      end

      it 'should login the admin and redirect to profile path' 

    end

    context 'when session staff id is present' do
      context 'when staff exists' do  
        let!(:staff) { create(:staff) }

        before do
          session[:staff_id] = staff.id
        end

        it 'should sign the staff in and redirect to cms users path' 

      end

      context 'when staff does not exist' do
        before do
          session[:staff_id] = 12
        end

        it 'should redirect to signed out path' 

      end
    end
  end
  
  describe '#new' do
    it 'should set the js file, role in session  and post auth redirect in session' 

  end
end

