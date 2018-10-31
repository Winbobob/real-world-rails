# frozen_string_literal: true

RSpec.describe "Gem::Specification#match_platform" do
  it "does not match platforms other than the gem platform" 


  context "when platform is a string" do
    it "matches when platform is a string" 

  end
end

RSpec.describe "Bundler::GemHelpers#generic" do
  include Bundler::GemHelpers

  it "converts non-windows platforms into ruby" 


  it "converts java platform variants into java" 


  it "converts mswin platform variants into x86-mswin32" 


  it "converts 32-bit mingw platform variants into x86-mingw32" 


  it "converts 64-bit mingw platform variants into x64-mingw32" 

end

RSpec.describe "Gem::SourceIndex#refresh!" do
  before do
    install_gemfile <<-G
      source "file://#{gem_repo1}"
      gem "rack"
    G
  end

  it "does not explode when called", :rubygems => "1.7" 


  it "does not explode when called", :rubygems => "< 1.7" 

end

