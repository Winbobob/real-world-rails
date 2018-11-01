# encoding: utf-8
require 'rspec/core/formatters/base_text_formatter'

RSpec.describe RSpec::Core::Formatters::BaseTextFormatter do
  include FormatterSupport

  context "when closing the formatter", :isolated_directory => true do
    let(:output_to_close) { File.new("./output_to_close", "w") }
    let(:formatter) { described_class.new(output_to_close) }

    after do
      # Windows appears to not let the `:isolated_directory` shared group
      # cleanup if the file isn't closed.
      output_to_close.close unless output_to_close.closed?
    end

    it 'does not error on an already closed output stream' 


    it "flushes output before closing the stream so buffered bytes are not lost if we exit right away" 


    it "does not close the stream so that it can be reused within a process" 

  end

  describe "#dump_summary" do
    it "with 0s outputs pluralized (excluding pending)" 


    it "with 1s outputs singular (including pending)" 


    it "with 1s outputs singular (only pending)" 


    it "with 2s outputs pluralized (including pending)" 


    it 'with errors includes that count' 


    describe "rerun command for failed examples" do
      it "uses the location to identify the example" 


      context "for an example defined in an file required by the user rather than loaded by rspec" do
        it "looks through ancestor metadata to find a workable re-run command" 

      end

      context "for an example that is not uniquely identified by the location" do
        let(:example_group_in_this_file) { example_group_defined_in(__FILE__) }

        def example_group_defined_in(file)
          instance_eval <<-EOS, file, 1
            $group = RSpec.describe("example group") do
              1.upto(2) do |i|
                it("compares \#{i} against 2") { expect(i).to eq(2) }
              end
            end
          EOS
          $group
        end

        let(:id) { "#{RSpec::Core::Metadata::relative_path("#{__FILE__}")}[1:1]" }

        it "uses the id instead" 


        context "on a shell that may not handle unquoted ids" do
          around { |ex| with_env_vars('SHELL' => '/usr/local/bin/cash', &ex) }

          it 'quotes the id to be safe so the rerun command can be copied and pasted' 


          it 'correctly escapes file names that have quotes in them' 

        end
      end

      def output_from_running(example_group)
        allow(RSpec.configuration).to receive(:loaded_spec_files) { RSpec::Core::Set.new([File.expand_path(__FILE__)]) }
        example_group.run(reporter)
        examples = example_group.examples
        failed   = examples.select { |e| e.execution_result.status == :failed }
        send_notification :dump_summary, summary_notification(1, examples, failed, [], 0)
        formatter_output.string
      end
    end
  end

  describe "#dump_failures" do
    let(:group) { RSpec.describe("group name") }

    before { allow(RSpec.configuration).to receive(:color_enabled?) { false } }

    def run_all_and_dump_failures
      group.run(reporter)
      send_notification :dump_failures, failed_examples_notification
    end

    it "preserves formatting" 


    context "with an exception without a message" do
      it "does not throw NoMethodError" 


      it "preserves ancestry" 

    end

    context "with an exception that has an exception instance as its message" do
      it "does not raise NoMethodError" 

    end

    context "with an instance of an anonymous exception class" do
      it "substitutes '(anonymous error class)' for the missing class name" 

    end

    context "with an exception class other than RSpec" do
      it "does not show the error class" 

    end

    if String.method_defined?(:encoding)
      context "with an exception that has a differently encoded message" do
        it "runs without encountering an encoding exception" 

      end
    end

    context "with a failed expectation (rspec-expectations)" do
      it "does not show the error class" 

    end

    context "with a failed message expectation (rspec-mocks)" do
      it "does not show the error class" 

    end

    %w[ include_examples it_should_behave_like ].each do |inclusion_method|
      context "for #shared_examples included using #{inclusion_method}" do
        it 'outputs the name and location' 


        context 'that contains nested example groups' do
          it 'outputs the name and location' 

        end

        context "that contains shared group nesting" do
          it 'includes each inclusion location in the output' 

        end
      end
    end
  end

  describe "custom_colors" do
    it "uses the custom success color" 

  end
end

