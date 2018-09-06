require "guard/compat/test/helper"

require "guard/rspec/inspectors/base_inspector"

RSpec.describe Guard::RSpec::Inspectors::BaseInspector do
  let(:options) { { custom: "value", spec_paths: %w(myspec) } }
  let(:inspector) { Guard::RSpec::Inspectors::BaseInspector.new(options) }
  let(:paths) { %w(spec/foo_spec.rb spec/bar_spec.rb) }

  describe ".initialize" do
    it "sets options and spec_paths" 

  end

  describe "#paths" do
    it "should not be implemented here" 


    context "specific inspector" do
      class FooInspector < Guard::RSpec::Inspectors::BaseInspector
        def paths(paths)
          _clean(paths)
        end
      end

      let(:options) do
        {
          chdir: chdir,
          spec_paths: ["spec"]
        }
      end
      let(:chdir) { nil }
      let(:inspector) { FooInspector.new(options) }

      subject { inspector.paths(paths) }

      context "with dirs" do
        let(:paths) { ["spec"] }

        it "returns matching paths" 


        context "chdir option present" do
          let(:chdir) { "moduleA" }
          let(:paths) { ["#{chdir}/spec"] }

          it "returns matching paths" 

        end
      end

      context "with spec files" do
        let(:paths) do
          ["app/models/a_foo.rb", "spec/models/a_foo_spec.rb"]
        end
        let(:spec_files) do
          [["spec/models/a_foo_spec.rb",
            "spec/models/b_foo_spec.rb"]]
        end

        it "returns matching paths" 


        context "chdir option present" do
          let(:chdir) { "moduleA" }
          let(:paths) do
            ["moduleA/models/a_foo.rb", "spec/models/a_foo_spec.rb"]
          end

          let(:spec_files) do
            [["moduleA/spec/models/a_foo_spec.rb",
              "moduleA/spec/models/b_foo_spec.rb"]]
          end

          it "returns matching paths" 

        end
      end
    end
  end

  describe "#failed" do
    it "should not be implemented here" 

  end

  describe "#reload" do
    it "should not be implemented here" 

  end
end

