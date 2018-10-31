# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AlaveteliPro::BaseController do
  controller(AlaveteliPro::BaseController) do
    def index
      render :nothing => true
    end
  end

  describe "#pro_user_authenticated?" do
    # Testing the fact that every controller action inherits the before_filter
    # of pro_user_authenticated?

    before do
      allow(controller).to receive(:feature_enabled?).with(:alaveteli_pro).and_return(true)
    end

    context "when the user is not logged in" do
      it "redirects to the signin path" 

    end

    context "when the user is logged in but not a pro" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        session[:user_id] = user.id
      end

      it "redirects to the homepage" 


      it "sets a flash notice to inform the user they're not a pro" 

    end

    context "when the user is logged in and is a pro" do
      let(:user) { FactoryGirl.create(:pro_user) }

      before do
        session[:user_id] = user.id
      end

      it "doesn't redirect anywhere" 

    end
  end
end

