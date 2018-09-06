require 'rspec/core/example_status_persister'
require 'tempfile'

module RSpec::Core
  RSpec.describe "Example status persisting" do
    it 'can load a previously persisted set of example statuses from disk' 


    it 'returns `[]` from `load_from` when the named file does not exist' 


    describe "persisting example statuses" do
      include FormatterSupport

      def new_example(id, metadata = {})
        super(metadata).tap do |ex|
          allow(ex).to receive_messages(:id => id)
        end
      end

      let(:file) { Tempfile.new("example_statuses.txt") }
      let(:existing_spec_file) { Metadata.relative_path(__FILE__) }

      it 'writes the given example statuses to disk' 


      it 'creates any necessary intermediary directories' 


      it 'prevents simultaneous access to the file' 


      it 'merges the example statuses with the existing records in the named file' 


      it 'includes the spec run times so users can use it for their own purposes' 


      it "persists a loaded but unexecuted example with an #{Configuration::UNKNOWN_STATUS} status" 


      it "persists a skipped example properly" 

    end
  end

  RSpec.describe "Example status merging" do
    let(:existing_spec_file) { Metadata.relative_path(__FILE__) }

    context "when no examples from this or previous runs are given" do
      it "returns an empty array" 

    end

    context "when there are no examples from previous runs" do
      it "returns the examples from this run" 

    end

    context "when there are no examples from this run" do
      it "returns the examples from the previous runs" 

    end

    context "for examples that are only in the set for this run" do
      it "takes them indiscriminately, even if they did not execute" 

    end

    context "for examples that are only in the set for previous runs" do
      context "if there are other examples from this run for the same file " do
        it "deletes them since the examples must no longer exist" 

      end

      context "if there are no other examples from this run for the same file" do
        it "deletes them if the file no longer exist" 


        it "keeps them if the file exists because the examples may still exist" 

      end
    end

    context "for examples that are in both sets" do
      it "takes the status from this run as long as the example executed" 


      it "takes the status from previous runs if the example was loaded but did not execute" 

    end

    it 'sorts the returned examples to make the saved file more easily scannable' 


    it "preserves any extra attributes include in the example hashes" 


    def example(file, scoped_id, status, extras = {})
      { :example_id => "#{file}[#{scoped_id}]", :status => status }.merge(extras)
    end

    def merge(options)
      ExampleStatusMerger.merge(
        options.fetch(:this_run),
        options.fetch(:from_previous_runs)
      )
    end
  end

  RSpec.describe "Example status serialization" do
    it 'serializes the provided example statuses in a human readable format' 


    it 'takes the column headers into account when sizing the columns' 


    it 'can round trip through the dumper and parser' 


    it 'can round trip blank values through the dumper and parser' 


    it 'produces nothing when given nothing' 


    # Intended for use with indented heredocs.
    # taken from Ruby Tapas:
    # https://rubytapas.dpdcart.com/subscriber/post?id=616#files
    def unindent(s)
      s.gsub(/^#{s.scan(/^[ \t]+(?=\S)/).min}/, "")
    end

    def dump(examples)
      ExampleStatusDumper.dump(examples)
    end

    def parse(string)
      ExampleStatusParser.parse(string)
    end
  end
end

