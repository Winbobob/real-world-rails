require 'rails_helper'

describe AccountsController, type: :controller do
  it { should use_before_filter :signed_in! }
  it { should use_before_filter :set_cache_buster }

  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#new' do
    before do
      session[:role] = "something"
    end

    it 'should kick off the background job, set the session values and variables' 

  end

  describe '#role' do
    context 'when role is student or teacher' do
      it 'should set the js_file and role in session' 

    end

    context 'when role is not student or teacher' do
      it 'should set the js file but not the role in session' 

    end
  end

  describe '#create' do
    context 'when user found' do
      let!(:another_user) { create(:user) }

      before do
        session[:temporary_user_id] = another_user.id
      end

      context 'when user is saved' do
        let(:callbacks) { double(:callbacks, call: true) }

        before do
          allow(CompleteAccountCreation).to receive(:new) { callbacks }
        end

        it 'should kick off the account creation callback' 


        it 'should subscribe the user to the newsletter' 


        context 'when user is a teacher and affliate tag present' do
          context 'when referrer user id found' do
            let!(:referrer) { ReferrerUser.create(referral_code: "some code", user: user) }

            before do
              allow(user).to receive(:teacher?) { true }
              request.env['affiliate.tag'] = user.referral_code
            end

            it 'should create the referralsuser' 

          end
        end

        context 'when post sign up redirect present' do
          before do
            session[:post_sign_up_redirect] = "www.test.com"
          end

          it 'should render the json' 

        end

        context 'when post sign up redirect not present' do
          context 'when user has outstanding coteacher invitation' do
            before do
              allow_any_instance_of(User).to receive(:has_outstanding_coteacher_invitation?) { true }
            end

            it 'should render the teachers classroom path json' 

          end

          context 'when user has no outstanding coteacher invitation' do
            it 'should render the user' 

          end
        end
      end

      context 'when user is not saved' do
        it 'should render the errors json' 

      end
    end
  end

  describe '#update' do
    context 'user got updated' do
      it 'should redirect to updated_account_path' 

    end

    context 'user did not get updated' do
      it 'should render accounts edit' 

    end
  end

  describe '#edit' do
    it 'should set the user' 

  end
end

