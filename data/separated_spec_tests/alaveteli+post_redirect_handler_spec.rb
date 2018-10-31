# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AlaveteliPro::PostRedirectHandler, type: :controller do
  controller do
    include AlaveteliPro::PostRedirectHandler
  end

  describe "#override_post_redirect_for_pro" do
    context "when the uri matches /<locale>/new" do
      let(:uri) { '/en/new' }
      let(:user) { FactoryBot.create(:pro_user) }
      let(:post_redirect) do
        FactoryBot.create(:new_request_post_redirect, user: user, uri: uri)
      end

      it "creates a draft info request" 


      it "overrides the uri" 

    end

    context "when the uri does not match /<locale>/new" do
      let(:uri) { '/en/new/public_body' }
      let(:user) { FactoryBot.create(:pro_user) }
      let(:post_redirect) do
        FactoryBot.create(:post_redirect, user: user, uri: uri)
      end

      it "does not override the uri" 

    end
  end
end

