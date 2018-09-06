require 'rspec/core/formatters/json_formatter'
require 'json'
require 'rspec/core/reporter'

# todo, someday:
# it "lists the groups (describe and context) separately"
# it "includes full 'execution_result'"
# it "relativizes backtrace paths"
# it "includes profile information (implements dump_profile)"
# it "shows the pending message if one was given"
# it "shows the seed if run was randomized"
# it "lists pending specs that were fixed"
RSpec.describe RSpec::Core::Formatters::JsonFormatter do
  include FormatterSupport

  it "can be loaded via `--format json`" 


  it "outputs expected json (brittle high level functional test)" 


  describe "#stop" do
    it "adds all examples to the output hash" 

  end

  describe "#seed" do
    context "use random seed" do
      it "adds random seed" 

    end

    context "don't use random seed" do
      it "don't add random seed" 

    end
  end

  describe "#close" do
    it "outputs the results as a JSON string" 


    it "does not close the stream so that it can be reused within a process" 

  end

  describe "#message" do
    it "adds a message to the messages list" 

  end

  describe "#dump_summary" do
    it "adds summary info to the output hash" 

  end

  describe "#dump_profile", :slow do

    def profile *groups
      groups.each { |group| group.run(reporter) }
      examples = groups.map(&:examples).flatten
      send_notification :dump_profile, profile_notification(0.5, examples, 10)
    end

    before do
      setup_profiler
      formatter
    end

    context "with one example group" do
      before do
        profile( RSpec.describe("group") do
          example("example") { }
        end)
      end

      it "names the example" 


      it "provides example execution time" 


      it "doesn't profile a single example group" 


      it "has the summary of profile information" 

    end

    context "with multiple example groups", :slow do
      before do
        start = Time.utc(2015, 6, 10, 12, 30)
        now = start

        allow(RSpec::Core::Time).to receive(:now) { now }

        group1 = RSpec.describe("slow group") do
          example("example") { }
          after { now += 100 }
        end
        group2 = RSpec.describe("fast group") do
          example("example 1") { }
          example("example 2") { }
          after { now += 1 }
        end
        profile group1, group2
      end

      it "provides the slowest example groups" 


      it "provides information" 


      it "ranks the example groups by average time" do |ex|
        expect(formatter.output_hash[:profile][:groups].first[:description]).to eq("slow group")
      end
    end
  end
end

