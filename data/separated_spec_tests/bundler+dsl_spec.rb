# frozen_string_literal: true

RSpec.describe Bundler::Dsl do
  before do
    @rubygems = double("rubygems")
    allow(Bundler::Source::Rubygems).to receive(:new) { @rubygems }
  end

  describe "#git_source" do
    it "registers custom hosts" 


    it "raises exception on invalid hostname" 


    it "expects block passed" 


    context "default hosts (git, gist)", :bundler => "< 2" do
      it "converts :github to :git" 


      it "converts numeric :gist to :git" 


      it "converts :gist to :git" 


      it "converts 'rails' to 'rails/rails'" 


      it "converts :bitbucket to :git" 


      it "converts 'mcorp' to 'mcorp/mcorp'" 

    end

    context "default git sources", :bundler => "2" do
      it "has none" 

    end
  end

  describe "#method_missing" do
    it "raises an error for unknown DSL methods" 

  end

  describe "#eval_gemfile" do
    it "handles syntax errors with a useful message" 


    it "distinguishes syntax errors from evaluation errors" 

  end

  describe "#gem" do
    [:ruby, :ruby_18, :ruby_19, :ruby_20, :ruby_21, :ruby_22, :ruby_23, :ruby_24, :ruby_25, :mri, :mri_18, :mri_19,
     :mri_20, :mri_21, :mri_22, :mri_23, :mri_24, :mri_25, :jruby, :rbx, :truffleruby].each do |platform|
      it "allows #{platform} as a valid platform" 

    end

    it "rejects invalid platforms" 


    it "rejects empty gem name" 


    it "rejects with a leading space in the name" 


    it "rejects with a trailing space in the name" 


    it "rejects with a space in the gem name" 


    it "rejects with a tab in the gem name" 


    it "rejects with a newline in the gem name" 


    it "rejects with a carriage return in the gem name" 


    it "rejects with a form feed in the gem name" 


    it "rejects symbols as gem name" 


    it "rejects branch option on non-git gems" 


    it "allows specifying a branch on git gems" 


    it "allows specifying a branch on git gems with a git_source" 

  end

  describe "#gemspec" do
    let(:spec) do
      Gem::Specification.new do |gem|
        gem.name = "example"
        gem.platform = platform
      end
    end

    before do
      allow(Dir).to receive(:[]).and_return(["spec_path"])
      allow(Bundler).to receive(:load_gemspec).with("spec_path").and_return(spec)
      allow(Bundler).to receive(:default_gemfile).and_return(Pathname.new("./Gemfile"))
    end

    context "with a ruby platform" do
      let(:platform) { "ruby" }

      it "keeps track of the ruby platforms in the dependency" 

    end

    context "with a jruby platform" do
      let(:platform) { "java" }

      it "keeps track of the jruby platforms in the dependency" 

    end
  end

  context "can bundle groups of gems with" do
    # git "https://github.com/rails/rails.git" do
    #   gem "railties"
    #   gem "action_pack"
    #   gem "active_model"
    # end
    describe "#git" do
      it "from a single repo" 

    end

    # github 'spree' do
    #   gem 'spree_core'
    #   gem 'spree_api'
    #   gem 'spree_backend'
    # end
    describe "#github", :bundler => "< 2" do
      it "from github" 

    end

    describe "#github", :bundler => "2" do
      it "from github" 

    end
  end

  describe "syntax errors" do
    it "will raise a Bundler::GemfileError" 

  end

  describe "Runtime errors", :unless => Bundler.current_ruby.on_18? do
    it "will raise a Bundler::GemfileError" 

  end

  describe "#with_source" do
    context "if there was a rubygem source already defined" do
      it "restores it after it's done" 

    end
  end
end

