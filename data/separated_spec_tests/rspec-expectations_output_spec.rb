RSpec.shared_examples "output_to_stream" do |stream_name, matcher_method, helper_module|
  include helper_module
  extend helper_module

  it_behaves_like("an RSpec matcher", :valid_value => lambda { print_to_stream('foo') }, :invalid_value => lambda {}) do
    let(:matcher) { output(/fo/).send(matcher_method) }
  end

  define_method :matcher do |*args|
    output(args.first).send(matcher_method)
  end

  it 'is diffable' 


  it 'does not produce warnings when the failure message is accessed first' 


  context "expect { ... }.to output.#{matcher_method}" do
    it "passes if the block outputs to #{stream_name}" 


    it "fails if the block does not output to #{stream_name}" 

  end

  context "expect { ... }.not_to output.#{matcher_method}" do
    it "passes if the block does not output to #{stream_name}" 


    it "fails if the block outputs to #{stream_name}" 

  end

  context "expect { ... }.to output('string').#{matcher_method}" do
    it "passes if the block outputs that string to #{stream_name}" 


    it "fails if the block does not output to #{stream_name}" 


    it "fails if the block outputs a different string to #{stream_name}" 

  end

  context "expect { ... }.to_not output('string').#{matcher_method}" do
    it "passes if the block outputs a different string to #{stream_name}" 


    it "passes if the block does not output to #{stream_name}" 


    it "fails if the block outputs the same string to #{stream_name}" 

  end

  context "expect { ... }.to output(/regex/).#{matcher_method}" do
    it "passes if the block outputs a string to #{stream_name} that matches the regex" 


    it "fails if the block does not output to #{stream_name}" 


    it "fails if the block outputs a string to #{stream_name} that does not match" 

  end

  context "expect { ... }.to_not output(/regex/).#{matcher_method}" do
    it "passes if the block outputs a string to #{stream_name} that does not match the regex" 


    it "passes if the block does not output to #{stream_name}" 


    it "fails if the block outputs a string to #{stream_name} that matches the regex" 

  end

  context "expect { ... }.to output(matcher).#{matcher_method}" do
    it "passes if the block outputs a string to #{stream_name} that passes the given matcher" 


    it "fails if the block outputs a string to #{stream_name} that does not pass the given matcher" 

  end

  context "expect { ... }.to_not output(matcher).#{matcher_method}" do
    it "passes if the block does not output a string to #{stream_name} that passes the given matcher" 


    it "fails if the block outputs a string to #{stream_name} that passes the given matcher" 

  end
end

module RSpec
  module Matchers
    RSpec.describe "output.to_stderr matcher" do
      include_examples "output_to_stream", :stderr, :to_stderr, Module.new {
        def print_to_stream(msg)
          $stderr.print(msg)
        end
      }
    end

    RSpec.describe "output.to_stdout matcher" do
      include_examples "output_to_stream", :stdout, :to_stdout, Module.new {
        def print_to_stream(msg)
          print(msg)
        end
      }
    end

    RSpec.describe "output.to_stderr_from_any_process matcher" do
      include_examples "output_to_stream", :stderr, :to_stderr_from_any_process, Module.new {
        def print_to_stream(msg)
          if RSpec::Support::OS.windows?
            system("<nul set /p msg=\"#{msg}\" 1>&2")
          else
            system("printf #{msg} 1>&2")
          end
        end
      }
    end

    RSpec.describe "output.to_stdout_from_any_process matcher" do
      include_examples "output_to_stream", :stdout, :to_stdout_from_any_process, Module.new {
        def print_to_stream(msg)
          if RSpec::Support::OS.windows?
            system("<nul set /p msg=#{msg}")
          else
            system("printf #{msg}")
          end
        end
      }
    end

    RSpec.describe "output (without `to_stdout` or `to_stderr`)" do
      it 'raises an error explaining the use is invalid' 


      it 'still provides a description (e.g. when used in a one-liner)' 

    end
  end
end

