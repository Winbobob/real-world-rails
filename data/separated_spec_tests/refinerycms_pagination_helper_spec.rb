require "spec_helper"

module Refinery
  describe PaginationHelper, :type => :helper do

    describe "#pagination_css_class" do
      context "when request.xhr? and params[:from_page] is set" do
        before do
          allow(controller.request).to receive(:xhr?).and_return(true)
        end

        context "when params[:from_page] > params[:page] or 1" do
          it "does something" 

        end

        context "when params[:from_page] < params[:page] or 1" do
          it "returns frame_right" 

        end
      end

      context "when request.xhr? and params[:from_page] isn't set" do
        it "returns frame_center" 

      end
    end

  end
end

