require 'spec_helper'

describe Storytime::DashboardController, type: :controller do
  context "for actions of subclasses" do
    class WidgetsController < Storytime::DashboardController; end

    controller(WidgetsController) do
      def index; end
    end

    it "requires login" 


    it "requires authorization" 


    it "redirects to site setup if none exists" 

  end
end

