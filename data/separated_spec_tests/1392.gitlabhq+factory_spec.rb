require 'spec_helper'

describe Gitlab::Ci::Status::Factory do
  let(:user) { create(:user) }
  let(:fabricated_status) { factory.fabricate! }
  let(:factory) { described_class.new(resource, user) }

  context 'when object has a core status' do
    HasStatus::AVAILABLE_STATUSES.each do |simple_status|
      context "when simple core status is #{simple_status}" do
        let(:resource) { double('resource', status: simple_status) }

        let(:expected_status) do
          Gitlab::Ci::Status.const_get(simple_status.capitalize)
        end

        it "fabricates a core status #{simple_status}" 


        it "matches a valid core status for #{simple_status}" 


        it "does not match any extended statuses for #{simple_status}" 

      end
    end
  end

  context 'when resource supports multiple extended statuses' do
    let(:resource) { double('resource', status: :success) }

    let(:first_extended_status) do
      Class.new(SimpleDelegator) do
        def first_method
          'first return value'
        end

        def second_method
          'second return value'
        end

        def self.matches?(*)
          true
        end
      end
    end

    let(:second_extended_status) do
      Class.new(SimpleDelegator) do
        def first_method
          'decorated return value'
        end

        def third_method
          'third return value'
        end

        def self.matches?(*)
          true
        end
      end
    end

    shared_examples 'compound decorator factory' do
      it 'fabricates compound decorator' 


      it 'delegates to core status' 


      it 'latest matches status becomes a status name' 


      it 'matches correct core status' 


      it 'matches correct extended statuses' 

    end

    context 'when exclusive statuses are matches' do
      before do
        allow(described_class).to receive(:extended_statuses)
          .and_return([[first_extended_status, second_extended_status]])
      end

      it 'does not fabricate compound decorator' 


      it 'delegates to core status' 


      it 'matches correct core status' 


      it 'matches correct extended statuses' 

    end

    context 'when exclusive statuses are not matched' do
      before do
        allow(described_class).to receive(:extended_statuses)
          .and_return([[first_extended_status], [second_extended_status]])
      end

      it_behaves_like 'compound decorator factory'
    end

    context 'when using simplified status grouping' do
      before do
        allow(described_class).to receive(:extended_statuses)
          .and_return([first_extended_status, second_extended_status])
      end

      it_behaves_like 'compound decorator factory'
    end
  end
end

