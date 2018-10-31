module Concurrent

  RSpec.describe SafeTaskExecutor do

    describe '#execute' do

      context 'happy execution' do

        let(:task) { Proc.new { 42 } }
        subject { SafeTaskExecutor.new(task) }

        it 'should return success' 


        it 'should return task value' 


        it 'should return a nil reason' 


        it 'passes all arguments to #execute to the task' 


        it 'protectes #execute with a mutex' 

      end

      context 'failing execution' do

        let(:task) { Proc.new { raise StandardError.new('an error') } }
        subject { SafeTaskExecutor.new(task) }

        it 'should return false success' 


        it 'should return a nil value' 


        it 'should return the reason' 


        it 'rescues Exception when :rescue_exception is true' 


        it 'rescues StandardError when :rescue_exception is false' 


        it 'rescues StandardError by default' 

      end
    end
  end
end

