require "spec_helper"

module Refinery
  module Admin
    class DummyController < Refinery::AdminController
      def index
        head :ok
      end
    end
  end
end

module Refinery
  module Admin
    describe DummyController, :type => :controller do
      before do
        @routes = ActionDispatch::Routing::RouteSet.new.tap do |r|
          r.draw do
            namespace :refinery do
              namespace :admin do
                resources :dummy
              end
            end
          end
        end
      end

      context "as refinery user" do
        refinery_login

        context "with permission" do
          it "allows access" 

        end

        context "without permission" do
          it "denies access" 

        end

        describe "force_ssl!" do
          before do
            allow(controller).to receive(:require_refinery_users!).and_return(false)
          end

          it "is false so standard HTTP is used" 


          it "is true so HTTPS is used" 

        end
      end
    end
  end
end

