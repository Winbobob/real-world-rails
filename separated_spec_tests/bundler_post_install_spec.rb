# frozen_string_literal: true

RSpec.describe "bundle update" do
  let(:config) {}

  before do
    gemfile <<-G
      source "file://#{gem_repo1}"
      gem 'rack', "< 1.0"
      gem 'thin'
    G

    bundle! "config #{config}" if config

    bundle! :install
  end

  shared_examples "a config observer" do
    context "when ignore post-install messages for gem is set" do
      let(:config) { "ignore_messages.rack true" }

      it "doesn't display gem's post-install message" 

    end

    context "when ignore post-install messages for all gems" do
      let(:config) { "ignore_messages true" }

      it "doesn't display any post-install messages" 

    end
  end

  shared_examples "a post-install message outputter" do
    it "should display post-install messages for updated gems" 


    it "should not display the post-install message for non-updated gems" 

  end

  context "when listed gem is updated" do
    before do
      gemfile <<-G
        source "file://#{gem_repo1}"
        gem 'rack'
        gem 'thin'
      G

      bundle! :update, :all => bundle_update_requires_all?
    end

    it_behaves_like "a post-install message outputter"
    it_behaves_like "a config observer"
  end

  context "when dependency triggers update" do
    before do
      gemfile <<-G
        source "file://#{gem_repo1}"
        gem 'rack-obama'
        gem 'thin'
      G

      bundle! :update, :all => bundle_update_requires_all?
    end

    it_behaves_like "a post-install message outputter"
    it_behaves_like "a config observer"
  end
end

