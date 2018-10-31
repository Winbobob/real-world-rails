# frozen_string_literal: true

RSpec.describe "gemcutter's dependency API" do
  let(:source_hostname) { "localgemserver.test" }
  let(:source_uri) { "http://#{source_hostname}" }

  it "should use the API" 


  it "should URI encode gem names" 


  it "should handle nested dependencies" 


  it "should handle multiple gem dependencies on the same gem" 


  it "should use the endpoint when using --deployment" 


  it "handles git dependencies that are in rubygems" 


  it "handles git dependencies that are in rubygems using --deployment" 


  it "doesn't fail if you only have a git gem with no deps when using --deployment" 


  it "falls back when the API errors out" 


  it "falls back when hitting the Gemcutter Dependency Limit" 


  it "falls back when Gemcutter API doesn't return proper Marshal format" 


  it "falls back when the API URL returns 403 Forbidden" 


  it "handles host redirects" 


  it "handles host redirects without Net::HTTP::Persistent" 


  it "timeouts when Bundler::Fetcher redirects too much" 


  context "when --full-index is specified" do
    it "should use the modern index for install" 


    it "should use the modern index for update" 

  end

  it "fetches again when more dependencies are found in subsequent sources", :bundler => "< 2" 


  it "fetches again when more dependencies are found in subsequent sources using blocks" 


  it "fetches gem versions even when those gems are already installed" 


  it "considers all possible versions of dependencies from all api gem sources", :bundler => "< 2" 


  it "considers all possible versions of dependencies from all api gem sources using blocks" 


  it "prints API output properly with back deps" 


  it "does not fetch every spec if the index of gems is large when doing back deps", :bundler => "< 2" 


  it "does not fetch every spec if the index of gems is large when doing back deps using blocks" 


  it "uses the endpoint if all sources support it" 


  it "fetches again when more dependencies are found in subsequent sources using --deployment", :bundler => "< 2" 


  it "fetches again when more dependencies are found in subsequent sources using --deployment with blocks" 


  it "does not refetch if the only unmet dependency is bundler" 


  it "should install when EndpointSpecification has a bin dir owned by root", :sudo => true do
    sudo "mkdir -p #{system_gem_path("bin")}"
    sudo "chown -R root #{system_gem_path("bin")}"

    gemfile <<-G
      source "#{source_uri}"
      gem "rails"
    G
    bundle :install, :artifice => "endpoint"
    expect(the_bundle).to include_gems "rails 2.3.2"
  end

  it "installs the binstubs", :bundler => "< 2" 


  it "installs the bins when using --path and uses autoclean", :bundler => "< 2" 


  it "installs the bins when using --path and uses bundle clean", :bundler => "< 2" 


  it "prints post_install_messages" 


  it "should display the post install message for a dependency" 


  context "when using basic authentication" do
    let(:user)     { "user" }
    let(:password) { "pass" }
    let(:basic_auth_source_uri) do
      uri          = URI.parse(source_uri)
      uri.user     = user
      uri.password = password

      uri
    end

    it "passes basic authentication details and strips out creds" 


    it "strips http basic authentication creds for modern index" 


    it "strips http basic auth creds when it can't reach the server" 


    it "strips http basic auth creds when warning about ambiguous sources", :bundler => "< 2" 


    it "does not pass the user / password to different hosts on redirect" 


    describe "with authentication details in bundle config" do
      before do
        gemfile <<-G
          source "#{source_uri}"
          gem "rack"
        G
      end

      it "reads authentication details by host name from bundle config" 


      it "reads authentication details by full url from bundle config" 


      it "should use the API" 


      it "prefers auth supplied in the source uri" 


      it "shows instructions if auth is not provided for the source" 


      it "fails if authentication has already been provided, but failed" 

    end

    describe "with no password" do
      let(:password) { nil }

      it "passes basic authentication details" 

    end
  end

  context "when ruby is compiled without openssl" do
    before do
      # Install a monkeypatch that reproduces the effects of openssl being
      # missing when the fetcher runs, as happens in real life. The reason
      # we can't just overwrite openssl.rb is that Artifice uses it.
      bundled_app("broken_ssl").mkpath
      bundled_app("broken_ssl/openssl.rb").open("w") do |f|
        f.write <<-RUBY
          raise LoadError, "cannot load such file -- openssl"
        RUBY
      end
    end

    it "explains what to do to get it" 

  end

  context "when SSL certificate verification fails" do
    it "explains what happened" 

  end

  context ".gemrc with sources is present" do
    before do
      File.open(home(".gemrc"), "w") do |file|
        file.puts({ :sources => ["https://rubygems.org"] }.to_yaml)
      end
    end

    after do
      home(".gemrc").rmtree
    end

    it "uses other sources declared in the Gemfile" 

  end
end

