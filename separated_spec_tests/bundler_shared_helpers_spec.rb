# frozen_string_literal: true

RSpec.describe Bundler::SharedHelpers do
  let(:ext_lock_double) { double(:ext_lock) }

  before do
    allow(Bundler.rubygems).to receive(:ext_lock).and_return(ext_lock_double)
    allow(ext_lock_double).to receive(:synchronize) {|&block| block.call }
  end

  subject { Bundler::SharedHelpers }

  describe "#default_gemfile" do
    before { ENV["BUNDLE_GEMFILE"] = "/path/Gemfile" }

    context "Gemfile is present" do
      let(:expected_gemfile_path) { Pathname.new("/path/Gemfile") }

      it "returns the Gemfile path" 

    end

    context "Gemfile is not present" do
      before { ENV["BUNDLE_GEMFILE"] = nil }

      it "raises a GemfileNotFound error" 

    end

    context "Gemfile is not an absolute path" do
      before { ENV["BUNDLE_GEMFILE"] = "Gemfile" }

      let(:expected_gemfile_path) { Pathname.new("Gemfile").expand_path }

      it "returns the Gemfile path" 

    end
  end

  describe "#default_lockfile" do
    context "gemfile is gems.rb" do
      let(:gemfile_path)           { Pathname.new("/path/gems.rb") }
      let(:expected_lockfile_path) { Pathname.new("/path/gems.locked") }

      before { allow(subject).to receive(:default_gemfile).and_return(gemfile_path) }

      it "returns the gems.locked path" 

    end

    context "is a regular Gemfile" do
      let(:gemfile_path)           { Pathname.new("/path/Gemfile") }
      let(:expected_lockfile_path) { Pathname.new("/path/Gemfile.lock") }

      before { allow(subject).to receive(:default_gemfile).and_return(gemfile_path) }

      it "returns the lock file path" 

    end
  end

  describe "#default_bundle_dir" do
    context ".bundle does not exist" do
      it "returns nil" 

    end

    context ".bundle is global .bundle" do
      let(:global_rubygems_dir) { Pathname.new("#{bundled_app}") }

      before do
        Dir.mkdir ".bundle"
        allow(Bundler.rubygems).to receive(:user_home).and_return(global_rubygems_dir)
      end

      it "returns nil" 

    end

    context ".bundle is not global .bundle" do
      let(:global_rubygems_dir)      { Pathname.new("/path/rubygems") }
      let(:expected_bundle_dir_path) { Pathname.new("#{bundled_app}/.bundle") }

      before do
        Dir.mkdir ".bundle"
        allow(Bundler.rubygems).to receive(:user_home).and_return(global_rubygems_dir)
      end

      it "returns the .bundle path" 

    end
  end

  describe "#in_bundle?" do
    it "calls the find_gemfile method" 


    shared_examples_for "correctly determines whether to return a Gemfile path" do
      context "currently in directory with a Gemfile" do
        before { File.new("Gemfile", "w") }

        it "returns path of the bundle Gemfile" 

      end

      context "currently in directory without a Gemfile" do
        it "returns nil" 

      end
    end

    context "ENV['BUNDLE_GEMFILE'] set" do
      before { ENV["BUNDLE_GEMFILE"] = "/path/Gemfile" }

      it "returns ENV['BUNDLE_GEMFILE']" 

    end

    context "ENV['BUNDLE_GEMFILE'] not set" do
      before { ENV["BUNDLE_GEMFILE"] = nil }

      it_behaves_like "correctly determines whether to return a Gemfile path"
    end

    context "ENV['BUNDLE_GEMFILE'] is blank" do
      before { ENV["BUNDLE_GEMFILE"] = "" }

      it_behaves_like "correctly determines whether to return a Gemfile path"
    end
  end

  describe "#chdir" do
    let(:op_block) { proc { Dir.mkdir "nested_dir" } }

    before { Dir.mkdir "chdir_test_dir" }

    it "executes the passed block while in the specified directory" 

  end

  describe "#pwd" do
    it "returns the current absolute path" 

  end

  describe "#with_clean_git_env" do
    let(:with_clean_git_env_block) { proc { Dir.mkdir "with_clean_git_env_test_dir" } }

    before do
      ENV["GIT_DIR"] = "ORIGINAL_ENV_GIT_DIR"
      ENV["GIT_WORK_TREE"] = "ORIGINAL_ENV_GIT_WORK_TREE"
    end

    it "executes the passed block" 


    context "when a block is passed" do
      let(:with_clean_git_env_block) do
        proc do
          Dir.mkdir "git_dir_test_dir" unless ENV["GIT_DIR"].nil?
          Dir.mkdir "git_work_tree_test_dir" unless ENV["GIT_WORK_TREE"].nil?
        end end

      it "uses a fresh git env for execution" 

    end

    context "passed block does not throw errors" do
      let(:with_clean_git_env_block) do
        proc do
          ENV["GIT_DIR"] = "NEW_ENV_GIT_DIR"
          ENV["GIT_WORK_TREE"] = "NEW_ENV_GIT_WORK_TREE"
        end end

      it "restores the git env after" 

    end

    context "passed block throws errors" do
      let(:with_clean_git_env_block) do
        proc do
          ENV["GIT_DIR"] = "NEW_ENV_GIT_DIR"
          ENV["GIT_WORK_TREE"] = "NEW_ENV_GIT_WORK_TREE"
          raise RuntimeError.new
        end end

      it "restores the git env after" 

    end
  end

  describe "#set_bundle_environment" do
    before do
      ENV["BUNDLE_GEMFILE"] = "Gemfile"
    end

    shared_examples_for "ENV['PATH'] gets set correctly" do
      before { Dir.mkdir ".bundle" }

      it "ensures bundle bin path is in ENV['PATH']" 

    end

    shared_examples_for "ENV['RUBYOPT'] gets set correctly" do
      it "ensures -rbundler/setup is at the beginning of ENV['RUBYOPT']" 

    end

    shared_examples_for "ENV['RUBYLIB'] gets set correctly" do
      let(:ruby_lib_path) { "stubbed_ruby_lib_dir" }

      before do
        allow(Bundler::SharedHelpers).to receive(:bundler_ruby_lib).and_return(ruby_lib_path)
      end

      it "ensures bundler's ruby version lib path is in ENV['RUBYLIB']" 

    end

    it "calls the appropriate set methods" 


    it "exits if bundle path contains the unix-like path separator" 


    context "with a jruby path_separator regex", :ruby => "1.9" do
      # In versions of jruby that supported ruby 1.8, the path separator was the standard File::PATH_SEPARATOR
      let(:regex) { Regexp.new("(?<!jar:file|jar|file|classpath|uri:classloader|uri|http|https):") }
      it "does not exit if bundle path is the standard uri path" 


      it "exits if bundle path contains another directory" 

    end

    context "ENV['PATH'] does not exist" do
      before { ENV.delete("PATH") }

      it_behaves_like "ENV['PATH'] gets set correctly"
    end

    context "ENV['PATH'] is empty" do
      before { ENV["PATH"] = "" }

      it_behaves_like "ENV['PATH'] gets set correctly"
    end

    context "ENV['PATH'] exists" do
      before { ENV["PATH"] = "/some_path/bin" }

      it_behaves_like "ENV['PATH'] gets set correctly"
    end

    context "ENV['PATH'] already contains the bundle bin path" do
      let(:bundle_path) { "#{Bundler.bundle_path}/bin" }

      before do
        ENV["PATH"] = bundle_path
      end

      it_behaves_like "ENV['PATH'] gets set correctly"

      it "ENV['PATH'] should only contain one instance of bundle bin path" 

    end

    context "ENV['RUBYOPT'] does not exist" do
      before { ENV.delete("RUBYOPT") }

      it_behaves_like "ENV['RUBYOPT'] gets set correctly"
    end

    context "ENV['RUBYOPT'] exists without -rbundler/setup" do
      before { ENV["RUBYOPT"] = "-I/some_app_path/lib" }

      it_behaves_like "ENV['RUBYOPT'] gets set correctly"
    end

    context "ENV['RUBYOPT'] exists and contains -rbundler/setup" do
      before { ENV["RUBYOPT"] = "-rbundler/setup" }

      it_behaves_like "ENV['RUBYOPT'] gets set correctly"
    end

    context "ENV['RUBYLIB'] does not exist" do
      before { ENV.delete("RUBYLIB") }

      it_behaves_like "ENV['RUBYLIB'] gets set correctly"
    end

    context "ENV['RUBYLIB'] is empty" do
      before { ENV["PATH"] = "" }

      it_behaves_like "ENV['RUBYLIB'] gets set correctly"
    end

    context "ENV['RUBYLIB'] exists" do
      before { ENV["PATH"] = "/some_path/bin" }

      it_behaves_like "ENV['RUBYLIB'] gets set correctly"
    end

    context "ENV['RUBYLIB'] already contains the bundler's ruby version lib path" do
      let(:ruby_lib_path) { "stubbed_ruby_lib_dir" }

      before do
        ENV["RUBYLIB"] = ruby_lib_path
      end

      it_behaves_like "ENV['RUBYLIB'] gets set correctly"

      it "ENV['RUBYLIB'] should only contain one instance of bundler's ruby version lib path" 

    end
  end

  describe "#filesystem_access" do
    context "system has proper permission access" do
      let(:file_op_block) { proc {|path| FileUtils.mkdir_p(path) } }

      it "performs the operation in the passed block" 

    end

    context "system throws Errno::EACESS" do
      let(:file_op_block) { proc {|_path| raise Errno::EACCES } }

      it "raises a PermissionError" 

    end

    context "system throws Errno::EAGAIN" do
      let(:file_op_block) { proc {|_path| raise Errno::EAGAIN } }

      it "raises a TemporaryResourceError" 

    end

    context "system throws Errno::EPROTO" do
      let(:file_op_block) { proc {|_path| raise Errno::EPROTO } }

      it "raises a VirtualProtocolError" 

    end

    context "system throws Errno::ENOTSUP", :ruby => "1.9" do
      let(:file_op_block) { proc {|_path| raise Errno::ENOTSUP } }

      it "raises a OperationNotSupportedError" 

    end

    context "system throws Errno::ENOSPC" do
      let(:file_op_block) { proc {|_path| raise Errno::ENOSPC } }

      it "raises a NoSpaceOnDeviceError" 

    end

    context "system throws an unhandled SystemCallError" do
      let(:error) { SystemCallError.new("Shields down", 1337) }
      let(:file_op_block) { proc {|_path| raise error } }

      it "raises a GenericSystemCallError" 

    end
  end

  describe "#const_get_safely" do
    module TargetNamespace
      VALID_CONSTANT = 1
    end

    context "when the namespace does have the requested constant" do
      it "returns the value of the requested constant" 

    end

    context "when the requested constant is passed as a string" do
      it "returns the value of the requested constant" 

    end

    context "when the namespace does not have the requested constant" do
      it "returns nil" 

    end
  end
end

