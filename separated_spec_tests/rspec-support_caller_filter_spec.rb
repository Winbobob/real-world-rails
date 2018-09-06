require 'spec_helper'
require 'fileutils'
require 'rspec/support/caller_filter'

module RSpec
  describe CallerFilter do
    it 'can receive skip_frames and increment arguments' 


    it 'returns the immediate caller when called from a spec' 


    describe "the filtering regex" do
      def ruby_files_in_lib(lib)
        # http://rubular.com/r/HYpUMftlG2
        path = $LOAD_PATH.find { |p| p.match(/\/rspec-#{lib}(-[a-f0-9]+)?\/lib/) }

        Dir["#{path}/**/*.rb"].sort.tap do |files|
          # Just a sanity check...
          expect(files.count).to be > 5
        end
      end

      def unmatched_from(files)
        files.reject { |file| file.match(CallerFilter::IGNORE_REGEX) }
      end

      %w[ core mocks expectations support ].each do |lib|
        it "matches all ruby files in rspec-#{lib}" 

      end

      it "does not match other ruby files" 


      def in_rspec_support_lib(name)
        root = File.expand_path("../../../../lib/rspec/support", __FILE__)
        dir = "#{root}/#{name}"
        FileUtils.mkdir(dir)
        yield dir
      ensure
        FileUtils.rm_rf(dir)
      end

      it 'does not match rubygems lines from `require` statements' 

    end
  end
end

