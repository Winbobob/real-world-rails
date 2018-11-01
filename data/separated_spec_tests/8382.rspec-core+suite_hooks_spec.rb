require "support/runner_support"

module RSpec::Core
  RSpec.describe "Configuration :suite hooks" do
    [:before, :after, :prepend_before, :append_before, :prepend_after, :append_after].each do |registration_method|
      type = registration_method.to_s.split('_').last

      describe "a `:suite` hook registered with `#{registration_method}`" do
        it 'is skipped when in dry run mode' 


        it 'notifies about errors in the hook' 


        it 'sets `wants_to_quit` when an error occurs so that the suite does not get run' 


        it 'runs in the context of an example group' 


        it 'allows access to rspec-mocks methods within the hook' 


        it 'allows access to rspec-expectation methods within the hook' 


        context "registered on an example group" do
          it "is ignored with a clear warning" 

        end

        context "registered with metadata" do
          it "explicitly warns that the metadata is ignored" 

        end
      end
    end

    it 'always runs `after(:suite)` hooks even in the face of errors' 


    describe "the runner" do
      include_context "Runner support"

      def define_and_run_example_group(&block)
        example_group = class_double(ExampleGroup, :descendants => [])

        allow(example_group).to receive(:run, &block)
        allow(world).to receive_messages(:ordered_example_groups => [example_group])
        allow(config).to receive :load_spec_files

        runner = build_runner
        runner.run err, out
      end

      it "still runs :suite hooks with metadata even though the metadata is ignored" 


      it "runs :suite hooks before and after example groups in the correct order" 

    end
  end
end

