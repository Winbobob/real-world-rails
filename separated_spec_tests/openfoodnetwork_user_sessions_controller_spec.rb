require 'spec_helper'

describe Spree::UserSessionsController, type: :controller do
  include AuthenticationWorkflow

  let(:user) { create_enterprise_user }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:spree_user]
  end

  describe "create" do
    context "succeed" do
      context "when referer is not '/checkout'" do
        it "redirects to root" 

      end

      context "when referer is '/checkout'" do
        before { @request.env['HTTP_REFERER'] = 'http://test.com/checkout' }

        it "redirects to checkout" 

      end
    end
  end
end

