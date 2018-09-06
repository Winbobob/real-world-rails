# frozen_string_literal: true

RSpec.describe "bundle update" do
  context "with --gemfile" do
    it "finds the gemfile" 

  end

  context "with gemfile set via config" do
    before do
      gemfile bundled_app("NotGemfile"), <<-G
        source "file://#{gem_repo1}"
        gem 'rack'
      G

      bundle "config --local gemfile #{bundled_app("NotGemfile")}"
      bundle! :install
    end

    it "uses the gemfile to update" 


    it "uses the gemfile while in a subdirectory" 

  end

  context "with prefer_gems_rb set" do
    before { bundle! "config prefer_gems_rb true" }

    it "prefers gems.rb to Gemfile" 

  end
end

