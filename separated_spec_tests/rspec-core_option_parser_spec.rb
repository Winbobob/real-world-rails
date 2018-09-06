require 'rspec/core/drb'
require 'rspec/core/bisect/coordinator'

module RSpec::Core
  RSpec.describe OptionParser do
    before do
      allow(RSpec.configuration).to receive(:reporter) do
        fail "OptionParser is not allowed to access `config.reporter` since we want " +
             "ConfigurationOptions to have the chance to set `deprecation_stream` " +
             "(based on `--deprecation-out`) before the deprecation formatter is " +
             "initialized by the reporter instantiation. If you need to issue a deprecation, " +
             "populate an `options[:deprecations]` key and have ConfigurationOptions " +
             "issue the deprecation after configuring `deprecation_stream`"
      end
    end

    context "when given empty args" do
      it "does not parse them" 


      it "still returns a `:files_or_directories_to_run` entry since callers expect that" 

    end

    it 'does not mutate the provided args array' 


    it "proposes you to use --help and returns an error on incorrect argument" 


    it 'treats additional arguments as `:files_or_directories_to_run`' 


    {
      '--init'         => ['-i','--I'],
      '--default-path' => ['-d'],
      '--dry-run'      => ['-d'],
      '--drb-port'     => ['-d'],
    }.each do |long, shorts|
      shorts.each do |option|
        it "won't parse #{option} as a shorthand for #{long}" 

      end
    end

    %w[ -h --help ].each do |option|
      it 'sets the `:runner` option with the `PrintHelp` invocation' 

    end

    %w[ -v --version ].each do |option|
      describe option do
        it 'sets the `:runner` option with the `PrintVersion` invocation' 

      end
    end

    %w[ -X --drb ].each do |option|
      describe option do
        let(:parser) { Parser.new([option]) }

        it 'sets the `:drb` option to true' 


        it 'sets the `:runner` option with the `DrbWithFallback` invocation' 

      end
    end

    describe '--init' do
      let(:initialize_project) { double(:initialize_project) }

      it 'sets the `:runner` option with the `InitializeProject` invocation' 

    end

    describe "-I" do
      it "sets the path" 


      context "with a string containing `#{File::PATH_SEPARATOR}`" do
        it "splits into multiple paths, just like Ruby's `-I` option" 

      end
    end

    describe "--default-path" do
      it "sets the default path where RSpec looks for examples" 

    end

    %w[--format -f].each do |option|
      describe option do
        it "defines the formatter" 

      end
    end

    %w[--out -o].each do |option|
      describe option do
        it "sets the output stream for the formatter" 


        context "with multiple formatters" do
          context "after last formatter" do
            it "sets the output stream for the last formatter" 

          end

          context "after first formatter" do
            it "sets the output stream for the first formatter" 

          end
        end
      end
    end

    describe "--deprecation-out" do
      it 'sets the deprecation stream' 

    end

    describe "--only-failures" do
      it 'is equivalent to `--tag last_run_status:failed`' 

    end

    %w[--next-failure -n].each do |option|
      describe option do
        it 'is equivalent to `--tag last_run_status:failed --fail-fast --order defined`' 


        it 'does not force `--order defined` over a specified `--seed 1234` option that comes before it' 


        it 'does not force `--order defined` over a specified `--seed 1234` option that comes after it' 

      end
    end

    %w[--example -e].each do |option|
      describe option do
        it "escapes the arg" 

      end
    end

    %w[--pattern -P].each do |option|
      describe option do
        it "sets the filename pattern" 


        it 'combines multiple patterns' 

      end
    end

    %w[--tag -t].each do |option|
      describe option do
        context "without ~" do
          it "treats no value as true" 


          it "treats 'true' as true" 


          it "treats 'nil' as nil" 


          it "treats 'false' as false" 


          it "merges muliple invocations" 


          it "treats 'any_string' as 'any_string'" 


          it "treats ':any_sym' as :any_sym" 


          it "treats '42' as 42" 


          it "treats '3.146' as 3.146" 

        end

        context "with ~" do
          it "treats no value as true" 


          it "treats 'true' as true" 


          it "treats 'nil' as nil" 


          it "treats 'false' as false" 

        end
      end
    end

    describe "--order" do
      it "is nil by default" 


      %w[rand random].each do |option|
        context "with #{option}" do
          it "defines the order as random" 

        end
      end
    end

    describe "--seed" do
      it "sets the order to rand:SEED" 

    end

    describe "--bisect" do
      it "sets the `:bisect` option" 


      it "sets the `:runner` option with the `Bisect` invocation" 

    end

    describe '--profile' do
      it 'sets profile_examples to true by default' 


      it 'sets profile_examples to supplied int' 


      it 'sets profile_examples to true when accidentally combined with path' 


      it 'warns when accidentally combined with path' 

    end

    describe '--fail-fast' do
      it 'warns when a non-integer is specified as fail count' 

    end

    describe '--warning' do
      around do |ex|
        verbose = $VERBOSE
        ex.run
        $VERBOSE = verbose
      end

      it 'immediately enables warnings so that warnings are issued for files loaded by `--require`' 

    end

    describe '--force-color' do
      it 'aborts if --no-color was previously set' 

    end

    describe '--no-color' do
      it 'aborts if --force-color was previously set' 

    end
  end
end

