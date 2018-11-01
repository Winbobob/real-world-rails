require "spec_helper"

module Refinery
  module Pages

    describe ".tabs" do
      after do
        Refinery::Pages.instance_eval { @tabs = [] }
      end

      it "returns an array of registered tabs" 

    end

    describe ".tabs_for_template" do
      after do
        Refinery::Pages.instance_eval { @tabs = [] }
      end

      it "returns all tabs for which #templates hasn't been set" 


      it "returns tabs with matched template" 

    end

    describe Tab do
      after do
        Refinery::Pages.instance_eval { @tabs = [] }
      end

      describe ".register" do
        it "requires name to be set" 


        it "requires partial to be set" 


        it "sets #templates if it's not set" 


        it "converts #templates to array if it's not an array already" 

      end
    end
  end
end

