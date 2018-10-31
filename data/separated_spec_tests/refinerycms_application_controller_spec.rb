require "spec_helper"

module Refinery
  describe ApplicationController, :type => :controller do
    before do
      Rails.application.routes.draw {
        mount Refinery::Core::Engine, :at => '/'
        get "anonymous/index"
      }
    end

    after do
      Rails.application.reload_routes!
    end

    controller(ActionController::Base) do
      include ::Refinery::ApplicationController

      def index
        head :ok
      end
    end

    describe ".home_page?" do
      it "matches root url" 


      it "matches localised root url" 


      it "matches localised root url with trailing slash" 


      it "escapes regexp" 


      it "returns false for non root url" 

    end

    describe "#presenter_for" do
      it "returns BasePresenter for nil" 


      it "returns BasePresenter when the instance's class does not have a presenter" 


      it "returns the class's presenter when the instance's class has a presenter" 

    end
  end
end

