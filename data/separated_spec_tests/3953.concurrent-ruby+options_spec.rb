module Concurrent

  RSpec.describe Options do

    context '.executor_from_options' do

      let(:executor) { ImmediateExecutor.new }
      let(:io_executor) { ImmediateExecutor.new }
      let(:fast_executor) { ImmediateExecutor.new }

      it 'returns the given :executor' 


      it 'returns the global io executor when :executor is :io' 


      it 'returns the global fast executor when :executor is :fast' 


      it 'returns an immediate executor when :executor is :immediate' 


      it 'raises an exception when :executor is an unrecognized symbol' 

    end
  end
end

