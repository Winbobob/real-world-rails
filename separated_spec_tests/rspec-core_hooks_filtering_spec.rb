module RSpec::Core
  RSpec.describe "config block hook filtering" do
    context "when hooks are defined after a group has been defined" do
      it "still applies" 


      it "applies only to groups with matching metadata" 


      { ":example" => [:example], ":each" => [:each] }.each do |label, args|
        args << :run_hooks
        it "applies only to examples with matching metadata (for hooks declared with #{label})" 

      end

      it "does not apply `suite` hooks to groups (or print warnings about suite hooks applied to example groups)" 


      it "only runs example hooks once when there are multiple nested example groups" 


      it "only runs context hooks around the highest level group with matching filters" 

    end

    describe "unfiltered hooks" do
      it "is run" 

    end

    describe "hooks with single filters" do

      context "with no scope specified" do
        it "is run around|before|after :each if the filter matches the example group's filter" 

      end

      it "is run if the filter matches the example group's filter" 


      it "runs before|after :all hooks on matching nested example groups" 


      it "runs before|after :all hooks only on the highest level group that matches the filter" 


      it "does not run if the filter doesn't match the example group's filter" 


      it "runs :all|:context hooks even if there are no unskipped examples in that context" 


      it "does not run :all|:context hooks in global config if the entire context is skipped" 


      it "does not run local :all|:context hooks if the entire context is skipped" 


      context "when the hook filters apply to individual examples instead of example groups" do
        let(:each_filters) { [] }
        let(:all_filters) { [] }

        let(:example_group) do
          md = example_metadata
          RSpec.describe do
            it("example", md) { }
          end
        end

        def filters
          each_filters + all_filters
        end

        before(:each) do
          af, ef = all_filters, each_filters

          RSpec.configure do |c|
            c.before(:all,  :foo => :bar) { af << "before all in config"}
            c.around(:each, :foo => :bar) {|example| ef << "around each in config"; example.run}
            c.before(:each, :foo => :bar) { ef << "before each in config"}
            c.after(:each,  :foo => :bar) { ef << "after each in config"}
            c.after(:all,   :foo => :bar) { af << "after all in config"}
          end

          example_group.run
        end

        describe 'an example with matching metadata' do
          let(:example_metadata) { { :foo => :bar } }

          it "runs the `:each` hooks" 

        end

        describe 'an example without matching metadata' do
          let(:example_metadata) { { :foo => :bazz } }

          it "does not run any of the hooks" 

        end
      end
    end

    describe "hooks with multiple filters" do
      it "is run if all hook filters match the group's filters" 


      it "does not run if some hook filters don't match the group's filters" 


      it "does not run for examples that do not match, even if their group matches" 

    end

    describe ":context hooks defined in configuration with metadata" do
      it 'applies to individual matching examples' 


      it 'does not apply to individual matching examples for which it also applies to a parent example group' 

    end
  end
end

