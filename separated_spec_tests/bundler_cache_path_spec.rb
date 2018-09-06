# frozen_string_literal: true

RSpec.describe "bundle package" do
  before do
    gemfile <<-G
      source "file://#{gem_repo1}"
      gem "rack"
    G
  end

  context "with --cache-path" do
    it "caches gems at given path" 

  end

  context "with config cache_path" do
    it "caches gems at given path" 

  end

  context "with absolute --cache-path" do
    it "caches gems at given path" 

  end
end

