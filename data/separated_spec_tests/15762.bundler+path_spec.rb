# frozen_string_literal: true

%w[cache package].each do |cmd|
  RSpec.describe "bundle #{cmd} with path" do
    it "is no-op when the path is within the bundle" 


    it "copies when the path is outside the bundle " 


    it "copies when the path is outside the bundle and the paths intersect" 


    it "updates the path on each cache" 


    it "removes stale entries cache" 


    it "raises a warning without --all", :bundler => "< 2" 


    it "stores the given flag" 


    it "can rewind chosen configuration" 

  end
end

