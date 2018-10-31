# frozen_string_literal: true

RSpec.describe "real world edgecases", :realworld => true, :sometimes => true do
  def rubygems_version(name, requirement)
    ruby! <<-RUBY
      require #{File.expand_path("../../support/artifice/vcr.rb", __FILE__).dump}
      require "bundler"
      require "bundler/source/rubygems/remote"
      require "bundler/fetcher"
      source = Bundler::Source::Rubygems::Remote.new(URI("https://rubygems.org"))
      fetcher = Bundler::Fetcher.new(source)
      index = fetcher.specs([#{name.dump}], nil)
      rubygem = index.search(Gem::Dependency.new(#{name.dump}, #{requirement.dump})).last
      if rubygem.nil?
        raise "Could not find #{name} (#{requirement}) on rubygems.org!\n" \
          "Found specs:\n\#{index.send(:specs).inspect}"
      end
      "#{name} (\#{rubygem.version})"
    RUBY
  end

  # there is no rbx-relative-require gem that will install on 1.9
  it "ignores extra gems with bad platforms", :ruby => "~> 1.8.7" 


  # https://github.com/bundler/bundler/issues/1202
  it "bundle cache works with rubygems 1.3.7 and pre gems",
    :ruby => "~> 1.8.7", :rubygems => "~> 1.3.7" do
    install_gemfile <<-G
      source "https://rubygems.org"
      gem "rack",          "1.3.0.beta2"
      gem "will_paginate", "3.0.pre2"
    G
    bundle :cache
    expect(out).not_to include("Removing outdated .gem files from vendor/cache")
  end

  # https://github.com/bundler/bundler/issues/1486
  # this is a hash collision that only manifests on 1.8.7
  it "finds the correct child versions", :ruby => "~> 1.8.7" 


  it "resolves dependencies correctly", :ruby => "1.9.3" 


  it "installs the latest version of gxapi_rails", :ruby => "1.9.3" 


  it "installs the latest version of i18n" 


  it "is able to update a top-level dependency when there is a conflict on a shared transitive child", :ruby => "2.1" 


  # https://github.com/bundler/bundler/issues/1500
  it "does not fail install because of gem plugins" 


  it "checks out git repos when the lockfile is corrupted" 


  it "outputs a helpful error message when gems have invalid gemspecs" 

end

