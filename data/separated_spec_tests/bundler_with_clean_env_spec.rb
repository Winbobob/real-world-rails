# frozen_string_literal: true

RSpec.describe "Bundler.with_env helpers" do
  def bundle_exec_ruby!(code, *args)
    opts = args.last.is_a?(Hash) ? args.pop : {}
    env = opts[:env] ||= {}
    env[:RUBYOPT] ||= "-r#{spec_dir.join("support/hax")}"
    args.push opts
    bundle! "exec '#{Gem.ruby}' -e #{code}", *args
  end

  describe "Bundler.original_env" do
    before do
      bundle "config path vendor/bundle"
      gemfile ""
      bundle "install"
    end

    it "should return the PATH present before bundle was activated" 


    it "should return the GEM_PATH present before bundle was activated" 


    it "works with nested bundle exec invocations" 


    it "removes variables that bundler added" 

  end

  describe "Bundler.clean_env", :bundler => "< 2" do
    before do
      bundle "config path vendor/bundle"
      gemfile ""
      bundle "install"
    end

    it "should delete BUNDLE_PATH" 


    it "should remove '-rbundler/setup' from RUBYOPT" 


    it "should clean up RUBYLIB" 


    it "should restore the original MANPATH" 

  end

  describe "Bundler.with_original_env" do
    it "should set ENV to original_env in the block" 


    it "should restore the environment after execution" 

  end

  describe "Bundler.with_clean_env", :bundler => "< 2" do
    it "should set ENV to clean_env in the block" 


    it "should restore the environment after execution" 

  end

  describe "Bundler.clean_system", :ruby => ">= 1.9", :bundler => "< 2" do
    it "runs system inside with_clean_env" 

  end

  describe "Bundler.clean_exec", :ruby => ">= 1.9", :bundler => "< 2" do
    it "runs exec inside with_clean_env" 

  end
end

