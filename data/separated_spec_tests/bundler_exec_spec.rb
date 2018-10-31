# frozen_string_literal: true

RSpec.describe "bundle exec" do
  let(:system_gems_to_install) { %w[rack-1.0.0 rack-0.9.1] }
  before :each do
    system_gems(system_gems_to_install, :path => :bundle_path)
  end

  it "activates the correct gem" 


  it "works when the bins are in ~/.bundle" 


  it "works when running from a random directory" 


  it "works when exec'ing something else" 


  it "works when exec'ing to ruby" 


  it "accepts --verbose" 


  it "passes --verbose to command if it is given after the command" 


  it "handles --keep-file-descriptors" 


  it "accepts --keep-file-descriptors" 


  it "can run a command named --verbose" 


  it "handles different versions in different bundles" 


  it "handles gems installed with --without" 


  it "does not duplicate already exec'ed RUBYOPT" 


  it "does not duplicate already exec'ed RUBYLIB" 


  it "errors nicely when the argument doesn't exist" 


  it "errors nicely when the argument is not executable" 


  it "errors nicely when no arguments are passed" 


  it "raises a helpful error when exec'ing to something outside of the bundle", :rubygems => ">= 2.5.2" 


  # Different error message on old RG versions (before activate_bin_path) because they
  # called `Kernel#gem` directly
  it "raises a helpful error when exec'ing to something outside of the bundle", :rubygems => "< 2.5.2" 


  describe "with help flags" do
    each_prefix = proc do |string, &blk|
      1.upto(string.length) {|l| blk.call(string[0, l]) }
    end
    each_prefix.call("exec") do |exec|
      describe "when #{exec} is used" do
        before(:each) do
          install_gemfile <<-G
            gem "rack"
          G

          create_file("print_args", <<-'RUBY')
            #!/usr/bin/env ruby
            puts "args: #{ARGV.inspect}"
          RUBY
          bundled_app("print_args").chmod(0o755)
        end

        it "shows executable's man page when --help is after the executable" 


        it "shows executable's man page when --help is after the executable and an argument" 


        it "shows executable's man page when the executable has a -" 


        it "shows executable's man page when --help is after another flag" 


        it "uses executable's original behavior for -h" 


        it "shows bundle-exec's man page when --help is between exec and the executable" 


        it "shows bundle-exec's man page when --help is before exec" 


        it "shows bundle-exec's man page when -h is before exec" 


        it "shows bundle-exec's man page when --help is after exec" 


        it "shows bundle-exec's man page when -h is after exec" 

      end
    end
  end

  describe "with gem executables" do
    describe "run from a random directory" do
      before(:each) do
        install_gemfile <<-G
          gem "rack"
        G
      end

      it "works when unlocked" 


      it "works when locked" 

    end

    describe "from gems bundled via :path" do
      before(:each) do
        build_lib "fizz", :path => home("fizz") do |s|
          s.executables = "fizz"
        end

        install_gemfile <<-G
          gem "fizz", :path => "#{File.expand_path(home("fizz"))}"
        G
      end

      it "works when unlocked" 


      it "works when locked" 

    end

    describe "from gems bundled via :git" do
      before(:each) do
        build_git "fizz_git" do |s|
          s.executables = "fizz_git"
        end

        install_gemfile <<-G
          gem "fizz_git", :git => "#{lib_path("fizz_git-1.0")}"
        G
      end

      it "works when unlocked" 


      it "works when locked" 

    end

    describe "from gems bundled via :git with no gemspec" do
      before(:each) do
        build_git "fizz_no_gemspec", :gemspec => false do |s|
          s.executables = "fizz_no_gemspec"
        end

        install_gemfile <<-G
          gem "fizz_no_gemspec", "1.0", :git => "#{lib_path("fizz_no_gemspec-1.0")}"
        G
      end

      it "works when unlocked" 


      it "works when locked" 

    end
  end

  it "performs an automatic bundle install" 


  describe "with gems bundled via :path with invalid gemspecs" do
    it "outputs the gemspec validation errors", :rubygems => ">= 1.7.2" 

  end

  describe "with gems bundled for deployment" do
    it "works when calling bundler from another script" 

  end

  context "`load`ing a ruby file instead of `exec`ing" do
    let(:path) { bundled_app("ruby_executable") }
    let(:shebang) { "#!/usr/bin/env ruby" }
    let(:executable) { <<-RUBY.gsub(/^ */, "").strip }
      #{shebang}

      require "rack"
      puts "EXEC: \#{caller.grep(/load/).empty? ? 'exec' : 'load'}"
      puts "ARGS: \#{$0} \#{ARGV.join(' ')}"
      puts "RACK: \#{RACK}"
      process_title = `ps -o args -p \#{Process.pid}`.split("\n", 2).last.strip
      puts "PROCESS: \#{process_title}"
    RUBY

    before do
      path.open("w") {|f| f << executable }
      path.chmod(0o755)

      install_gemfile <<-G
        gem "rack"
      G
    end

    let(:exec) { "EXEC: load" }
    let(:args) { "ARGS: #{path} arg1 arg2" }
    let(:rack) { "RACK: 1.0.0" }
    let(:process) do
      title = "PROCESS: #{path}"
      title += " arg1 arg2" if RUBY_VERSION >= "2.1"
      title
    end
    let(:exit_code) { 0 }
    let(:expected) { [exec, args, rack, process].join("\n") }
    let(:expected_err) { "" }

    subject { bundle "exec #{path} arg1 arg2", :env => { :RUBYOPT => "-r#{spec_dir.join("support/hax")}" } }

    shared_examples_for "it runs" do
      it "like a normally executed executable" 

    end

    it_behaves_like "it runs"

    context "the executable exits explicitly" do
      let(:executable) { super() << "\nexit #{exit_code}\nputs 'POST_EXIT'\n" }

      context "with exit 0" do
        it_behaves_like "it runs"
      end

      context "with exit 99" do
        let(:exit_code) { 99 }
        it_behaves_like "it runs"
      end
    end

    context "the executable exits by SignalException" do
      let(:executable) do
        ex = super()
        ex << "\n"
        if LessThanProc.with(RUBY_VERSION).call("1.9")
          # Ruby < 1.9 needs a flush for a exit by signal, later
          # rubies do not
          ex << "STDOUT.flush\n"
        end
        ex << "raise SignalException, 'SIGTERM'\n"
        ex
      end
      let(:expected_err) { ENV["TRAVIS"] ? "Terminated" : "" }
      let(:exit_code) do
        # signal mask 128 + plus signal 15 -> TERM
        # this is specified by C99
        128 + 15
      end
      it_behaves_like "it runs"
    end

    context "the executable is empty", :bundler => "< 2" do
      let(:executable) { "" }

      let(:exit_code) { 0 }
      let(:expected) { "#{path} is empty" }
      let(:expected_err) { "" }
      if LessThanProc.with(RUBY_VERSION).call("1.9")
        # Kernel#exec in ruby < 1.9 will raise Errno::ENOEXEC if the command content is empty,
        # even if the command is set as an executable.
        pending "Kernel#exec is different"
      else
        it_behaves_like "it runs"
      end
    end

    context "the executable is empty", :bundler => "2" do
      let(:executable) { "" }

      let(:exit_code) { 0 }
      let(:expected_err) { "#{path} is empty" }
      let(:expected) { "" }
      it_behaves_like "it runs"
    end

    context "the executable raises", :bundler => "< 2" do
      let(:executable) { super() << "\nraise 'ERROR'" }
      let(:exit_code) { 1 }
      let(:expected) { super() << "\nbundler: failed to load command: #{path} (#{path})" }
      let(:expected_err) do
        "RuntimeError: ERROR\n  #{path}:10" +
          (Bundler.current_ruby.ruby_18? ? "" : ":in `<top (required)>'")
      end
      it_behaves_like "it runs"
    end

    context "the executable raises", :bundler => "2" do
      let(:executable) { super() << "\nraise 'ERROR'" }
      let(:exit_code) { 1 }
      let(:expected_err) do
        "bundler: failed to load command: #{path} (#{path})" \
        "\nRuntimeError: ERROR\n  #{path}:10:in `<top (required)>'"
      end
      it_behaves_like "it runs"
    end

    context "the executable raises an error without a backtrace", :bundler => "< 2" do
      let(:executable) { super() << "\nclass Err < Exception\ndef backtrace; end;\nend\nraise Err" }
      let(:exit_code) { 1 }
      let(:expected) { super() << "\nbundler: failed to load command: #{path} (#{path})" }
      let(:expected_err) { "Err: Err" }

      it_behaves_like "it runs"
    end

    context "the executable raises an error without a backtrace", :bundler => "2" do
      let(:executable) { super() << "\nclass Err < Exception\ndef backtrace; end;\nend\nraise Err" }
      let(:exit_code) { 1 }
      let(:expected_err) { "bundler: failed to load command: #{path} (#{path})\nErr: Err" }
      let(:expected) { super() }

      it_behaves_like "it runs"
    end

    context "when the file uses the current ruby shebang" do
      let(:shebang) { "#!#{Gem.ruby}" }
      it_behaves_like "it runs"
    end

    context "when Bundler.setup fails", :bundler => "< 2" do
      before do
        gemfile <<-G
          gem 'rack', '2'
        G
        ENV["BUNDLER_FORCE_TTY"] = "true"
      end

      let(:exit_code) { Bundler::GemNotFound.new.status_code }
      let(:expected) { <<-EOS.strip }
\e[31mCould not find gem 'rack (= 2)' in any of the gem sources listed in your Gemfile.\e[0m
\e[33mRun `bundle install` to install missing gems.\e[0m
      EOS

      it_behaves_like "it runs"
    end

    context "when Bundler.setup fails", :bundler => "2" do
      before do
        gemfile <<-G
          gem 'rack', '2'
        G
        ENV["BUNDLER_FORCE_TTY"] = "true"
      end

      let(:exit_code) { Bundler::GemNotFound.new.status_code }
      let(:expected) { <<-EOS.strip }
\e[31mCould not find gem 'rack (= 2)' in locally installed gems.
The source contains 'rack' at: 1.0.0\e[0m
\e[33mRun `bundle install` to install missing gems.\e[0m
      EOS

      it_behaves_like "it runs"
    end

    context "when the executable exits non-zero via at_exit" do
      let(:executable) { super() + "\n\nat_exit { $! ? raise($!) : exit(1) }" }
      let(:exit_code) { 1 }

      it_behaves_like "it runs"
    end

    context "when disable_exec_load is set" do
      let(:exec) { "EXEC: exec" }
      let(:process) { "PROCESS: ruby #{path} arg1 arg2" }

      before do
        bundle "config disable_exec_load true"
      end

      it_behaves_like "it runs"
    end

    context "regarding $0 and __FILE__" do
      let(:executable) { super() + <<-'RUBY' }

        puts "$0: #{$0.inspect}"
        puts "__FILE__: #{__FILE__.inspect}"
      RUBY

      let(:expected) { super() + <<-EOS.chomp }

$0: #{path.to_s.inspect}
__FILE__: #{path.to_s.inspect}
      EOS

      it_behaves_like "it runs"

      context "when the path is relative" do
        let(:path) { super().relative_path_from(bundled_app) }

        if LessThanProc.with(RUBY_VERSION).call("1.9")
          pending "relative paths have ./ __FILE__"
        else
          it_behaves_like "it runs"
        end
      end

      context "when the path is relative with a leading ./" do
        let(:path) { Pathname.new("./#{super().relative_path_from(Pathname.pwd)}") }

        if LessThanProc.with(RUBY_VERSION).call("< 1.9")
          pending "relative paths with ./ have absolute __FILE__"
        else
          it_behaves_like "it runs"
        end
      end
    end

    context "signal handling" do
      let(:test_signals) do
        open3_reserved_signals = %w[CHLD CLD PIPE]
        reserved_signals = %w[SEGV BUS ILL FPE VTALRM KILL STOP EXIT]
        bundler_signals = %w[INT]

        Signal.list.keys - (bundler_signals + reserved_signals + open3_reserved_signals)
      end

      context "signals being trapped by bundler" do
        let(:executable) { strip_whitespace <<-RUBY }
          #{shebang}
          begin
            Thread.new do
              puts 'Started' # For process sync
              STDOUT.flush
              sleep 1 # ignore quality_spec
              raise "Didn't receive INT at all"
            end.join
          rescue Interrupt
            puts "foo"
          end
        RUBY

        it "receives the signal", :ruby => ">= 1.9.3" 

      end

      context "signals not being trapped by bunder" do
        let(:executable) { strip_whitespace <<-RUBY }
          #{shebang}

          signals = #{test_signals.inspect}
          result = signals.map do |sig|
            Signal.trap(sig, "IGNORE")
          end
          puts result.select { |ret| ret == "IGNORE" }.count
        RUBY

        it "makes sure no unexpected signals are restored to DEFAULT" 

      end
    end
  end

  context "nested bundle exec" do
    let(:system_gems_to_install) { super() << :bundler }

    context "with shared gems disabled" do
      before do
        gemfile <<-G
          source "file://#{gem_repo1}"
          gem "rack"
        G
        bundle :install, :system_bundler => true, :path => "vendor/bundler"
      end

      it "overrides disable_shared_gems so bundler can be found" 

    end

    context "with a system gem that shadows a default gem" do
      let(:openssl_version) { "99.9.9" }
      let(:expected) { ruby "gem 'openssl', '< 999999'; require 'openssl'; puts OpenSSL::VERSION", :artifice => nil }

      it "only leaves the default gem in the stdlib available" 

    end
  end
end

