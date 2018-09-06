require_relative 'executor_service_shared'

module Concurrent

  RSpec.describe SimpleExecutorService do

    subject { SimpleExecutorService.new }

    it_should_behave_like :executor_service

    context '#post' do

      subject { SimpleExecutorService.new }

      it 'creates a new thread for a call without arguments' 


      it 'executes a call without arguments' 


      it 'creates a new thread for a call with arguments' 


      it 'executes a call with one argument' 


      it 'executes a call with multiple arguments' 


      it 'aliases #<<' 

    end

    context 'SimpleExecutorService.post' do

      subject { SimpleExecutorService }

      it 'creates a new thread for a call without arguments' 


      it 'executes a call without arguments' 


      it 'creates a new thread for a call with arguments' 


      it 'executes a call with one argument' 


      it 'executes a call with multiple arguments' 


      it 'aliases #<<' 

    end
  end
end

