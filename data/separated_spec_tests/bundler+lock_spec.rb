# frozen_string_literal: true

RSpec.describe "bundle lock" do
  def strip_lockfile(lockfile)
    strip_whitespace(lockfile).sub(/\n\Z/, "")
  end

  def read_lockfile(file = "Gemfile.lock")
    strip_lockfile bundled_app(file).read
  end

  let(:repo) { gem_repo1 }

  before :each do
    gemfile <<-G
      source "file://localhost#{repo}"
      gem "rails"
      gem "with_license"
      gem "foo"
    G

    @lockfile = strip_lockfile(normalize_uri_file(<<-L))
      GEM
        remote: file://localhost#{repo}/
        specs:
          actionmailer (2.3.2)
            activesupport (= 2.3.2)
          actionpack (2.3.2)
            activesupport (= 2.3.2)
          activerecord (2.3.2)
            activesupport (= 2.3.2)
          activeresource (2.3.2)
            activesupport (= 2.3.2)
          activesupport (2.3.2)
          foo (1.0)
          rails (2.3.2)
            actionmailer (= 2.3.2)
            actionpack (= 2.3.2)
            activerecord (= 2.3.2)
            activeresource (= 2.3.2)
            rake (= 10.0.2)
          rake (10.0.2)
          with_license (1.0)

      PLATFORMS
        #{lockfile_platforms}

      DEPENDENCIES
        foo
        rails
        with_license

      BUNDLED WITH
         #{Bundler::VERSION}
    L
  end

  it "prints a lockfile when there is no existing lockfile with --print" 


  it "prints a lockfile when there is an existing lockfile with --print" 


  it "writes a lockfile when there is no existing lockfile" 


  it "writes a lockfile when there is an outdated lockfile using --update" 


  it "does not fetch remote specs when using the --local option" 


  it "works with --gemfile flag" 


  it "writes to a custom location using --lockfile" 


  it "writes to custom location using --lockfile when a default lockfile is present" 


  it "update specific gems using --update" 


  it "errors when updating a missing specific gems using --update" 


  it "can lock without downloading gems" 


  # see update_spec for more coverage on same options. logic is shared so it's not necessary
  # to repeat coverage here.
  context "conservative updates" do
    before do
      build_repo4 do
        build_gem "foo", %w[1.4.3 1.4.4] do |s|
          s.add_dependency "bar", "~> 2.0"
        end
        build_gem "foo", %w[1.4.5 1.5.0] do |s|
          s.add_dependency "bar", "~> 2.1"
        end
        build_gem "foo", %w[1.5.1] do |s|
          s.add_dependency "bar", "~> 3.0"
        end
        build_gem "bar", %w[2.0.3 2.0.4 2.0.5 2.1.0 2.1.1 3.0.0]
        build_gem "qux", %w[1.0.0 1.0.1 1.1.0 2.0.0]
      end

      # establish a lockfile set to 1.4.3
      install_gemfile <<-G
        source "file://#{gem_repo4}"
        gem 'foo', '1.4.3'
        gem 'bar', '2.0.3'
        gem 'qux', '1.0.0'
      G

      # remove 1.4.3 requirement and bar altogether
      # to setup update specs below
      gemfile <<-G
        source "file://#{gem_repo4}"
        gem 'foo'
        gem 'qux'
      G
    end

    it "single gem updates dependent gem to minor" 


    it "minor preferred with strict" 

  end

  it "supports adding new platforms" 


  it "supports adding the `ruby` platform" 


  it "warns when adding an unknown platform" 


  it "allows removing platforms" 


  it "errors when removing all platforms" 


  # from https://github.com/bundler/bundler/issues/4896
  it "properly adds platforms when platform requirements come from different dependencies" 


  context "when an update is available" do
    let(:repo) { gem_repo2 }

    before do
      lockfile(@lockfile)
      build_repo2 do
        build_gem "foo", "2.0"
      end
    end

    it "does not implicitly update" 


    it "accounts for changes in the gemfile" 

  end
end

