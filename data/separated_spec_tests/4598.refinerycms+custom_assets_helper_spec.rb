require "spec_helper"

module Refinery
  describe CustomAssetsHelper, :type => :helper do
    def clear_assets_used_by_spec
      Refinery::Core.javascripts.reject! {|j| %w[test parndt].include?(j) }
      Refinery::Core.stylesheets.reject! {|s| %w[test parndt].include?(s.path) }
    end

    before { clear_assets_used_by_spec }
    after { clear_assets_used_by_spec }

    describe "custom_javascripts" do
      it "should return one custom javascript in array when one javascript is registred" 


      it "should return two custom javascripts in array when two javascripts are registred" 

    end

    describe "custom_stylesheets" do
      it "should return one custom stylesheet class in array when one stylesheet is registred" 


      it "should return two custom stylesheet classes in array when two stylesheets are registred" 


      it "should return stylesheet class with path and options when both are specified" 

    end
  end
end

