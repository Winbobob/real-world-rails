require 'spec_helper'

describe ApplicationController do
  include TermsHelper

  let(:user) { create(:user) }

  describe '#check_password_expiration' do
    let(:controller) { described_class.new }

    before do
      allow(controller).to receive(:session).and_return({})
    end

    it 'redirects if the user is over their password expiry' 


    it 'does not redirect if the user is under their password expiry' 


    it 'does not redirect if the user is over their password expiry but they are an ldap user' 


    it 'does not redirect if the user is over their password expiry but password authentication is disabled for the web interface' 

  end

  describe "#authenticate_user_from_personal_access_token!" do
    controller(described_class) do
      def index
        render text: 'authenticated'
      end
    end

    let(:personal_access_token) { create(:personal_access_token, user: user) }

    context "when the 'personal_access_token' param is populated with the personal access token" do
      it "logs the user in" 

    end

    context "when the 'PERSONAL_ACCESS_TOKEN' header is populated with the personal access token" do
      it "logs the user in" 

    end

    it "doesn't log the user in otherwise" 

  end

  describe 'rescue from Gitlab::Git::Storage::Inaccessible' do
    controller(described_class) do
      def index
        raise Gitlab::Git::Storage::Inaccessible.new('broken', 100)
      end
    end

    it 'renders a 503 when storage is not available' 


    it 'renders includes a Retry-After header' 

  end

  describe 'response format' do
    controller(described_class) do
      def index
        respond_to do |format|
          format.json do
            head :ok
          end
        end
      end
    end

    before do
      sign_in user
    end

    context 'when format is handled' do
      let(:requested_format) { :json }

      it 'returns 200 response' 

    end

    context 'when format is not handled' do
      it 'returns 404 response' 

    end
  end

  describe '#authenticate_user_from_rss_token' do
    describe "authenticating a user from an RSS token" do
      controller(described_class) do
        def index
          render text: 'authenticated'
        end
      end

      context "when the 'rss_token' param is populated with the RSS token" do
        context 'when the request format is atom' do
          it "logs the user in" 

        end

        context 'when the request format is not atom' do
          it "doesn't log the user in" 

        end
      end

      context "when the 'rss_token' param is populated with an invalid RSS token" do
        it "doesn't log the user" 

      end
    end
  end

  describe '#route_not_found' do
    it 'renders 404 if authenticated' 


    it 'does redirect to login page via authenticate_user! if not authenticated' 

  end

  describe '#set_page_title_header' do
    let(:controller) { described_class.new }

    it 'URI encodes UTF-8 characters in the title' 

  end

  context 'two-factor authentication' do
    let(:controller) { described_class.new }

    describe '#check_two_factor_requirement' do
      subject { controller.send :check_two_factor_requirement }

      it 'does not redirect if 2FA is not required' 


      it 'does not redirect if user is not logged in' 


      it 'does not redirect if user has 2FA enabled' 


      it 'does not redirect if 2FA setup can be skipped' 


      it 'redirects to 2FA setup otherwise' 

    end

    describe '#two_factor_authentication_required?' do
      subject { controller.send :two_factor_authentication_required? }

      it 'returns false if no 2FA requirement is present' 


      it 'returns true if a 2FA requirement is set in the application settings' 


      it 'returns true if a 2FA requirement is set on the user' 

    end

    describe '#two_factor_grace_period' do
      subject { controller.send :two_factor_grace_period }

      it 'returns the grace period from the application settings' 


      context 'with a 2FA requirement set on the user' do
        let(:user) { create :user, require_two_factor_authentication_from_group: true, two_factor_grace_period: 23 }

        it 'returns the user grace period if lower than the application grace period' 


        it 'returns the application grace period if lower than the user grace period' 

      end
    end

    describe '#two_factor_grace_period_expired?' do
      subject { controller.send :two_factor_grace_period_expired? }

      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'returns false if the user has not started their grace period yet' 


      context 'with grace period started' do
        let(:user) { create :user, otp_grace_period_started_at: 2.hours.ago }

        it 'returns true if the grace period has expired' 


        it 'returns false if the grace period is still active' 

      end
    end

    describe '#two_factor_skippable' do
      subject { controller.send :two_factor_skippable? }

      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'returns false if 2FA is not required' 


      it 'returns false if the user has already enabled 2FA' 


      it 'returns false if the 2FA grace period has expired' 


      it 'returns true otherwise' 

    end

    describe '#skip_two_factor?' do
      subject { controller.send :skip_two_factor? }

      it 'returns false if 2FA setup was not skipped' 


      context 'with 2FA setup skipped' do
        before do
          allow(controller).to receive(:session).and_return({ skip_two_factor: 2.hours.from_now })
        end

        it 'returns false if the grace period has expired' 


        it 'returns true if the grace period is still active' 

      end
    end
  end

  context 'terms' do
    controller(described_class) do
      def index
        render text: 'authenticated'
      end
    end

    before do
      stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')
      sign_in user
    end

    it 'does not query more when terms are enforced' 


    context 'when terms are enforced' do
      before do
        enforce_terms
      end

      it 'redirects if the user did not accept the terms'  do
        get :index

        expect(response).to have_gitlab_http_status(302)
      end

      it 'does not redirect when the user accepted terms' 


      context 'for sessionless users' do
        before do
          sign_out user
        end

        it 'renders a 403 when the sessionless user did not accept the terms' 


        it 'renders a 200 when the sessionless user accepted the terms' 

      end
    end
  end
end

