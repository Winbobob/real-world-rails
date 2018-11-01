module Concurrent

  RSpec.describe TVar do

    context '#initialize' do

      it 'accepts an initial value' 


    end

    context '#value' do

      it 'gets the value' 


    end

    context '#value=' do

      it 'sets the value' 


    end

  end

  RSpec.describe '#atomically' do

    it 'raises an exception when no block given' 


    it 'raises the same exception that was raised in Concurrent::atomically' 


    it 'retries on abort' 


    it 'commits writes if the transaction succeeds' 


    it 'undoes writes if the transaction is aborted' 


    it 'provides atomicity' 


    it 'provides weak isolation' 


    it 'is implemented with lazy writes' 


    it 'nests' 


    it 'reflects transactional writes from within the same transaction' 


  end

  RSpec.describe '#abort_transaction' do

    it 'raises an exception outside an #atomically block' 


  end

  RSpec.describe '#leave_transaction' do

    it 'raises an exception outside an #atomically block' 


    it 'neither commits nor aborts a transaction' 


  end

end

