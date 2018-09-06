require 'ostruct'
require 'rspec/core/drb'

RSpec.describe RSpec::Core::ConfigurationOptions, :isolated_directory => true, :isolated_home => true do
  include ConfigOptionsHelper

  # On Ruby 2.4, `File.expand("~")` works even if `ENV['HOME']` is not set.
  # But on earlier versions, it fails.
  it "warns when HOME env var is not set", :unless => (RUBY_PLATFORM == 'java' || RSpec::Support::OS.windows? || RUBY_VERSION >= '2.4') do
    without_env_vars 'HOME' do
      expect_warning_with_call_site(__FILE__, __LINE__ + 1)
      RSpec::Core::ConfigurationOptions.new([]).options
    end
  end

  it "does not mutate the provided args array" 


  describe "#configure" do
    let(:config) { RSpec::Core::Configuration.new }

    it "configures deprecation_stream before loading requires (since required files may issue deprecations)" 


    it "configures deprecation_stream before configuring filter_manager" 


    it "configures deprecation_stream before configuring formatters" 


    it "sends libs before requires" 


    it "loads requires before loading specs" 


    it "sets up load path and requires before formatter" 


    it "sets default_path before loading specs" 


    it "sets `files_or_directories_to_run` before `requires` so users can check `files_to_run` in a spec_helper loaded by `--require`" 


    it "sets default_path before `files_or_directories_to_run` since it relies on it" 


    it 'configures the seed (via `order`) before requires so that required files can use the configured seed' 


    it 'configures `only_failures` before `files_or_directories_to_run` since it affects loaded files' 


    { "pattern" => :pattern, "exclude-pattern" => :exclude_pattern }.each do |flag, attr|
      it "sets #{attr} before `requires` so users can check `files_to_run` in a `spec_helper` loaded by `--require`" 

    end

    it "assigns inclusion_filter" 


    it "merges the :exclusion_filter option with the default exclusion_filter" 


    it "forces color" 


    it "forces force_color" 


    it "forces no_color" 


    [
      ["--failure-exit-code", "3", :failure_exit_code, 3 ],
      ["--pattern", "foo/bar", :pattern, "foo/bar"],
      ["--failure-exit-code", "37", :failure_exit_code, 37],
      ["--default-path", "behavior", :default_path, "behavior"],
      ["--order", "rand", :order, "rand"],
      ["--seed", "37", :order, "rand:37"],
      ["--drb-port", "37", :drb_port, 37]
    ].each do |cli_option, cli_value, config_key, config_value|
      it "forces #{config_key}" 

    end

    it "merges --require specified by multiple configuration sources" 


    it "merges --I specified by multiple configuration sources" 


    %w[ --only-failures --next-failure -n].each do |option|
      describe option do
        it "changes `config.only_failures?` to true" 

      end
    end
  end

  describe "-c, --color, and --colour" do
    it "sets :color_mode => :automatic" 


    it "overrides previous color flag" 

  end

  describe "--no-color" do
    it "sets :color_mode => :off" 


    it "overrides previous color flag" 

  end

  describe "--force-color" do
    it "sets :color_mode => :on" 


    it "overrides previous color flag" 

  end

  describe "-I" do
    example "adds to :libs" do
      expect(parse_options('-I', 'a_dir')).to include(:libs => ['a_dir'])
    end
    example "can be used more than once" do
      expect(parse_options('-I', 'dir_1', '-I', 'dir_2')).to include(:libs => ['dir_1','dir_2'])
    end
  end

  describe '--require' do
    example "requires files" do
      expect(parse_options('--require', 'a/path')).to include(:requires => ['a/path'])
    end
    example "can be used more than once" do
      expect(parse_options('--require', 'path/1', '--require', 'path/2')).to include(:requires => ['path/1','path/2'])
    end
  end

  describe "--format, -f" do
    it "sets :formatter" 


    example "can accept a class name" do
      expect(parse_options('-fSome::Formatter::Class')).to include(:formatters => [['Some::Formatter::Class']])
    end
  end

  describe "--profile, -p" do
    it "sets :profile_examples" 

  end

  describe "--no-profile" do
    it "sets :profile_examples to false" 

  end

  describe "--example" do
    it "sets :full_description" 

  end

  describe "--backtrace, -b" do
    it "sets full_backtrace on config" 

  end

  describe "--fail-fast" do
    it "defaults to false" 


    it "sets fail_fast on config" 


    it "sets fail_fast on config" 

  end

  describe "--failure-exit-code" do
    it "sets :failure_exit_code" 


    it "overrides previous :failure_exit_code" 

  end

  describe "--dry-run" do
    it "defaults to false" 


    it "sets dry_run on config" 

  end

  describe "--options" do
    it "sets :custom_options_file" 

  end

  describe "--no-drb" do
    it "disables drb" 


    it "overrides a previous drb => true" 


    it "gets overriden by a subsquent drb => true" 

  end

  describe "files_or_directories_to_run" do
    it "parses files from '-c file.rb dir/file.rb'" 


    it "parses dir from 'dir'" 


    it "parses dir and files from 'spec/file1_spec.rb, spec/file2_spec.rb'" 


    it "parses file names that look like `default-path` option" 


    it "provides no files or directories if spec directory does not exist" 

  end

  describe "default_path" do
    it "gets set before files_or_directories_to_run" 

  end

  describe "invalid options" do
    def expect_parsing_to_fail_mentioning_source(source, options=[])
      expect {
        parse_options(*options)
      }.to raise_error(SystemExit).and output(a_string_including(
        "invalid option: --foo_bar (defined in #{source})",
        "Please use --help for a listing of valid options"
      )).to_stderr
    end

    %w[ ~/.rspec ./.rspec ./.rspec-local ].each do |file_name|
      context "defined in #{file_name}" do
        it "mentions the file name in the error so users know where to look for it" 

      end
    end

    context "defined in $XDG_CONFIG_HOME/rspec/options" do
      it "mentions the file name in the error so users know where to look for it" 

    end

    context "defined in SPEC_OPTS" do
      it "mentions ENV['SPEC_OPTS'] as the source in the error so users know where to look for it" 

    end

    context "defined in a custom file" do
      it "mentions the custom file as the source of the error so users know where to look for it" 


      context "passed at the command line" do
        it "does not mention the source since it is obvious where it came from" 

      end
    end
  end

  describe "sources: $XDG_CONFIG_HOME/rspec/options, ~/.rspec, ./.rspec, ./.rspec-local, custom, CLI, and SPEC_OPTS" do
    it "merges both global, local, SPEC_OPTS, and CLI" 


    it "reads ~/.rspec if $XDG_CONFIG_HOME/rspec/options is not found" 


    it "does not read ~/.rspec if $XDG_CONFIG_HOME/rspec/options is present" 


    it "uses $XDG_CONFIG_HOME environment variable when set to find XDG global options" 


    it 'ignores file or dir names put in one of the option files or in SPEC_OPTS, since those are for persistent options' 


    it "prefers SPEC_OPTS over CLI" 


    it "prefers CLI over file options" 


    it "prefers CLI over file options for filter inclusion" 


    it "prefers project file options over global file options" 


    it "prefers local file options over project file options" 


    it "parses options file correctly if erb code has trimming options" 


    context "with custom options file" do
      it "ignores project and global options files" 


      it "parses -e 'full spec description'" 

    end
  end
end

