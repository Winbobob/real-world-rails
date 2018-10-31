require "spec_helper"

describe ApplicationController do
  controller do
    def index
      render text: nil
    end
  end

  describe "#validate_page_param" do
    it "should try to convert page param to an integer" 


    it "should default to page nil when no page number param is given" 

  end
end

