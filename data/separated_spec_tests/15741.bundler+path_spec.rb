# frozen_string_literal: true

RSpec.describe "bundle install with explicit source paths" do
  it "fetches gems with a global path source", :bundler => "< 2" 


  it "fetches gems" 


  it "supports pinned paths" 


  it "supports relative paths" 


  it "expands paths" 


  it "expands paths raise error with not existing user's home dir" 


  it "expands paths relative to Bundler.root" 


  it "expands paths when comparing locked paths to Gemfile paths" 


  it "installs dependencies from the path even if a newer gem is available elsewhere" 


  it "works" 


  it "prefers gemspecs closer to the path root" 


  it "warns on invalid specs", :rubygems => "1.7" 


  it "supports gemspec syntax" 


  it "supports gemspec syntax with an alternative path" 


  it "doesn't automatically unlock dependencies when using the gemspec syntax" 


  it "doesn't automatically unlock dependencies when using the gemspec syntax and the gem has development dependencies" 


  it "raises if there are multiple gemspecs" 


  it "allows :name to be specified to resolve ambiguity" 


  it "sets up executables" 


  it "handles directories in bin/" 


  it "removes the .gem file after installing" 


  describe "block syntax" do
    it "pulls all gems from a path block" 

  end

  it "keeps source pinning" 


  it "works when the path does not have a gemspec" 


  it "works when the path does not have a gemspec but there is a lockfile" 


  context "existing lockfile" do
    it "rubygems gems don't re-resolve without changes" 


    it "source path gems w/deps don't re-resolve without changes" 

  end

  it "installs executable stubs" 


  describe "when the gem version in the path is updated" do
    before :each do
      build_lib "foo", "1.0", :path => lib_path("foo") do |s|
        s.add_dependency "bar"
      end
      build_lib "bar", "1.0", :path => lib_path("foo/bar")

      install_gemfile <<-G
        gem "foo", :path => "#{lib_path("foo")}"
      G
    end

    it "unlocks all gems when the top level gem is updated" 


    it "unlocks all gems when a child dependency gem is updated" 

  end

  describe "when dependencies in the path are updated" do
    before :each do
      build_lib "foo", "1.0", :path => lib_path("foo")

      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "foo", :path => "#{lib_path("foo")}"
      G
    end

    it "gets dependencies that are updated in the path" 

  end

  describe "switching sources" do
    it "doesn't switch pinned git sources to rubygems when pinning the parent gem to a path source" 


    it "switches the source when the gem existed in rubygems and the path was already being used for another gem" 

  end

  describe "when there are both a gemspec and remote gems" do
    it "doesn't query rubygems for local gemspec name" 

  end

  describe "gem install hooks" do
    it "runs pre-install hooks" 


    it "runs post-install hooks" 


    it "complains if the install hook fails" 


    it "loads plugins from the path gem" 

  end
end

