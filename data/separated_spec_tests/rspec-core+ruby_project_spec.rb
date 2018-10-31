module RSpec
  module Core
    RSpec.describe RubyProject do

      describe "#determine_root" do

        context "with ancestor containing spec directory" do
          it "returns ancestor containing the spec directory" 

        end

        context "without ancestor containing spec directory" do
          it "returns current working directory" 

        end

      end

      describe "#ascend_until" do
        subject { RubyProject }

        def expect_ascend(source_path, *yielded_paths)
          expect { |probe|
            allow(File).to receive(:expand_path).with('.') { source_path }
            subject.ascend_until(&probe)
          }.to yield_successive_args(*yielded_paths)
        end

        it "works with a normal path" 


        it "works with a path with a trailing slash" 


        it "works with a path with double slashes" 


        it "works with a path with escaped slashes" 

      end
    end
  end
end

