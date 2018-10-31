require 'rspec/core/profiler'

RSpec.describe 'RSpec::Core::Profiler' do
  let(:profiler) { RSpec::Core::Profiler.new }

  it 'starts with an empty hash of example_groups' 


  context 'when hooked into the reporter' do
    include FormatterSupport

    let(:description ) { "My Group" }
    let(:now) { ::Time.utc(2015, 6, 2) }

    before do
      allow(::RSpec::Core::Time).to receive(:now) { now }
    end

    let(:group) { RSpec.describe "My Group" }

    describe '#example_group_started' do
      it 'records example groups start time and description' 


      context "when the group is not a top-level group" do
        let(:group) { super().describe "nested" }

        it 'no-ops since we only consider top-level groups for profiling' 

      end
    end

    describe '#example_group_finished' do
      before do
        profiler.example_group_started group_notification group
        allow(::RSpec::Core::Time).to receive(:now) { now + 1 }
      end

      it 'records example groups total time and description' 


      context "when the group is not a top-level group" do
        let(:group) { super().describe "nested" }

        it 'no-ops since we only consider top-level groups for profiling' 

      end
    end

    describe '#example_started' do
      let(:example) { new_example }
      before do
        allow(example).to receive(:example_group) { group }
        allow(group).to receive(:parent_groups) { [group] }
        profiler.example_group_started group_notification group
      end

      it 'increments the count of examples for its parent group' 

    end
  end
end

