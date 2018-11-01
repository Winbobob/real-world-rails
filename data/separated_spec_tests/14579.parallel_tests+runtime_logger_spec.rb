require 'spec_helper'

describe ParallelTests::RSpec::RuntimeLogger do
  before do
    # pretend we run in parallel or the logger will log nothing
    ENV['TEST_ENV_NUMBER'] = ''
    @clean_output = %r{^spec/foo.rb:[-\.e\d]+$}m
  end

  def log_for_a_file(options={})
    Tempfile.open('xxx') do |temp|
      temp.close
      f = File.open(temp.path,'w')
      logger = if block_given?
        yield(f)
      else
        ParallelTests::RSpec::RuntimeLogger.new(f)
      end

      example = double(:file_path => "#{Dir.pwd}/spec/foo.rb")
      unless ParallelTests::RSpec::RuntimeLogger::RSPEC_2
        example = double(:group => example)
      end

      logger.example_group_started example
      logger.example_group_finished example

      logger.start_dump

      #f.close
      return File.read(f.path)
    end
  end

  it "logs runtime with relative paths" 


  it "does not log if we do not run in parallel" 


  it "appends to a given file" 


  it "overwrites a given path" 


  context "integration" do
    around do |example|
      Dir.mktmpdir do |dir|
        Dir.chdir(dir, &example)
      end
    end

    def write(file, content)
      FileUtils.mkdir_p(File.dirname(file))
      File.open(file, 'w') { |f| f.write content }
    end

    it "logs shared examples into the running files" 
          it "is slow" 

        end
      RUBY

      ["a", "b"].each do |letter|
        write "spec/#{letter}_spec.rb", <<-RUBY
          require 'spec_helper'
          describe 'xxx' do
            it_behaves_like "foo"
          end
        RUBY
      end

      system({'TEST_ENV_NUMBER' => '1'}, "rspec spec -I #{Bundler.root.join("lib")} --format ParallelTests::RSpec::RuntimeLogger --out runtime.log 2>&1") || raise("nope")

      result = File.read("runtime.log")
      expect(result).to match(%r{^spec/a_spec.rb:0.5})
      expect(result).to match(%r{^spec/b_spec.rb:0.5})
      expect(result).not_to include "spec_helper"
    end

    it "logs multiple describe blocks" 
          it "is slow" 

        end

        describe "yyy" do
          it "is slow" 


          describe "yep" do
            it "is slow" 

          end
        end
      RUBY

      system({'TEST_ENV_NUMBER' => '1'}, "rspec spec -I #{Bundler.root.join("lib")} --format ParallelTests::RSpec::RuntimeLogger --out runtime.log 2>&1") || raise("nope")

      result = File.read("runtime.log")
      expect(result).to include "a_spec.rb:1.5"
    end
  end
end

