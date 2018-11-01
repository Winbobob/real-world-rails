# frozen_string_literal: true

RSpec.describe "bundle install across platforms" do
  it "maintains the same lockfile if all gems are compatible across platforms" 


  it "pulls in the correct platform specific gem" 


  it "works with gems that have different dependencies" 


  it "does not keep unneeded platforms for gems that are used" 


  it "works the other way with gems that have different dependencies" 


  it "works with gems that have extra platform-specific runtime dependencies", :bundler => "< 2" 


  it "fetches gems again after changing the version of Ruby" 

end

RSpec.describe "bundle install with platform conditionals" do
  it "installs gems tagged w/ the current platforms" 


  it "does not install gems tagged w/ another platforms" 


  it "installs gems tagged w/ the current platforms inline" 


  it "does not install gems tagged w/ another platforms inline" 


  it "installs gems tagged w/ the current platform inline" 


  it "doesn't install gems tagged w/ another platform inline" 


  it "does not blow up on sources with all platform-excluded specs" 


  it "does not attempt to install gems from :rbx when using --local" 


  it "does not attempt to install gems from other rubies when using --local" 


  it "prints a helpful warning when a dependency is unused on any platform" 


  context "when disable_platform_warnings is true" do
    before { bundle! "config disable_platform_warnings true" }

    it "does not print the warning when a dependency is unused on any platform" 

  end
end

RSpec.describe "when a gem has no architecture" do
  it "still installs correctly" 

end

