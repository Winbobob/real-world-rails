require 'spec_helper'

RSpec.describe RSpec::Sidekiq::Matchers::BeUnique do
  shared_context 'a unique worker' do
    before do
      stub_const(module_constant, true)
    end
    before(:each) { subject.matches? @worker }

    describe 'expected usage' do
      it 'matches' 


      describe '#failure_message' do
        it 'returns message' 

      end
    end

    describe '#matches?' do
      context 'when condition matches' do
        it 'returns true' 

      end

      context 'when condition does not match' do
        it 'returns false' 

      end

      describe '#failure_message_when_negated' do
        it 'returns message' 

      end
    end

    describe '#description' do
      it 'returns description' 

    end
  end

  context 'a sidekiq-enterprise scheduled worker' do
    let(:interval) { 3.hours }
    let(:module_constant) { "Sidekiq::Enterprise" }
    before { @worker = create_worker unique_for: interval }
    include_context 'a unique worker'
  end

  context 'a sidekiq-unique-jobs scheduled worker' do
    let(:module_constant) { "SidekiqUniqueJobs" }
    before { @worker = create_worker unique: :all }
    include_context 'a unique worker'
  end

  context 'a sidekiq-unique-jobs regular worker' do
    let(:module_constant) { "SidekiqUniqueJobs" }
    before { @worker = create_worker unique: true }
    include_context 'a unique worker'
  end

  describe '#be_unique' do
    before do
      stub_const("SidekiqUniqueJobs", true)
    end

    it 'returns instance' 

  end

  describe '#failure_message_when_negated' do
    before do
      stub_const("SidekiqUniqueJobs", true)
    end

    it 'returns message' 

  end

  describe '#unique_key' do
    context "with Sidekiq Enterprise" do
      before do
        stub_const("Sidekiq::Enterprise", true)
      end

      it "returns the correct key" 

    end

    context "with sidekiq-unique-jobs" do
      before do
        stub_const("SidekiqUniqueJobs", true)
      end

      it "returns the correct key" 

    end

    context "without a uniquing solution" do
      it "raises an exception" 

    end
  end
end

