# Spree's rpsec controller tests get the Spree::ControllerHacks
# we don't need those for the anonymous controller here, so
# we call process directly instead of get
require 'spec_helper'

describe Spree::Admin::BaseController, type: :controller do
  controller(Spree::Admin::BaseController) do
    def index
      authorize! :update, Spree::Order
      render plain: 'test'
    end
  end

  context 'unauthorized request' do
    before do
      allow_any_instance_of(Spree::Admin::BaseController).to receive(:spree_current_user).and_return(nil)
    end

    it 'redirects to root' 

  end

  context '#generate_api_key' do
    let(:user) { mock_model(Spree.user_class, has_spree_role?: true) }

    before do
      allow(controller).to receive(:authorize_admin).and_return(true)
      allow(controller).to receive(:try_spree_current_user) { user }
    end

    it 'generates the API key for a user when they visit' 


    it 'does not attempt to regenerate the API key if the key is already set' 

  end
end

