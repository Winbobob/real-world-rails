require 'rspec/core/project_initializer'

module RSpec::Core
  RSpec.describe ProjectInitializer, :isolated_directory => true do

    describe "#run" do
      context "with no args" do
        subject(:command_line_config) { ProjectInitializer.new(:report_stream => output) }

        let(:output) { StringIO.new }

        context "with no .rspec file" do
          it "says it's creating .rspec " 


          it "generates a .rspec" 

        end

        context "with a .rspec file" do
          it "says .rspec exists" 


          it "doesn't create a new one" 

        end

        context "with no spec/spec_helper.rb file" do
          it "says it's creating spec/spec_helper.rb " 


          it "generates a spec/spec_helper.rb" 

        end

        context "with a spec/spec_helper.rb file" do
          before { FileUtils.mkdir('spec') }

          it "says spec/spec_helper.rb exists" 


          it "doesn't create a new one" 

        end
      end
    end

    describe "#run", "with a target directory" do
      subject(:command_line_config) {
        ProjectInitializer.new(:destination => tmpdir, :report_stream => StringIO.new)
      }

      let(:tmpdir) { 'relative/destination/' }

      before { FileUtils.mkdir_p(tmpdir) }

      context "with no .rspec file" do
        it "generates a .rspec" 

      end

      context "with a .rspec file" do
        it "doesn't create a new one" 

      end

      context "with no spec/spec_helper.rb file" do
        it "generates a spec/spec_helper.rb" 

      end

      context "with a spec/spec_helper.rb file" do
        it "doesn't create a new one" 

      end
    end

  end
end

