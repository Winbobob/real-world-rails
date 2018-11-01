# frozen_string_literal: true

RSpec.describe "git base name" do
  it "base_name should strip private repo uris" 


  it "base_name should strip network share paths" 

end

%w[cache package].each do |cmd|
  RSpec.describe "bundle #{cmd} with git" do
    it "copies repository to vendor cache and uses it" 


    it "copies repository to vendor cache and uses it even when installed with bundle --path" 


    it "runs twice without exploding" 


    it "tracks updates" 


    it "tracks updates when specifying the gem" 


    it "uses the local repository to generate the cache" 


    it "copies repository to vendor cache, including submodules" 


    it "displays warning message when detecting git repo in Gemfile", :bundler => "< 2" 


    it "does not display warning message if cache_all is set in bundle config" 


    it "caches pre-evaluated gemspecs" 

  end
end

