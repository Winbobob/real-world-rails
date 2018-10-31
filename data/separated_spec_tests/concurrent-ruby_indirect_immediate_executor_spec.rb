require_relative 'executor_service_shared'

module Concurrent

  RSpec.describe IndirectImmediateExecutor do

    subject { IndirectImmediateExecutor.new }

    it_should_behave_like :executor_service

    it "runs its tasks synchronously" 


    it "runs the task on a separate thread" 

  end
end

