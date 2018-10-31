require 'spec_helper'
require 'spree/api/testing_support/helpers'

describe UserRegistrationsController, type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:spree_user]
  end

  describe "via ajax" do
    render_views
    it "returns errors when registration fails" 


    it "returns 200 when registration succeeds" 

  end

  context "when registration fails" do
    it "renders new" 

  end

  context "when registration succeeds" do
    context "when referer is not '/checkout'" do
      it "redirects to root" 

    end

    context "when referer is '/checkout'" do
      before { @request.env['HTTP_REFERER'] = 'http://test.com/checkout' }

      it "redirects to checkout" 

    end
  end
end

