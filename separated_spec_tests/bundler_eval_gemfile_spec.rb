# frozen_string_literal: true

RSpec.describe "bundle install with gemfile that uses eval_gemfile" do
  before do
    build_lib("gunks", :path => bundled_app.join("gems/gunks")) do |s|
      s.name    = "gunks"
      s.version = "0.0.1"
    end
  end

  context "eval-ed Gemfile points to an internal gemspec" do
    before do
      create_file "Gemfile-other", <<-G
        gemspec :path => 'gems/gunks'
      G
    end

    it "installs the gemspec specified gem" 

  end

  context "eval-ed Gemfile has relative-path gems" do
    before do
      build_lib("a", :path => "gems/a")
      create_file "nested/Gemfile-nested", <<-G
        gem "a", :path => "../gems/a"
      G

      gemfile <<-G
        eval_gemfile "nested/Gemfile-nested"
      G
    end

    it "installs the path gem" 


    # Make sure that we are properly comparing path based gems between the
    # parsed lockfile and the evaluated gemfile.
    it "bundles with --deployment" 

  end

  context "Gemfile uses gemspec paths after eval-ing a Gemfile" do
    before { create_file "other/Gemfile-other" }

    it "installs the gemspec specified gem" 

  end

  context "eval-ed Gemfile references other gemfiles" do
    it "works with relative paths" 

  end
end

