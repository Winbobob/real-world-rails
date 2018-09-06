# frozen_string_literal: true

RSpec.describe ".bundle/config" do
  before :each do
    gemfile <<-G
      source "file://#{gem_repo1}"
      gem "rack", "1.0.0"
    G
  end

  describe "config" do
    before { bundle "config foo bar" }

    it "prints a detailed report of local and user configuration" 


    context "given --parseable flag" do
      it "prints a minimal report of local and user configuration" 


      context "with global config" do
        it "prints config assigned to local scope" 

      end

      context "with env overwrite" do
        it "prints config with env" 

      end
    end
  end

  describe "BUNDLE_APP_CONFIG" do
    it "can be moved with an environment variable" 


    it "can provide a relative path with the environment variable" 

  end

  describe "global" do
    before(:each) { bundle :install }

    it "is the default" 


    it "can also be set explicitly" 


    it "has lower precedence than local" 


    it "has lower precedence than env" 


    it "can be deleted" 


    it "warns when overriding" 


    it "does not warn when using the same value twice" 


    it "expands the path at time of setting" 


    it "saves with parseable option" 


    context "when replacing a current value with the parseable flag" do
      before { bundle "config --global foo value" }
      it "prints the current value in a parseable format" 

    end
  end

  describe "local" do
    before(:each) { bundle :install }

    it "can also be set explicitly" 


    it "has higher precedence than env" 


    it "can be deleted" 


    it "warns when overriding" 


    it "expands the path at time of setting" 


    it "can be deleted with parseable option" 

  end

  describe "env" do
    before(:each) { bundle :install }

    it "can set boolean properties via the environment" 


    it "can set negative boolean properties via the environment" 


    it "can set properties with periods via the environment" 

  end

  describe "parseable option" do
    it "prints an empty string" 


    it "only prints the value of the config" 


    it "can print global config" 


    it "prefers local config over global" 

  end

  describe "gem mirrors" do
    before(:each) { bundle :install }

    it "configures mirrors using keys with `mirror.`" 

  end

  describe "quoting" do
    before(:each) { gemfile "# no gems" }
    let(:long_string) do
      "--with-xml2-include=/usr/pkg/include/libxml2 --with-xml2-lib=/usr/pkg/lib " \
      "--with-xslt-dir=/usr/pkg"
    end

    it "saves quotes" 


    it "doesn't return quotes around values", :ruby => "1.9" 


    it "doesn't duplicate quotes around values", :if => (RUBY_VERSION >= "2.1") do
      bundled_app(".bundle").mkpath
      File.open(bundled_app(".bundle/config"), "w") do |f|
        f.write 'BUNDLE_FOO: "$BUILD_DIR"'
      end

      bundle "config bar baz"
      run "puts Bundler.settings.send(:local_config_file).read"

      # Starting in Ruby 2.1, YAML automatically adds double quotes
      # around some values, including $ and newlines.
      expect(out).to include('BUNDLE_FOO: "$BUILD_DIR"')
    end

    it "doesn't duplicate quotes around long wrapped values" 

  end

  describe "very long lines" do
    before(:each) { bundle :install }

    let(:long_string) do
      "--with-xml2-include=/usr/pkg/include/libxml2 --with-xml2-lib=/usr/pkg/lib " \
      "--with-xslt-dir=/usr/pkg"
    end

    let(:long_string_without_special_characters) do
      "here is quite a long string that will wrap to a second line but will not be " \
      "surrounded by quotes"
    end

    it "doesn't wrap values" 


    it "can read wrapped unquoted values" 

  end

  describe "subcommands" do
    it "list" 


    it "get" 


    it "set" 


    it "unset" 

  end
end

RSpec.describe "setting gemfile via config" do
  context "when only the non-default Gemfile exists" do
    it "persists the gemfile location to .bundle/config" 

  end
end

