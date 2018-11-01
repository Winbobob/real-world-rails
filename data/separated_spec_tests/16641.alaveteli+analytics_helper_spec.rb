# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AnalyticsHelper do

  include AnalyticsHelper

  describe "#track_analytics_event" do
    it "returns correctly formatted event javascript" 


    context "when supplied option values" do
      it "includes any supplied :label option string" 


      it "uses 1 as the default for value if no :value option supplied" 


      it "uses the supplied :value option if there is one" 


      it "treats the label as raw JavaScript if passed :label_is_script=true" 


      it "ignores the :value option unless a :label option is supplied" 


      it "raises an ArgumentError if the :value option is not an Integer" 


    end

  end

end

