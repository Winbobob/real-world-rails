# frozen_string_literal: true

RSpec.describe "bundle inject", :bundler => "< 2" do
  before :each do
    gemfile <<-G
      source "file://#{gem_repo1}"
      gem "rack"
    G
  end

  context "without a lockfile" do
    it "locks with the injected gems" 

  end

  context "with a lockfile" do
    before do
      bundle "install"
    end

    it "adds the injected gems to the Gemfile" 


    it "locks with the injected gems" 

  end

  context "with injected gems already in the Gemfile" do
    it "doesn't add existing gems" 

  end

  context "incorrect arguments" do
    it "fails when more than 2 arguments are passed" 

  end

  context "with source option" do
    it "add gem with source option in gemfile" 

  end

  context "with group option" do
    it "add gem with group option in gemfile" 


    it "add gem with multiple groups in gemfile" 

  end

  context "when frozen" do
    before do
      bundle "install"
      if Bundler.feature_flag.bundler_2_mode?
        bundle! "config --local deployment true"
      else
        bundle! "config --local frozen true"
      end
    end

    it "injects anyway" 


    it "locks with the injected gems" 


    it "restores frozen afterwards" 


    it "doesn't allow Gemfile changes" 

  end
end

