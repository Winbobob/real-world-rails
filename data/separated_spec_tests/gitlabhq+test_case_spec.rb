require 'spec_helper'

describe Gitlab::Ci::Reports::TestCase do
  describe '#initialize' do
    let(:test_case) { described_class.new(**params)}

    context 'when both classname and name are given' do
      context 'when test case is passed' do
        let(:params) do
          {
            name: 'test-1',
            classname: 'trace',
            file: 'spec/trace_spec.rb',
            execution_time: 1.23,
            status: described_class::STATUS_SUCCESS,
            system_output: nil
          }
        end

        it 'initializes an instance' 

      end

      context 'when test case is failed' do
        let(:params) do
          {
            name: 'test-1',
            classname: 'trace',
            file: 'spec/trace_spec.rb',
            execution_time: 1.23,
            status: described_class::STATUS_FAILED,
            system_output: "Failure/Error: is_expected.to eq(300) expected: 300 got: -100"
          }
        end

        it 'initializes an instance' 

      end
    end

    context 'when classname is missing' do
      let(:params) do
        {
          name: 'test-1',
          file: 'spec/trace_spec.rb',
          execution_time: 1.23,
          status: described_class::STATUS_SUCCESS,
          system_output: nil
        }
      end

      it 'raises an error' 

    end

    context 'when name is missing' do
      let(:params) do
        {
          classname: 'trace',
          file: 'spec/trace_spec.rb',
          execution_time: 1.23,
          status: described_class::STATUS_SUCCESS,
          system_output: nil
        }
      end

      it 'raises an error' 

    end
  end
end

