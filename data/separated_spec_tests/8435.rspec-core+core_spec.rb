require 'rspec/support/spec/library_wide_checks'

RSpec.describe RSpec do
  fake_libs = File.expand_path('../../support/fake_libs', __FILE__)
  allowed_loaded_features = [
    /optparse\.rb/,   # Used by OptionParser.
    /rbconfig\.rb/,   # loaded by rspec-support for OS detection.
    /shellwords\.rb/, # used by ConfigurationOptions and RakeTask.
    /stringio/,       # Used by BaseFormatter.
    %r{/fake_libs/},  # ignore these, obviously
  ]

  # JRuby appears to not respect `--disable=gem` so rubygems also gets loaded.
  allowed_loaded_features << /rubygems/ if RSpec::Support::Ruby.jruby?

  disable_autorun_code =
    if RSpec::Support::OS.windows?
      # On Windows, the "redefine autorun" approach results in a different
      # exit status for a reason I don't understand, so we just disable
      # autorun outright.
      'RSpec::Core::Runner.disable_autorun!'
    else
      # On JRuby, the `disable_autorun!` approach leads to a stderr warning
      # related to a deprecation emited when `rspec/core/autorun` gets loaded,
      # because of `caller_filter` issues, so we redefine the autorun method
      # instead. That works fine on all Rubies when we're not on Windows as
      # well.
      'RSpec::Core::Runner.instance_exec { undef :autorun; def autorun; end }'
    end

  it_behaves_like 'library wide checks', 'rspec-core',
    :preamble_for_lib => [
      # rspec-core loads a number of external libraries. We don't want them loaded
      # as part of loading all of rspec-core for these specs, for a few reasons:
      #
      #   * Some external libraries issue warnings, which we can't do anything about.
      #     Since we are trying to prevent _any_ warnings from loading RSpec, it's
      #     easiest to avoid loading those libraries entirely.
      #   * Some external libraries load many stdlibs. Here we allow a known set of
      #     directly loaded stdlibs, and we're not directly concerned with transitive
      #     dependencies.
      #   * We're really only concerned with these issues w.r.t. rspec-mocks and
      #     rspec-expectations from within their spec suites. Here we care only about
      #     rspec-core, so avoiding loading them helps keep the spec suites independent.
      #   * These are some of the slowest specs we have, and cutting out the loading
      #     of external libraries cuts down on how long these specs take.
      #
      # To facilitate the avoidance of loading certain libraries, we have a bunch
      # of files in `support/fake_libs` that substitute for the real things when
      # we put that directory on the load path. Here's the list:
      #
      #   * coderay -- loaded by the HTML formatter if availble for syntax highlighting.
      #   * drb -- loaded when `--drb` is used. Loads other stdlibs (socket, thread, fcntl).
      #   * erb -- loaded by `ConfigurationOptions` so `.rspec` can use ERB. Loads other stdlibs (strscan, cgi/util).
      #   * flexmock -- loaded by our Flexmock mocking adapter.
      #   * json -- loaded by the JSON formatter, loads other stdlibs (ostruct, enc/utf_16le.bundle, etc).
      #   * minitest -- loaded by our Minitest assertions adapter.
      #   * mocha -- loaded by our Mocha mocking adapter.
      #   * rake -- loaded by our Rake task. Loads other stdlibs (fileutils, ostruct, thread, monitor, etc).
      #   * rr -- loaded by our RR mocking adapter.
      #   * rspec-mocks -- loaded by our RSpec mocking adapter.
      #   * rspec-expectations -- loaded by the generated `spec_helper` (defined in project_init).
      #   * test-unit -- loaded by our T::U assertions adapter.
      #
      "$LOAD_PATH.unshift '#{fake_libs}'",
      # Many files assume this has already been loaded and will have errors if it has not.
      'require "rspec/core"',
      # Prevent rspec/autorun from trying to run RSpec.
      disable_autorun_code
    ], :skip_spec_files => %r{/fake_libs/}, :allowed_loaded_feature_regexps => allowed_loaded_features do
    if RUBY_VERSION == '1.8.7'
      before(:example, :description => /(issues no warnings when the spec files are loaded|stdlibs)/) do
        pending "Not working on #{RUBY_DESCRIPTION}"
      end
    elsif RUBY_VERSION == '2.0.0' && RSpec::Support::Ruby.jruby?
      before(:example) do
        skip "Not reliably working on #{RUBY_DESCRIPTION}"
      end
    end
  end

  describe ".configuration" do
    it "returns the same object every time" 

  end

  describe ".configuration=" do
    it "sets the configuration object" 

  end

  describe ".configure" do
    it "yields the current configuration" 

  end

  describe ".world" do
    it "returns the same object every time" 

  end

  describe ".world=" do
    it "sets the world object" 

  end

  describe ".current_example" do
    it "sets the example being executed" 

  end

  describe ".reset" do
    it "resets the configuration and world objects" 


    it 'removes the previously assigned example group constants' 

  end

  describe ".clear_examples" do
    let(:listener) { double("listener") }

    def reporter
      RSpec.configuration.reporter
    end

    before do
      RSpec.configuration.output_stream = StringIO.new
      RSpec.configuration.error_stream = StringIO.new
    end

    it "clears example groups" 


    it "resets start_time" 


    it "clears examples, failed_examples and pending_examples" 


    it "restores inclusion rules set by configuration" 


    it "restores exclusion rules set by configuration" 


    it 'clears the deprecation buffer' 


    it 'does not clear shared examples' 

  end

  it 'uses only one thread local variable', :run_last do
    # Trigger features that use thread locals...
    aggregate_failures { }
    RSpec.shared_examples_for("something") { }

    expect(Thread.current.keys.map(&:to_s).grep(/rspec/i).count).to eq(1)
  end

  describe "::Core.path_to_executable" do
    it 'returns the absolute location of the exe/rspec file' 

  end

  include RSpec::Support::ShellOut

  # This is hard to test :(. Best way I could come up with was starting
  # fresh ruby process w/o this stuff already loaded.
  it "loads mocks and expectations when the constants are referenced", :slow do
    code = 'require "rspec"; puts RSpec::Mocks.name; puts RSpec::Expectations.name'
    out, err, status = run_ruby_with_current_load_path(code)

    expect(err).to eq("")
    expect(out.split("\n")).to eq(%w[ RSpec::Mocks RSpec::Expectations ])
    expect(status.exitstatus).to eq(0)

    expect(RSpec.const_missing(:Expectations)).to be(RSpec::Expectations)
  end

  it 'correctly raises an error when an invalid const is referenced' 


  it "does not blow up if some gem defines `Kernel#it`", :slow do
    code = 'Kernel.module_eval { def it(*); end }; require "rspec/core"'
    out, err, status = run_ruby_with_current_load_path(code)

    expect(err).to eq("")
    expect(out).to eq("")
    expect(status.exitstatus).to eq(0)
  end
end


