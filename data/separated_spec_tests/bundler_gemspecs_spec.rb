# frozen_string_literal: true

RSpec.describe "bundle install" do
  describe "when a gem has a YAML gemspec" do
    before :each do
      build_repo2 do
        build_gem "yaml_spec", :gemspec => :yaml
      end
    end

    it "still installs correctly" 


    it "still installs correctly when using path" 

  end

  it "should use gemspecs in the system cache when available" 


  it "does not hang when gemspec has incompatible encoding" 


  context "when ruby version is specified in gemspec and gemfile" do
    it "installs when patch level is not specified and the version matches" 


    it "installs when patch level is specified and the version still matches the current version",
      :if => RUBY_PATCHLEVEL >= 0 do
      build_lib("foo", :path => bundled_app) do |s|
        s.required_ruby_version = "#{RUBY_VERSION}.#{RUBY_PATCHLEVEL}"
      end

      install_gemfile <<-G
        ruby '#{RUBY_VERSION}', :engine_version => '#{RUBY_VERSION}', :engine => 'ruby', :patchlevel => '#{RUBY_PATCHLEVEL}'
        gemspec
      G
      expect(the_bundle).to include_gems "foo 1.0"
    end

    it "fails and complains about patchlevel on patchlevel mismatch",
      :if => RUBY_PATCHLEVEL >= 0 do
      patchlevel = RUBY_PATCHLEVEL.to_i + 1
      build_lib("foo", :path => bundled_app) do |s|
        s.required_ruby_version = "#{RUBY_VERSION}.#{patchlevel}"
      end

      install_gemfile <<-G
        ruby '#{RUBY_VERSION}', :engine_version => '#{RUBY_VERSION}', :engine => 'ruby', :patchlevel => '#{patchlevel}'
        gemspec
      G

      expect(out).to include("Ruby patchlevel")
      expect(out).to include("but your Gemfile specified")
      expect(exitstatus).to eq(18) if exitstatus
    end

    it "fails and complains about version on version mismatch" 

  end
end

