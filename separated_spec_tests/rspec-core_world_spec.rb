class Bar; end
class Foo; end

module RSpec::Core

  RSpec.describe RSpec::Core::World do
    let(:configuration) { RSpec.configuration }
    let(:world) { RSpec.world }

    describe '#reset' do
      it 'clears #example_groups' 


      it 'clears #source_from_file cache', :isolated_directory do
        File.open('foo.rb', 'w') { |file| file.write('puts 1') }
        expect(world.source_from_file('foo.rb').lines).to eq(['puts 1'])

        File.open('foo.rb', 'w') { |file| file.write('puts 2') }
        expect(world.source_from_file('foo.rb').lines).to eq(['puts 1'])

        world.reset
        expect(world.source_from_file('foo.rb').lines).to eq(['puts 2'])
      end

      it 'clears #syntax_highlighter memoization' 


      it 'removes the previously assigned example group constants' 

    end

    describe "#example_groups" do
      it "contains all registered example groups" 

    end

    describe "#all_example_groups" do
      it "contains all example groups from all levels of nesting" 

    end

    describe "#all_examples" do
      it "contains all examples from all levels of nesting" 

    end

    describe "#preceding_declaration_line (again)" do
      let(:group) do
        RSpec.describe("group") do

          example("example") {}

        end
      end

      let(:second_group) do
        RSpec.describe("second_group") do

          example("second_example") {}

        end
      end

      let(:group_declaration_line) { group.metadata[:line_number] }
      let(:example_declaration_line) { group_declaration_line + 2 }

      def preceding_declaration_line(line_num)
        world.preceding_declaration_line(__FILE__, line_num)
      end

      context "with one example" do
        it "returns nil if no example or group precedes the line" 


        it "returns the argument line number if a group starts on that line" 


        it "returns the argument line number if an example starts on that line" 


        it "returns line number of a group that immediately precedes the argument line" 


        it "returns line number of an example that immediately precedes the argument line" 

      end

      context "with two groups and the second example is registered first" do
        let(:second_group_declaration_line) { second_group.metadata[:line_number] }

        before do
          world.record(second_group)
          world.record(group)
        end

        it 'return line number of group if a group start on that line' 

      end

      context "with groups from multiple files registered" do
        another_file = File.join(__FILE__, "another_spec_file.rb")

        let(:group_from_another_file) do
          instance_eval <<-EOS, another_file, 1
            RSpec.describe("third group") do

              example("inside of a gropu")

            end
          EOS
        end

        before do
          world.record(group)
          world.record(group_from_another_file)
        end

        it "returns nil if given a file name with no declarations" 


        it "considers only declaration lines from the provided files", :aggregate_failures do
          expect(world.preceding_declaration_line(another_file, 1)).to eq(1)
          expect(world.preceding_declaration_line(another_file, 2)).to eq(1)
          expect(world.preceding_declaration_line(another_file, 3)).to eq(3)
          expect(world.preceding_declaration_line(another_file, 4)).to eq(3)
          expect(world.preceding_declaration_line(another_file, 5)).to eq(3)
          expect(world.preceding_declaration_line(another_file, 100_000)).to eq(3)

          expect(world.preceding_declaration_line(__FILE__, group_declaration_line + 1)).to eq(group_declaration_line)
        end
      end
    end

    describe '#source_from_file' do
      it 'caches Source instances by file path' 

    end

    describe '#syntax_highlighter' do
      it 'returns a memoized SyntaxHighlighter' 

    end

    describe "#announce_filters" do
      let(:reporter) { instance_spy(Reporter) }
      before { allow(world).to receive(:reporter) { reporter } }

      context "when --only-failures is passed" do
        before { configuration.force(:only_failures => true) }

        context "and all examples are filtered out" do
          before do
            configuration.filter_run_including :foo => 'bar'
          end

          it 'will ignore run_all_when_everything_filtered' 

        end

        context "and `example_status_persistence_file_path` is not configured" do
          it 'aborts with a message explaining the config option must be set first' 

        end

        context "and `example_status_persistence_file_path` is configured" do
          it 'does not abort' 

        end
      end

      context "when --only-failures is not passed" do
        before { expect(configuration.only_failures?).not_to eq true }

        context "and `example_status_persistence_file_path` is not configured" do
          it 'does not abort' 

        end

        context "and `example_status_persistence_file_path` is configured" do
          it 'does not abort' 

        end
      end

      context "with no examples" do
        before { allow(world).to receive(:example_count) { 0 } }

        context "with no filters" do
          it "announces" 

        end

        context "with an inclusion filter" do
          it "announces" 

        end

        context "with an inclusion filter and run_all_when_everything_filtered" do
          it "announces" 

        end

        context "with an exclusion filter" do
          it "announces" 

        end

        context "with a filter but with silence_filter_announcements" do
          it "does not announce" 

        end
      end

      context "with examples" do
        before { allow(world).to receive(:example_count) { 1 } }

        context "with no filters" do
          it "does not announce" 

        end
      end
    end
  end
end

