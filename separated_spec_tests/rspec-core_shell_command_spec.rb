require 'rspec/core/bisect/shell_command'
require 'rspec/core/formatters/bisect_drb_formatter'

module RSpec::Core
  RSpec.describe Bisect::ShellCommand do
    let(:server) { instance_double("RSpec::Core::Bisect::Server", :drb_port => 1234) }
    let(:shell_command) { described_class.new(original_cli_args) }

    describe "#command_for" do
      def command_for(locations, options={})
        load_path = options.fetch(:load_path) { [] }
        orig_load_path = $LOAD_PATH.dup
        $LOAD_PATH.replace(load_path)
        shell_command.command_for(locations, server)
      ensure
        $LOAD_PATH.replace(orig_load_path)
      end

      let(:original_cli_args) { %w[ spec/unit -rfoo -Ibar --warnings --backtrace ] }

      it "includes the original CLI arg options" 


      it 'replaces the locations from the original CLI args with the provided locations' 


      it 'escapes locations' 


      it "includes an option for the server's DRB port" 


      it "ignores an existing --drb-port option (since we use the server's port instead)" 


      %w[ --bisect --bisect=verbose --bisect=blah ].each do |value|
        it "ignores a `#{value}` option since that would infinitely recurse" 

      end

      it 'uses the bisect formatter' 


      def expect_formatters_to_be_excluded
        cmd = command_for([])
        expect(cmd).to include("--format bisect").and exclude(
          "progress", "html", "--out", "specs.html", "-f ", "-o "
        )
        expect(cmd.scan("--format").count).to eq(1)
      end

      it 'excludes any --format and matching --out options passed in the original args' 


      it 'excludes any -f <value> and matching -o <value> options passed in the original args' 


      it 'excludes any -f<value> and matching -o<value> options passed in the original args' 


      it 'starts with the path to the current ruby executable' 


      it 'includes the path to the rspec executable after the ruby executable' 


      it 'escapes the rspec executable' 


      it 'includes the current load path as an option to `ruby`, not as an option to `rspec`' 


      it 'escapes the load path entries' 


      it 'supports Pathnames in the load path' 

    end

    describe "#repro_command_from", :simulate_shell_allowing_unquoted_ids do
      let(:original_cli_args) { %w[ spec/unit --seed 1234 ] }

      def repro_command_from(ids)
        shell_command.repro_command_from(ids)
      end

      it 'starts with `rspec #{example_ids}`' 


      it 'includes the original CLI args but excludes the original CLI locations' 


      it 'includes the original SPEC_OPTS but excludes the --bisect flag' 


      it 'includes original options that `command_for` excludes' 


      it 'groups multiple ids for the same file together' 


      it 'prints the files in alphabetical order' 


      it 'prints ids from the same file in sequential order' 


      it 'does not include `--bisect` even though the original args do' 


      it 'quotes the ids on a shell like ZSH that requires it' 

    end

    describe "#original_locations" do
      let(:original_cli_args) { %w[ spec/unit spec/integration/foo_spec.rb --order defined ] }

      it "returns the original files or directories to run" 

    end

    describe "#bisect_environment_hash" do
      let(:original_cli_args) { %w[] }

      context 'when `SPEC_OPTS` has been set' do
        it 'returns a hash with `SPEC_OPTS` set to the opts without --bisect' 

      end

      context 'when `SPEC_OPTS` has not been set' do
        it 'returns a blank hash' 

      end
    end

    describe "#spec_opts_without_bisect" do
      let(:original_cli_args) { %w[ ] }

      context 'when `SPEC_OPTS` has been set' do
        it 'returns the spec opts without --bisect' 

      end

      context 'when `SPEC_OPTS` has not been set' do
        it 'returns a blank string' 

      end
    end

    def uses_quoting_for_escaping?
      RSpec::Support::OS.windows? || RSpec::Support::Ruby.jruby?
    end
  end
end

