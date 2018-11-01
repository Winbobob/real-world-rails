# frozen_string_literal: true

RSpec.describe RuboCop::Options, :isolated_environment do
  include FileHelper

  subject(:options) { described_class.new }

  before do
    $stdout = StringIO.new
    $stderr = StringIO.new
  end

  after do
    $stdout = STDOUT
    $stderr = STDERR
  end

  def abs(path)
    File.expand_path(path)
  end

  describe 'option' do
    describe '-h/--help' do
      it 'exits cleanly' 


      it 'shows help text' 


      it 'lists all builtin formatters' 

    end

    describe 'incompatible cli options' do
      it 'rejects using -v with -V' 


      it 'rejects using -v with --show-cops' 


      it 'rejects using -V with --show-cops' 


      it 'mentions all incompatible options when more than two are used' 

    end

    describe '--parallel' do
      context 'combined with --cache false' do
        it 'fails with an error message' 

      end

      context 'combined with --auto-correct' do
        it 'fails with an error message' 

      end

      context 'combined with --auto-gen-config' do
        it 'fails with an error message' 

      end

      context 'combined with --fail-fast' do
        it 'fails with an error message' 

      end
    end

    describe '--fail-level' do
      it 'accepts full severity names' 


      it 'accepts severity initial letters' 


      it 'accepts the "fake" severities A/autocorrect' 

    end

    describe '--require' do
      let(:required_file_path) { './path/to/required_file.rb' }

      before do
        create_empty_file('example.rb')

        create_file(required_file_path, "puts 'Hello from required file!'")
      end

      it 'requires the passed path' 

    end

    describe '--cache' do
      it 'fails if no argument is given' 


      it 'fails if unrecognized argument is given' 


      it 'accepts true as argument' 


      it 'accepts false as argument' 

    end

    describe '--exclude-limit' do
      it 'fails if given last without argument' 


      it 'fails if given alone without argument' 


      it 'fails if given first without argument' 


      it 'fails if given without --auto-gen-config' 

    end

    describe '--auto-gen-only-exclude' do
      it 'fails if given without --auto-gen-config' 

    end

    describe '--auto-gen-config' do
      it 'accepts other options' 

    end

    describe '-s/--stdin' do
      before do
        $stdin = StringIO.new
        $stdin.puts("{ foo: 'bar' }")
        $stdin.rewind
      end

      it 'fails if no paths are given' 


      it 'succeeds with exactly one path' 


      it 'fails if more than one path is given' 

    end
  end

  describe 'options precedence' do
    def with_env_options(options)
      ENV['RUBOCOP_OPTS'] = options
      yield
    ensure
      ENV.delete('RUBOCOP_OPTS')
    end

    subject(:parsed_options) { options.parse(command_line_options).first }

    let(:command_line_options) { %w[--no-color] }

    context '.rubocop file' do
      before do
        create_file('.rubocop', %w[--color --fail-level C])
      end

      it 'has lower precedence then command line options' 


      it 'has lower precedence then options from RUBOCOP_OPTS env variable' 

    end

    context '.rubocop directory' do
      before do
        FileUtils.mkdir '.rubocop'
      end

      it 'is ignored and command line options are used' 

    end

    context 'RUBOCOP_OPTS environment variable' do
      it 'has lower precedence then command line options' 


      it 'has higher precedence then options from .rubocop file' 

    end
  end
end

