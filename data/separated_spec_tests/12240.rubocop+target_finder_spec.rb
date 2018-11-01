# frozen_string_literal: true

RSpec.describe RuboCop::TargetFinder, :isolated_environment do
  include FileHelper

  RUBY_EXTENSIONS = %w[.rb
                       .arb
                       .axlsx
                       .builder
                       .fcgi
                       .gemfile
                       .gemspec
                       .god
                       .jb
                       .jbuilder
                       .mspec
                       .opal
                       .pluginspec
                       .podspec
                       .rabl
                       .rake
                       .rbuild
                       .rbw
                       .rbx
                       .ru
                       .ruby
                       .spec
                       .thor
                       .watchr].freeze

  RUBY_INTERPRETERS = %w[ruby
                         macruby
                         rake
                         jruby
                         rbx].freeze

  RUBY_FILENAMES = %w[.irbrc
                      .pryrc
                      Appraisals
                      Berksfile
                      Brewfile
                      Buildfile
                      Capfile
                      Cheffile
                      Dangerfile
                      Deliverfile
                      Fastfile
                      Gemfile
                      Guardfile
                      Jarfile
                      Mavenfile
                      Podfile
                      Puppetfile
                      Rakefile
                      Snapfile
                      Thorfile
                      Vagabondfile
                      Vagrantfile
                      buildfile].freeze

  subject(:target_finder) do
    described_class.new(config_store, options)
  end

  let(:config_store) { RuboCop::ConfigStore.new }
  let(:options) { { force_exclusion: force_exclusion, debug: debug } }
  let(:force_exclusion) { false }
  let(:debug) { false }

  before do
    create_empty_file('dir1/ruby1.rb')
    create_empty_file('dir1/ruby2.rb')
    create_empty_file('dir1/file.txt')
    create_empty_file('dir1/file')
    create_file('dir1/executable',  '#!/usr/bin/env ruby')
    create_empty_file('dir2/ruby3.rb')
    create_empty_file('.hidden/ruby4.rb')
  end

  describe '#find' do
    let(:found_files) { target_finder.find(args) }
    let(:found_basenames) { found_files.map { |f| File.basename(f) } }
    let(:args) { [] }

    it 'returns absolute paths' 


    it 'does not find hidden files' 


    context 'when no argument is passed' do
      let(:args) { [] }

      it 'finds files under the current directory' 

    end

    context 'when a directory path is passed' do
      let(:args) { ['../dir2'] }

      it 'finds files under the specified directory' 

    end

    context 'when a hidden directory path is passed' do
      let(:args) { ['.hidden'] }

      it 'finds files under the specified directory' 

    end

    context 'when a non-ruby file is passed' do
      let(:args) { ['dir2/file'] }

      it "doesn't pick the file" 

    end

    context 'when files with a ruby extension are passed' do
      let(:args) { RUBY_EXTENSIONS.map { |ext| "dir2/file#{ext}" } }

      it 'picks all the ruby files' 


      context 'when local AllCops/Include lists two patterns' do
        before do
          create_file('.rubocop.yml', <<-YAML)
            AllCops:
              Include:
                - '**/*.rb'
                - '**/*.arb'
          YAML
        end

        it 'picks two files' 


        context 'when a subdirectory AllCops/Include only lists one pattern' do
          before do
            create_file('dir2/.rubocop.yml', <<-YAML)
              AllCops:
                Include:
                  - '**/*.ruby'
            YAML
          end

          # Include and Exclude patterns are take from the top directory and
          # settings in subdirectories are silently ignored.
          it 'picks two files' 

        end
      end
    end

    context 'when a file with a ruby filename is passed' do
      let(:args) { RUBY_FILENAMES.map { |name| "dir2/#{name}" } }

      it 'picks all the ruby files' 

    end

    context 'when files with ruby interpreters are passed' do
      let(:args) { RUBY_INTERPRETERS.map { |name| "dir2/#{name}" } }

      before do
        RUBY_INTERPRETERS.each do |interpreter|
          create_file("dir2/#{interpreter}", "#!/usr/bin/#{interpreter}")
        end
      end

      it 'picks all the ruby files' 

    end

    context 'when a pattern is passed' do
      let(:args) { ['dir1/*2.rb'] }

      it 'finds files which match the pattern' 

    end

    context 'when same paths are passed' do
      let(:args) { %w[dir1 dir1] }

      it 'does not return duplicated file paths' 

    end

    context 'when some paths are specified in the configuration Exclude ' \
            'and they are explicitly passed as arguments' do
      before do
        create_file('.rubocop.yml', <<-YAML.strip_indent)
          AllCops:
            Exclude:
              - dir1/ruby1.rb
              - 'dir2/*'
        YAML

        create_file('dir1/.rubocop.yml', <<-YAML.strip_indent)
          AllCops:
            Exclude:
              - executable
        YAML
      end

      let(:args) do
        ['dir1/ruby1.rb', 'dir1/ruby2.rb', 'dir1/exe*', 'dir2/ruby3.rb']
      end

      context 'normally' do
        it 'does not exclude them' 

      end

      context "when it's forced to adhere file exclusion configuration" do
        let(:force_exclusion) { true }

        it 'excludes them' 

      end
    end

    context 'when some non-known Ruby files are specified in the ' \
            'configuration Include and they are explicitly passed ' \
            'as arguments' do
      before do
        create_file('.rubocop.yml', <<-YAML.strip_indent)
          AllCops:
            Include:
              - dir1/file
        YAML
      end

      let(:args) do
        ['dir1/file']
      end

      it 'includes them' 

    end

    context 'when some non-known Ruby files are specified in the ' \
            'configuration Include and they are not explicitly passed ' \
            'as arguments' do
      before do
        create_file('.rubocop.yml', <<-YAML.strip_indent)
          AllCops:
            Include:
              - '**/*.rb'
              - dir1/file
        YAML
      end

      let(:args) do
        ['dir1/**/*']
      end

      it 'includes them' 

    end

    context 'when input is passed on stdin' do
      let(:options) do
        {
          force_exclusion: force_exclusion,
          debug: debug,
          stdin: 'def example; end'
        }
      end
      let(:args) { ['Untitled'] }

      it 'includes the file' 

    end
  end

  describe '#find_files' do
    let(:found_files) { target_finder.find_files(base_dir, flags) }
    let(:found_basenames) { found_files.map { |f| File.basename(f) } }
    let(:base_dir) { Dir.pwd }
    let(:flags) { 0 }

    it 'does not search excluded top level directories' 


    it 'works also if a folder is named ","' 

  end

  describe '#target_files_in_dir' do
    let(:found_files) { target_finder.target_files_in_dir(base_dir) }
    let(:found_basenames) { found_files.map { |f| File.basename(f) } }
    let(:base_dir) { '.' }

    it 'picks files with extension .rb' 


    it 'picks ruby executable files with no extension' 


    it 'does not pick files with no extension and no ruby shebang' 


    it 'does not pick directories' 


    it 'picks files specified to be included in config' 


    it 'does not pick files specified to be excluded in config' 


    context 'when an exception is raised while reading file' do
      around do |example|
        original_stderr = $stderr
        $stderr = StringIO.new
        begin
          example.run
        ensure
          $stderr = original_stderr
        end
      end

      before do
        allow_any_instance_of(File).to receive(:readline).and_raise(EOFError)
      end

      context 'and debug mode is enabled' do
        let(:debug) { true }

        it 'outputs error message' 

      end

      context 'and debug mode is disabled' do
        let(:debug) { false }

        it 'outputs nothing' 

      end
    end

    context 'w/ --fail-fast option' do
      let(:options) do
        {
          force_exclusion: force_exclusion,
          debug: debug,
          fail_fast: true
        }
      end

      it 'works' 

    end
  end
end

