require 'rspec/core/formatters/profile_formatter'

RSpec.describe RSpec::Core::Formatters::ProfileFormatter do
  include FormatterSupport

  def profile *groups
    setup_profiler
    groups.each { |group| group.run(reporter) }
    examples = groups.map(&:examples).flatten
    total_time = examples.map { |e| e.execution_result.run_time }.inject(&:+)
    send_notification :dump_profile, profile_notification(total_time, examples, 10)
  end

  describe "#dump_profile", :slow do
    example_line_number = nil

    shared_examples_for "profiles examples" do
      it "names the example" 


      it "prints the time" 


      it "prints the path" 


      it "prints the percentage taken from the total runtime" 

    end

    context "with one example group" do
      before do
        example_clock = class_double(RSpec::Core::Time, :now => RSpec::Core::Time.now + 0.5)

        profile(RSpec.describe("group") do
          example("example") do |example|
            # make it look slow without actually taking up precious time
            example.clock = example_clock
          end
          example_line_number = __LINE__ - 4
        end)
      end

      it_should_behave_like "profiles examples"

      it "doesn't profile a single example group" 

    end

    context "with multiple example groups" do
      before do
        example_clock = class_double(RSpec::Core::Time, :now => RSpec::Core::Time.now + 0.5)

        @slow_group_line_number = __LINE__ + 1
        group1 = RSpec.describe("slow group") do
          example("example") do |example|
            # make it look slow without actually taking up precious time
            example.clock = example_clock
          end
          example_line_number = __LINE__ - 4
        end
        group2 = RSpec.describe("fast group") do
          example("example 1") { }
          example("example 2") { }
        end
        profile group1, group2
      end

      it_should_behave_like "profiles examples"

      it "prints the slowest example groups" 


      it "prints the time" 


      it "ranks the example groups by average time" 


      it "prints the location of the slow groups" 

    end
  end
end

