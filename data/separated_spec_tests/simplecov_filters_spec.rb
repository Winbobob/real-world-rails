# frozen_string_literal: true

require "helper"

if SimpleCov.usable?
  describe SimpleCov::SourceFile do
    subject do
      SimpleCov::SourceFile.new(source_fixture("sample.rb"), [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil])
    end

    it "doesn't match a new SimpleCov::StringFilter 'foobar'" 


    it "doesn't match a new SimpleCov::StringFilter 'some/path'" 


    it "matches a new SimpleCov::StringFilter 'spec/fixtures'" 


    it "matches a new SimpleCov::StringFilter 'spec/fixtures/sample.rb'" 


    it "matches a new SimpleCov::StringFilter 'sample.rb'" 


    it "doesn't match a new SimpleCov::StringFilter '.pl'" 


    it "doesn't match a parent directory with a new SimpleCov::StringFilter" 


    it "matches a new SimpleCov::RegexFilter /\/fixtures\//" 


    it "doesn't match a new SimpleCov::RegexFilter /^\/fixtures\//" 


    it "matches a new SimpleCov::RegexFilter /^\/spec\//" 


    it "doesn't match a new SimpleCov::BlockFilter that is not applicable" 


    it "matches a new SimpleCov::BlockFilter that is applicable" 


    it "matches a new SimpleCov::ArrayFilter when 'sample.rb' is passed as array" 


    it "doesn't match a new SimpleCov::ArrayFilter when a file path different than 'sample.rb' is passed as array" 


    it "matches a new SimpleCov::ArrayFilter when two file paths including 'sample.rb' are passed as array" 


    it "doesn't match a parent directory with a new SimpleCov::ArrayFilter" 


    it "matches a new SimpleCov::ArrayFilter when /sample.rb/ is passed as array" 


    it "doesn't match a new SimpleCov::ArrayFilter when a file path different than /sample.rb/ is passed as array" 


    it "matches a new SimpleCov::ArrayFilter when a block is passed as array and returns true" 


    it "doesn't match a new SimpleCov::ArrayFilter when a block that returns false is passed as array" 


    it "matches a new SimpleCov::ArrayFilter when a custom class that returns true is passed as array" 


    it "doesn't match a new SimpleCov::ArrayFilter when a custom class that returns false is passed as array" 


    context "with no filters set up and a basic source file in an array" do
      before do
        @prev_filters = SimpleCov.filters
        SimpleCov.filters = []
      end

      subject do
        [SimpleCov::SourceFile.new(source_fixture("sample.rb"), [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil])]
      end

      after do
        SimpleCov.filters = @prev_filters
      end

      it 'returns 0 items after executing SimpleCov.filtered on files when using a "sample" string filter' 


      it 'returns 0 items after executing SimpleCov.filtered on files when using a "spec/fixtures" string filter' 


      it 'returns 1 item after executing SimpleCov.filtered on files when using a "fooo" string filter' 


      it "returns 0 items after executing SimpleCov.filtered on files when using a block filter that returns true" 


      it "returns 1 item after executing SimpleCov.filtered on files when using an always-false block filter" 


      it "returns a FileList after filtering" 

    end

    context "with the default configuration" do
      skip "requires the default configuration" if ENV["SIMPLECOV_NO_DEFAULTS"]

      def a_file(path)
        path = File.join(SimpleCov.root, path) unless path.start_with?("/")
        SimpleCov::SourceFile.new(path, [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil])
      end

      context "inside the project" do
        it "doesn't filter" 


        it "filters vendor/bundle" 

      end

      context "outside the project" do
        it "filters" 


        it "filters even if the sibling directory has SimpleCov.root as a prefix" 

      end
    end

    describe ".class_for_argument" do
      it "returns SimpleCov::StringFilter for a string" 


      it "returns SimpleCov::RegexFilter for a string" 


      it "returns SimpleCov::RegexFilter for a string" 

    end
  end
end

