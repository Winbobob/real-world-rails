module Concurrent

  RSpec.describe 'dataflow' do

    let(:executor) { ImmediateExecutor.new }
    let(:root_executor) { SimpleExecutorService.new }

    it 'raises an exception when no block given' 


    specify '#dataflow uses the global fast executor' do
      input = Future.execute{0}
      expect(Concurrent).to receive(:dataflow_with).once.
        with(Concurrent.global_io_executor, input)
      Concurrent::dataflow(input){0}
    end

    specify '#dataflow_with uses the given executor' do
      input = Future.execute{0}
      result = Future.new{0}

      expect(Future).to receive(:new).with(executor: root_executor).and_return(result)
      Concurrent::dataflow_with(root_executor, input){0}
    end

    specify '#dataflow_with raises an exception when no executor given' do
      expect {
        Concurrent::dataflow_with(nil){ nil }
      }.to raise_error(ArgumentError)
    end

    it 'accepts zero or more dependencies' 


    it 'accepts uncompleted dependencies' 


    it 'accepts completed dependencies' 


    it 'raises an exception if any dependencies are not IVars' 


    it 'doesn\'t raise exceptions from dependencies, unless called with !' 


    it 'returns a Future' 


    context 'does not schedule the Future' do

      specify 'if no dependencies are completed' do
        d = Future.new(executor: executor){0}
        f = Concurrent::dataflow(d){0}
        expect(f).to be_unscheduled
        d.execute

        d = Future.new(executor: executor){0}
        f = Concurrent::dataflow_with(root_executor, d){0}
        expect(f).to be_unscheduled
        d.execute
      end

      specify 'if one dependency of two is completed' do
        d1 = Future.new(executor: executor){0}
        d2 = Future.new(executor: executor){0}
        f = Concurrent::dataflow(d1, d2){0}
        d1.execute
        expect(f).to be_unscheduled
        d2.execute

        d1 = Future.new(executor: executor){0}
        d2 = Future.new(executor: executor){0}
        f = Concurrent::dataflow_with(root_executor, d1, d2){0}
        d1.execute
        expect(f).to be_unscheduled
        d2.execute
      end
    end

    context 'schedules the Future when all dependencies are available' do

      specify 'if there is just one' do
        d = Future.new(executor: executor){0}
        f = Concurrent::dataflow(d){0}
        d.execute
        expect(f.value).to eq 0

        d = Future.new(executor: executor){0}
        f = Concurrent::dataflow_with(root_executor, d){0}
        d.execute
        expect(f.value).to eq 0
      end

      specify 'if there is more than one' do
        d1 = Future.new(executor: executor){0}
        d2 = Future.new(executor: executor){0}
        f = Concurrent::dataflow(d1, d2){0}
        d1.execute
        d2.execute
        expect(f.value).to eq 0

        d1 = Future.new(executor: executor){0}
        d2 = Future.new(executor: executor){0}
        f = Concurrent::dataflow_with(root_executor, d1, d2){0}
        d1.execute
        d2.execute
        expect(f.value).to eq 0
      end
    end

    context 'counts already executed dependencies' do

      specify 'if there is just one' do
        d = Future.new(executor: executor){0}
        d.execute
        f = Concurrent::dataflow(d){0}
        expect(f.value).to eq 0

        d = Future.new(executor: executor){0}
        d.execute
        f = Concurrent::dataflow_with(root_executor, d){0}
        expect(f.value).to eq 0
      end

      specify 'if there is more than one' do
        d1 = Future.new(executor: executor){0}
        d2 = Future.new(executor: executor){0}
        d1.execute
        d2.execute
        f = Concurrent::dataflow(d1, d2){0}
        expect(f.value).to eq 0

        d1 = Future.new(executor: executor){0}
        d2 = Future.new(executor: executor){0}
        d1.execute
        d2.execute
        f = Concurrent::dataflow_with(root_executor, d1, d2){0}
        expect(f.value).to eq 0
      end
    end

    context 'passes the values of dependencies into the block' do

      specify 'if there is just one' do
        d = Future.new(executor: executor){14}
        f = Concurrent::dataflow(d){|v| v }
        d.execute
        expect(f.value).to eq 14

        d = Future.new(executor: executor){14}
        f = Concurrent::dataflow_with(root_executor, d){|v| v }
        d.execute
        expect(f.value).to eq 14
      end

      specify 'if there is more than one' do
        d1 = Future.new(executor: executor){14}
        d2 = Future.new(executor: executor){2}
        f = Concurrent::dataflow(d1, d2) {|v1, v2| v1 + v2}
        d1.execute
        d2.execute
        expect(f.value).to eq 16

        d1 = Future.new(executor: executor){14}
        d2 = Future.new(executor: executor){2}
        f = Concurrent::dataflow_with(root_executor, d1, d2) {|v1, v2| v1 + v2}
        d1.execute
        d2.execute
        expect(f.value).to eq 16
      end
    end

    context 'module function' do

      it 'can be called as Concurrent.dataflow and Concurrent.dataflow_with' 


    end
  end
end

