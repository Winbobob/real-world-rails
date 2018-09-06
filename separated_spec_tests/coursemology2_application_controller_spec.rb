# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      redirect_to '/'
    end

    def create
      raise CanCan::AccessDenied
    end

    def publicly_accessible?
      true
    end
  end

  describe ApplicationMultitenancyConcern do
    # These variables override the hostname in the selected tenant object before with_tenant gets
    # to execute. This effectively changes the host requested in the mock request.
    let(:instance_host) { instance.host }
    prepend_before { instance.host = instance_host }

    with_tenant(:instance) do
      context 'when a nonexistent instance is specified' do
        let(:instance) { build_stubbed(:instance) }
        it 'falls back to the default instance' 

      end

      context 'when a host is specified' do
        let(:instance) { create(:instance) }
        context 'when the host is specified in the wrong case' do
          let(:instance_host) { instance.host.upcase! }
          it 'finds the host with case-insensitivity' 

        end

        context 'when the host has a www subdomain' do
          let(:instance_host) { 'www.' + instance.host.upcase }
          it 'finds the host without the www subdomain' 

        end

        context 'when the host has a subdomain other than www' do
          let(:instance_host) { 'random.' + instance.host.upcase }
          it 'finds the actual host' 

        end
      end
    end
  end

  describe ApplicationInternationalizationConcern do
    before { @old_i18n_locale = I18n.locale }
    after { I18n.locale = @old_i18n_locale }

    context 'when http accept language is present' do
      before { @request.env['HTTP_ACCEPT_LANGUAGE'] = 'zh-cn' }

      it 'sets the correct locale' 

    end

    context 'when http accept language is not present' do
      before { @request.env['HTTP_ACCEPT_LANGUAGE'] = nil }

      it 'sets the locale to default' 

    end

    context 'when http accept language is not available' do
      before do
        @request.env['HTTP_ACCEPT_LANGUAGE'] = 'jp'
        get :index
      end

      it 'sets the locale to default' 

    end

    context 'when http accept language belongs to the same region' do
      before { @request.env['HTTP_ACCEPT_LANGUAGE'] = 'zh-tw' }

      it 'sets the nearest locale' 

    end

    context 'when multiple http accept languages are present' do
      before { @request.env['HTTP_ACCEPT_LANGUAGE'] = 'jp, zh-tw' }

      it 'sets the nearest available locale' 

    end
  end

  describe ApplicationThemingConcern do
    context 'when the instance has a theme' do
      it 'uses the theme' 

    end

    context 'when the instance does not have a theme' do
      it 'uses the default theme' 

    end
  end

  describe ApplicationUserConcern do
    context 'when the action raises a CanCan::AccessDenied' do
      run_rescue

      it 'renders the access denied page to /pages/403' 


      it 'returns HTTP status 403' 

    end
  end

  describe ApplicationComponentsConcern do
    context 'when the action raises a Coursemology::ComponentNotFoundError' do
      run_rescue

      before do
        def controller.index
          raise ComponentNotFoundError
        end
      end

      it 'renders the component not found page to /public/404' 


      it 'returns HTTP status 404' 

    end
  end

  describe '#without_bullet' do
    it 'disables bullet within the block' 

  end

  context 'when the action raises an IllegalStateError' do
    run_rescue

    before do
      def controller.index
        raise IllegalStateError
      end
    end

    it 'renders the request rejected page /public/422' 


    it 'returns HTTP status 422' 


    context 'when the request only accepts a json response' do
      before { request.accept = 'application/json' }

      it 'renders the correct template' 

    end
  end

  context 'when the action raises ActionController::InvalidAuthenticityToken' do
    run_rescue

    before do
      def controller.index
        raise ActionController::InvalidAuthenticityToken
      end
    end

    it 'renders the request rejected page /public/403' 


    it 'returns HTTP status 403' 


    context 'when the request only accepts a json response' do
      before { request.accept = 'application/json' }

      it 'renders the correct template' 

    end
  end
end

