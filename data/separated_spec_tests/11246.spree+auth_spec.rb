require 'spec_helper'
require 'spree/testing_support/url_helpers'

class FakesController < ApplicationController
  include Spree::Core::ControllerHelpers::Auth
  def index
    render plain: 'index'
  end
end

describe Spree::Core::ControllerHelpers::Auth, type: :controller do
  controller(FakesController) {}
  include Spree::TestingSupport::UrlHelpers

  describe '#current_ability' do
    it 'returns Spree::Ability instance' 

  end

  describe '#redirect_back_or_default' do
    controller(FakesController) do
      def index
        redirect_back_or_default('/')
      end
    end
    it 'redirects to session url' 

    it 'redirects to HTTP_REFERER' 

    it 'redirects to default page' 

  end

  describe '#set_token' do
    controller(FakesController) do
      def index
        set_token
        render plain: 'index'
      end
    end
    it 'sends cookie header' 

    it 'sets httponly flag' 

  end

  describe '#store_location' do
    it 'sets session return url' 

  end

  describe '#try_spree_current_user' do
    it 'calls spree_current_user when define spree_current_user method' 

    it 'calls current_spree_user when define current_spree_user method' 

    it 'returns nil' 

  end

  describe '#redirect_unauthorized_access' do
    controller(FakesController) do
      def index
        redirect_unauthorized_access
      end
    end
    context 'when logged in' do
      before do
        allow(controller).to receive_messages(try_spree_current_user: double('User', id: 1, last_incomplete_spree_order: nil))
      end
      it 'redirects forbidden path' 

    end
    context 'when guest user' do
      before do
        allow(controller).to receive_messages(try_spree_current_user: nil)
      end
      it 'redirects login path' 

      it 'redirects root path' 

    end
  end
end

