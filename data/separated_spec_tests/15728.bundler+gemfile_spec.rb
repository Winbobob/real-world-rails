# encoding: utf-8
# frozen_string_literal: true

RSpec.describe "bundle install" do
  context "with duplicated gems" do
    it "will display a warning" 

  end

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
    end
    it "uses the gemfile to install" 

    it "uses the gemfile while in a subdirectory" 

  end

  context "with deprecated features" do
    before :each do
      in_app_root
    end

    it "reports that lib is an invalid option" 

  end

  context "with prefer_gems_rb set" do
    before { bundle! "config prefer_gems_rb true" }

    it "prefers gems.rb to Gemfile" 

  end

  context "with engine specified in symbol" do
    it "does not raise any error parsing Gemfile" 


    it "installation succeeds" 

  end

  context "with a Gemfile containing non-US-ASCII characters" do
    it "reads the Gemfile with the UTF-8 encoding by default" 


    it "respects the magic encoding comment" 

  end
end

