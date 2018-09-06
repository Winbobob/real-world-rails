require "guard/compat/test/helper"

require "launchy"

require "guard/rspec/runner"

RSpec.describe Guard::RSpec::Runner do
  let(:options) { { cmd: "rspec" } }
  let(:runner) { Guard::RSpec::Runner.new(options) }
  let(:inspector) { instance_double(Guard::RSpec::Inspectors::SimpleInspector) }
  let(:notifier) { instance_double(Guard::RSpec::Notifier) }
  let(:results) { instance_double(Guard::RSpec::Results) }
  let(:process) { instance_double(Guard::RSpec::RSpecProcess) }

  before do
    allow(Guard::Compat::UI).to receive(:info)
    allow(Guard::Compat::UI).to receive(:warning)
    allow(Guard::Compat::UI).to receive(:error)
    allow(Guard::RSpec::Inspectors::Factory).to receive(:create) { inspector }
    allow(Guard::RSpec::Notifier).to receive(:new) { notifier }
    allow(Guard::RSpec::Command).to receive(:new) { "rspec" }
    allow(notifier).to receive(:notify)
    allow(notifier).to receive(:notify_failure)

    allow(results).to receive(:summary).and_return("Summary")
    allow(results).to receive(:failed_paths).and_return([])

    allow(Guard::RSpec::RSpecProcess).to receive(:new).and_return(process)
    allow(process).to receive(:all_green?).and_return(true)
    allow(process).to receive(:results).and_return(results)
  end

  describe ".initialize" do
    context "with custom options" do
      let(:options) { { foo: :bar } }

      it "instanciates inspector via Inspectors::Factory with custom options" 


      it "instanciates notifier with custom options" 

    end
  end

  describe "#reload" do
    it 'calls inspector\'s #reload' 

  end

  shared_examples "abort" do
    it "aborts" 


    it "returns true" 

  end

  describe "#run_all" do
    let(:options) do
      {
        spec_paths: %w(spec1 spec2),
        cmd: "rspec",
        run_all: { message: "Custom message" }
      }
    end

    before do
      allow(inspector).to receive(:failed)
    end

    it "builds commands with spec paths" 


    it "prints message" 


    context "when no paths are given" do
      subject { runner.run_all }

      let(:options) do
        {
          spec_paths: [],
          run_all: { message: "Custom message" }
        }
      end

      include_examples "abort"
    end

    context "with custom cmd" do
      before do
        options[:run_all][:cmd] = "rspec -t ~slow"
      end

      it "builds command with custom cmd" 

    end

    context "with no cmd" do
      before do
        options[:cmd] = nil
        allow(Guard::RSpec::Command).to receive(:new)
        allow(Guard::Compat::UI).to receive(:error).with(an_instance_of(String))
        allow(notifier).to receive(:notify_failure)
        runner.run_all
      end

      it "does not build" 


      it "issues a warning to the user" 


      it "notifies the notifer of failure" 

    end

    describe "return value" do
      subject { runner.run_all }

      it { is_expected.to be true }

      context "when process is not all green" do
        before do
          allow(process).to receive(:all_green?).and_return(false)
        end

        it { is_expected.to be false }
      end
    end
  end

  describe "#run" do
    let(:paths) { %w(spec_path1 spec_path2) }
    before do
      allow(inspector).to receive(:paths) { paths }
      allow(inspector).to receive(:failed)
    end

    it "prints running message" 


    context "when no paths are given" do
      subject { runner.run([]) }

      before do
        allow(inspector).to receive(:paths) { [] }
      end

      include_examples "abort"
    end

    it "builds commands with spec paths" 


    context "with all_after_pass option" do
      let(:options) { { cmd: "rspec", all_after_pass: true } }

      it "re-runs all if run is success" 

    end

    context "with launchy option" do
      let(:options) { { cmd: "rspec", launchy: "launchy_path" } }

      before do
        allow(Pathname).to receive(:new).
          with("launchy_path") { double(exist?: true) }
      end

      it "opens Launchy" 

    end

    context "with a custom results file" do
      let(:options) do
        { cmd: "rspec", results_file: results_file }.merge(chdir_options)
      end

      context "with no chdir option" do
        let(:chdir_options) { {} }

        context "when the path is relative" do
          let(:results_file) { File.join(Dir.pwd, "foobar.txt") }
          it "uses the given file" 

        end

        context "when the path is absolute" do
          let(:results_file) { "/foo/foobar.txt" }
          it "uses the given path" 

        end
      end

      context "with chdir option" do
        context "when chdir option is absolute" do
          let(:chdir_options) { { chdir: "/foo/bar/moduleA" } }

          context "when the path is relative" do
            let(:results_file) { "foobar.txt" }

            it "uses a path relative to chdir" 

          end

          context "when the path is absolute" do
            let(:results_file) { "/foo/foobar.txt" }
            it "uses the full given path anyway" 

          end
        end

        context "when chdir option is relative" do
          let(:chdir_options) { { chdir: "moduleA" } }
          before do
            allow(Guard::Compat::UI).to receive(:warning)
          end

          context "when the path is relative" do
            let(:results_file) { "foobar.txt" }

            it "uses a path relative to chdir" 


            it "shows a warning" 

          end

          context "when the path is absolute" do
            let(:results_file) { "/foo/foobar.txt" }
            it "uses the full given path anyway" 

          end
        end
      end
    end

    context "with no custom results file" do
      let(:options) { { cmd: "rspec" } }
      it "uses the default" 

    end

    it "notifies inspector about failed paths" 


    context "with failed paths" do
      before do
        allow(results).to receive(:failed_paths).and_return(
          [
            "./failed_spec.rb:123",
            "./other/failed_spec.rb:77"
          ]
        )
      end

      it "notifies inspector about failed paths" 

    end

    it "notifies success" 


    it "notifies failure" 


    describe "return value" do
      subject { runner.run(paths) }

      it { is_expected.to be true }

      context "with all_after_pass option" do
        let(:options) do
          { cmd: "rspec", all_after_pass: true, run_all: {}, spec_paths: paths }
        end

        it { is_expected.to be true }

        describe "when all tests fail" do
          before do
            allow(process).to receive(:all_green?).and_return(true, false)
          end

          it { is_expected.to be false }
        end
      end

      context "when process is not all green" do
        before do
          allow(process).to receive(:all_green?).and_return(false)
        end

        it { is_expected.to be false }
      end
    end
  end
end

