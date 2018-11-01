module RSpec::Core
  RSpec.describe BacktraceFormatter do
    def make_backtrace_formatter(exclusion_patterns=nil, inclusion_patterns=nil)
      BacktraceFormatter.new.tap do |bc|
        bc.exclusion_patterns = exclusion_patterns if exclusion_patterns
        bc.inclusion_patterns = inclusion_patterns if inclusion_patterns
      end
    end

    describe "defaults" do
      it "excludes rspec files" 


      it "excludes the rspec binary, even when rspec-core has installed as a bundler :git dependency" 


      it "excludes java files (for JRuby)", :if => (RUBY_PLATFORM == 'java')  do
        expect(make_backtrace_formatter.exclude?("org/jruby/RubyArray.java:2336")).to be true
      end

      it "includes files in projects containing 'gems' in the name" 


      it "includes something in the current working directory" 


      it 'allows users to exclude their bundler vendor directory' 


      context "when the exclusion list has been replaced" do
        it "includes a line that the default patterns exclude" 

      end

      context "when the current working directory includes `gems` in the name" do
        around(:example) do |ex|
          Dir.mktmpdir do |tmp_dir|
            dir = File.join(tmp_dir, "gems")
            Dir.mkdir(dir)
            Dir.chdir(dir, &ex)
          end
        end

        it "includes something in the current working directory" 

      end
    end

    describe "#filter_gem" do
      shared_examples_for "filtering a gem" do |gem_name, path|
        it 'filters backtrace lines for the named gem' 

      end

      context "for a gem installed globally as a system gem" do
        include_examples "filtering a gem", "foo",
          "/Users/myron/.gem/ruby/2.1.1/gems/foo-1.6.3.1"
      end

      context "for a gem installed in a vendored bundler path" do
        include_examples "filtering a gem", "foo",
          "/Users/myron/code/my_project/bundle/ruby/2.1.0/gems/foo-0.3.6"
      end

      context "for a gem installed by bundler as a :git dependency" do
        include_examples "filtering a gem", "foo",
          "/Users/myron/code/my_project/bundle/ruby/2.1.0/bundler/gems/foo-2b826653e1f5"
      end

      context "for a gem sourced from a local path" do
        include_examples "filtering a gem", "foo", "/Users/myron/code/foo"
      end

      context "when vendored under the working directory" do
        include_examples "filtering a gem", "foo",
          File.join(Dir.getwd, "bundle/ruby/2.1.0/bundler/gems/foo-0.3.6")
      end
    end

    describe "#format_backtrace" do
      it "excludes lines from rspec libs by default" 


      it "excludes lines from bundler by default, since Bundler 1.12 now includes its stackframes in all stacktraces when you `bundle exec`" 


      context "when every line is filtered out" do
        let(:backtrace) do
          [
            "/path/to/rspec-expectations/lib/rspec/expectations/foo.rb:37",
            "/path/to/rspec-expectations/lib/rspec/matchers/foo.rb:37",
            "/path/to/rspec-mocks/lib/rspec/mocks/foo.rb:37",
            "/path/to/rspec-core/lib/rspec/core/foo.rb:37"
          ]
        end

        it "includes full backtrace" 


        it "adds a message explaining everything was filtered" 

      end

      describe "for an empty backtrace" do
        it "does not add the explanatory message about backtrace filtering" 

      end

      describe "for a `nil` backtrace (since exceptions can have no backtrace!)" do
        it 'returns a blank array, with no explanatory message' 

      end

      context "when rspec is installed in the current working directory" do
        it "excludes lines from rspec libs by default", :unless => RSpec::Support::OS.windows? do
          backtrace = [
            "#{Dir.getwd}/.bundle/path/to/rspec-expectations/lib/rspec/expectations/foo.rb:37",
            "#{Dir.getwd}/.bundle/path/to/rspec-expectations/lib/rspec/matchers/foo.rb:37",
            "#{Dir.getwd}/my_spec.rb:5",
            "#{Dir.getwd}/.bundle/path/to/rspec-mocks/lib/rspec/mocks/foo.rb:37",
            "#{Dir.getwd}/.bundle/path/to/rspec-core/lib/rspec/core/foo.rb:37"
          ]

          expect(BacktraceFormatter.new.format_backtrace(backtrace)).to eq(["./my_spec.rb:5"])
        end
      end
    end

    describe "#full_backtrace=true" do
      it "sets full_backtrace true" 


      it "preserves exclusion and inclusion patterns" 


      it "keeps all lines, even those that match exclusions" 

    end

    describe "#full_backtrace=false (after it was true)" do
      it "sets full_backtrace false" 


      it "preserves exclusion and inclusion patterns" 


      it "excludes lines that match exclusions" 

    end

    describe "#backtrace_line" do
      let(:formatter) { BacktraceFormatter.new }

      it "trims current working directory" 


      it "preserves the original line" 


      it "deals gracefully with a security error" 

    end

    context "when the current directory matches one of the default exclusion patterns" do
      include_context "isolated directory"

      around do |ex|
        FileUtils.mkdir_p("bin")
        Dir.chdir("./bin", &ex)
      end

      let(:line) { File.join(Dir.getwd, "foo.rb:13") }

      it 'does not exclude lines from files in the current directory' 


      context "with inclusion_patterns cleared" do
        it 'excludes lines from files in the current directory' 

      end
    end

    context "with no patterns" do
      it "keeps all lines" 


      it "is considered a full backtrace" 

    end

    context "with an exclusion pattern but no inclusion patterns" do
      it "excludes lines that match the exclusion pattern" 


      it "keeps lines that do not match the exclusion pattern" 


      it "is considered a partial backtrace" 

    end

    context "with an exclusion pattern and an inclusion pattern" do
      it "excludes lines that match the exclusion pattern but not the inclusion pattern" 


      it "keeps lines that match both patterns" 


      it "keeps lines that match neither pattern" 


      it "is considered a partial backtrace" 

    end
  end
end

