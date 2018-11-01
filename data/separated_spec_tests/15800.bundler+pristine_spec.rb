# frozen_string_literal: true

require "bundler/vendored_fileutils"

RSpec.describe "bundle pristine" do
  before :each do
    build_lib "baz", :path => bundled_app do |s|
      s.version = "1.0.0"
      s.add_development_dependency "baz-dev", "=1.0.0"
    end

    build_repo2 do
      build_gem "weakling"
      build_gem "baz-dev", "1.0.0"
      build_gem "very_simple_binary", &:add_c_extension
      build_git "foo", :path => lib_path("foo")
      build_git "git_with_ext", :path => lib_path("git_with_ext"), &:add_c_extension
      build_lib "bar", :path => lib_path("bar")
    end

    install_gemfile! <<-G
      source "file://#{gem_repo2}"
      gem "weakling"
      gem "very_simple_binary"
      gem "foo", :git => "#{lib_path("foo")}"
      gem "git_with_ext", :git => "#{lib_path("git_with_ext")}"
      gem "bar", :path => "#{lib_path("bar")}"

      gemspec
    G
  end

  context "when sourced from RubyGems" do
    it "reverts using cached .gem file" 


    it "does not delete the bundler gem" 

  end

  context "when sourced from git repo" do
    it "reverts by resetting to current revision`" 


    it "removes added files" 

  end

  context "when sourced from gemspec" do
    it "displays warning and ignores changes when sourced from gemspec" 


    it "reinstall gemspec dependency" 

  end

  context "when sourced from path" do
    it "displays warning and ignores changes when sourced from local path" 

  end

  context "when passing a list of gems to pristine" do
    it "resets them" 


    it "raises when one of them is not in the lockfile" 

  end

  context "when a build config exists for one of the gems" do
    let(:very_simple_binary) { Bundler.definition.specs["very_simple_binary"].first }
    let(:c_ext_dir)          { Pathname.new(very_simple_binary.full_gem_path).join("ext") }
    let(:build_opt)          { "--with-ext-lib=#{c_ext_dir}" }
    before { bundle "config build.very_simple_binary -- #{build_opt}" }

    # This just verifies that the generated Makefile from the c_ext gem makes
    # use of the build_args from the bundle config
    it "applies the config when installing the gem" 

  end

  context "when a build config exists for a git sourced gem" do
    let(:git_with_ext) { Bundler.definition.specs["git_with_ext"].first }
    let(:c_ext_dir)          { Pathname.new(git_with_ext.full_gem_path).join("ext") }
    let(:build_opt)          { "--with-ext-lib=#{c_ext_dir}" }
    before { bundle "config build.git_with_ext -- #{build_opt}" }

    # This just verifies that the generated Makefile from the c_ext gem makes
    # use of the build_args from the bundle config
    it "applies the config when installing the gem" 

  end
end

