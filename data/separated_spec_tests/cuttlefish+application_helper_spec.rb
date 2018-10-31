# frozen_string_literal: true

require "spec_helper"

describe ApplicationHelper, type: :helper do
  describe "#bootstrap_flash" do
    it "should be empty when there is no flash" 


    it "should show an error message" 


    it "should show a notice message" 


    it "should show two messages together" 

  end

  describe "#nav_menu_item_show_active" do
    it "should create the simple markup required" 


    it "should handle a block argument" 


    context "/foo/bar is current page" do
      before :each do
        allow(helper).to receive(:current_page?).and_return(true)
      end

      it "should be active" 

    end
  end
end

