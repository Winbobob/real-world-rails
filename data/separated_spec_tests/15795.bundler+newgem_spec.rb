# frozen_string_literal: true

RSpec.describe "bundle gem" do
  def reset!
    super
    global_config "BUNDLE_GEM__MIT" => "false", "BUNDLE_GEM__TEST" => "false", "BUNDLE_GEM__COC" => "false"
  end

  def execute_bundle_gem(gem_name, flag = "")
    bundle! "gem #{gem_name} #{flag}"
    # reset gemspec cache for each test because of commit 3d4163a
    Bundler.clear_gemspec_cache
  end

  def gem_skeleton_assertions(gem_name)
    expect(bundled_app("#{gem_name}/#{gem_name}.gemspec")).to exist
    expect(bundled_app("#{gem_name}/README.md")).to exist
    expect(bundled_app("#{gem_name}/Gemfile")).to exist
    expect(bundled_app("#{gem_name}/Rakefile")).to exist
    expect(bundled_app("#{gem_name}/lib/test/gem.rb")).to exist
    expect(bundled_app("#{gem_name}/lib/test/gem/version.rb")).to exist
  end

  before do
    git_config_content = <<-EOF
    [user]
      name = "Bundler User"
      email = user@example.com
    [github]
      user = bundleuser
    EOF
    @git_config_location = ENV["GIT_CONFIG"]
    path = "#{File.expand_path(tmp, File.dirname(__FILE__))}/test_git_config.txt"
    File.open(path, "w") {|f| f.write(git_config_content) }
    ENV["GIT_CONFIG"] = path
  end

  after do
    FileUtils.rm(ENV["GIT_CONFIG"]) if File.exist?(ENV["GIT_CONFIG"])
    ENV["GIT_CONFIG"] = @git_config_location
  end

  shared_examples_for "git config is present" do
    context "git config user.{name,email} present" do
      it "sets gemspec author to git user.name if available" 


      it "sets gemspec email to git user.email if available" 

    end
  end

  shared_examples_for "git config is absent" do
    it "sets gemspec author to default message if git user.name is not set or empty" 


    it "sets gemspec email to default message if git user.email is not set or empty" 

  end

  shared_examples_for "--mit flag" do
    before do
      execute_bundle_gem(gem_name, "--mit")
    end
    it "generates a gem skeleton with MIT license" 

  end

  shared_examples_for "--no-mit flag" do
    before do
      execute_bundle_gem(gem_name, "--no-mit")
    end
    it "generates a gem skeleton without MIT license" 

  end

  shared_examples_for "--coc flag" do
    before do
      execute_bundle_gem(gem_name, "--coc")
    end
    it "generates a gem skeleton with MIT license" 


    describe "README additions" do
      it "generates the README with a section for the Code of Conduct" 

    end
  end

  shared_examples_for "--no-coc flag" do
    before do
      execute_bundle_gem(gem_name, "--no-coc")
    end
    it "generates a gem skeleton without Code of Conduct" 


    describe "README additions" do
      it "generates the README without a section for the Code of Conduct" 

    end
  end

  context "README.md" do
    let(:gem_name) { "test_gem" }
    let(:generated_gem) { Bundler::GemHelper.new(bundled_app(gem_name).to_s) }

    context "git config github.user present" do
      before do
        execute_bundle_gem(gem_name)
      end

      it "contribute URL set to git username" 

    end

    context "git config github.user is absent" do
      before do
        sys_exec("git config --unset github.user")
        reset!
        in_app_root
        bundle "gem #{gem_name}"
      end

      it "contribute URL set to [USERNAME]" 

    end
  end

  it "creates a new git repository" 


  context "when git is not available" do
    let(:gem_name) { "test_gem" }

    # This spec cannot have `git` available in the test env
    before do
      load_paths = [lib, spec]
      load_path_str = "-I#{load_paths.join(File::PATH_SEPARATOR)}"

      sys_exec "PATH=\"\" #{Gem.ruby} #{load_path_str} #{bindir.join("bundle")} gem #{gem_name}"
    end

    it "creates the gem without the need for git" 


    it "doesn't create a git repo" 


    it "doesn't create a .gitignore file" 

  end

  it "generates a valid gemspec" 


  context "gem naming with relative paths" do
    before do
      reset!
      in_app_root
    end

    it "resolves ." 


    it "resolves .." 


    it "resolves relative directory" 


    def create_temporary_dir(dir)
      FileUtils.mkdir_p(dir)
      Dir.chdir(dir)
    end
  end

  context "gem naming with underscore" do
    let(:gem_name) { "test_gem" }

    before do
      execute_bundle_gem(gem_name)
    end

    let(:generated_gem) { Bundler::GemHelper.new(bundled_app(gem_name).to_s) }

    it "generates a gem skeleton" 


    it "starts with version 0.1.0" 


    it "does not nest constants" 


    it_should_behave_like "git config is present"

    context "git config user.{name,email} is not set" do
      before do
        `git config --unset user.name`
        `git config --unset user.email`
        reset!
        in_app_root
        bundle "gem #{gem_name}"
      end

      it_should_behave_like "git config is absent"
    end

    it "sets gemspec metadata['allowed_push_host']", :rubygems => "2.0" 


    it "requires the version file" 


    it "creates a base error class" 


    it "runs rake without problems" 


    context "--exe parameter set" do
      before do
        reset!
        in_app_root
        bundle "gem #{gem_name} --exe"
      end

      it "builds exe skeleton" 


      it "requires 'test-gem'" 

    end

    context "--bin parameter set" do
      before do
        reset!
        in_app_root
        bundle "gem #{gem_name} --bin"
      end

      it "builds exe skeleton" 


      it "requires 'test-gem'" 

    end

    context "no --test parameter" do
      before do
        reset!
        in_app_root
        bundle "gem #{gem_name}"
      end

      it "doesn't create any spec/test file" 

    end

    context "--test parameter set to rspec" do
      before do
        reset!
        in_app_root
        bundle "gem #{gem_name} --test=rspec"
      end

      it "builds spec skeleton" 


      it "depends on a specific version of rspec", :rubygems => ">= 1.8.1" 


      it "requires 'test-gem'" 


      it "creates a default test which fails" 

    end

    context "gem.test setting set to rspec" do
      before do
        reset!
        in_app_root
        bundle "config gem.test rspec"
        bundle "gem #{gem_name}"
      end

      it "builds spec skeleton" 

    end

    context "gem.test setting set to rspec and --test is set to minitest" do
      before do
        reset!
        in_app_root
        bundle "config gem.test rspec"
        bundle "gem #{gem_name} --test=minitest"
      end

      it "builds spec skeleton" 

    end

    context "--test parameter set to minitest" do
      before do
        reset!
        in_app_root
        bundle "gem #{gem_name} --test=minitest"
      end

      it "depends on a specific version of minitest", :rubygems => ">= 1.8.1" 


      it "builds spec skeleton" 


      it "requires 'test-gem'" 


      it "requires 'minitest_helper'" 


      it "creates a default test which fails" 

    end

    context "gem.test setting set to minitest" do
      before do
        reset!
        in_app_root
        bundle "config gem.test minitest"
        bundle "gem #{gem_name}"
      end

      it "creates a default rake task to run the test suite" 

    end

    context "--test with no arguments" do
      before do
        reset!
        in_app_root
        bundle "gem #{gem_name} --test"
      end

      it "defaults to rspec" 


      it "creates a .travis.yml file to test the library against the current Ruby version on Travis CI" 

    end

    context "--edit option" do
      it "opens the generated gemspec in the user's text editor" 

    end
  end

  context "testing --mit and --coc options against bundle config settings" do
    let(:gem_name) { "test-gem" }

    context "with mit option in bundle config settings set to true" do
      before do
        global_config "BUNDLE_GEM__MIT" => "true", "BUNDLE_GEM__TEST" => "false", "BUNDLE_GEM__COC" => "false"
      end
      after { reset! }
      it_behaves_like "--mit flag"
      it_behaves_like "--no-mit flag"
    end

    context "with mit option in bundle config settings set to false" do
      it_behaves_like "--mit flag"
      it_behaves_like "--no-mit flag"
    end

    context "with coc option in bundle config settings set to true" do
      before do
        global_config "BUNDLE_GEM__MIT" => "false", "BUNDLE_GEM__TEST" => "false", "BUNDLE_GEM__COC" => "true"
      end
      after { reset! }
      it_behaves_like "--coc flag"
      it_behaves_like "--no-coc flag"
    end

    context "with coc option in bundle config settings set to false" do
      it_behaves_like "--coc flag"
      it_behaves_like "--no-coc flag"
    end
  end

  context "gem naming with dashed" do
    let(:gem_name) { "test-gem" }

    before do
      execute_bundle_gem(gem_name)
    end

    let(:generated_gem) { Bundler::GemHelper.new(bundled_app(gem_name).to_s) }

    it "generates a gem skeleton" 


    it "starts with version 0.1.0" 


    it "nests constants so they work" 


    it_should_behave_like "git config is present"

    context "git config user.{name,email} is not set" do
      before do
        `git config --unset user.name`
        `git config --unset user.email`
        reset!
        in_app_root
        bundle "gem #{gem_name}"
      end

      it_should_behave_like "git config is absent"
    end

    it "requires the version file" 


    it "runs rake without problems" 


    context "--bin parameter set" do
      before do
        reset!
        in_app_root
        bundle "gem #{gem_name} --bin"
      end

      it "builds bin skeleton" 


      it "requires 'test/gem'" 

    end

    context "no --test parameter" do
      before do
        reset!
        in_app_root
        bundle "gem #{gem_name}"
      end

      it "doesn't create any spec/test file" 

    end

    context "--test parameter set to rspec" do
      before do
        reset!
        in_app_root
        bundle "gem #{gem_name} --test=rspec"
      end

      it "builds spec skeleton" 


      it "requires 'test/gem'" 


      it "creates a default test which fails" 


      it "creates a default rake task to run the specs" 

    end

    context "--test parameter set to minitest" do
      before do
        reset!
        in_app_root
        bundle "gem #{gem_name} --test=minitest"
      end

      it "builds spec skeleton" 


      it "requires 'test/gem'" 


      it "requires 'test_helper'" 


      it "creates a default test which fails" 


      it "creates a default rake task to run the test suite" 

    end

    context "--test with no arguments" do
      before do
        reset!
        in_app_root
        bundle "gem #{gem_name} --test"
      end

      it "defaults to rspec" 

    end

    context "--ext parameter set" do
      before do
        reset!
        in_app_root
        bundle "gem test_gem --ext"
      end

      it "builds ext skeleton" 


      it "includes rake-compiler" 


      it "depends on compile task for build" 

    end
  end

  describe "uncommon gem names" do
    it "can deal with two dashes" 


    it "fails gracefully with a ." 


    it "fails gracefully with a ^" 


    it "fails gracefully with a space" 


    it "fails gracefully when multiple names are passed" 

  end

  describe "#ensure_safe_gem_name" do
    before do
      bundle "gem #{subject}"
    end
    after do
      Bundler.clear_gemspec_cache
    end

    context "with an existing const name" do
      subject { "gem" }
      it { expect(out).to include("Invalid gem name #{subject}") }
    end

    context "with an existing hyphenated const name" do
      subject { "gem-specification" }
      it { expect(out).to include("Invalid gem name #{subject}") }
    end

    context "starting with an existing const name" do
      subject { "gem-somenewconstantname" }
      it { expect(out).not_to include("Invalid gem name #{subject}") }
    end

    context "ending with an existing const name" do
      subject { "somenewconstantname-gem" }
      it { expect(out).not_to include("Invalid gem name #{subject}") }
    end
  end

  context "on first run" do
    before do
      in_app_root
    end

    it "asks about test framework" 


    it "asks about MIT license" 


    it "asks about CoC" 

  end

  context "on conflicts with a previously created file" do
    it "should fail gracefully" 

  end

  context "on conflicts with a previously created directory" do
    it "should succeed" 

  end
end

