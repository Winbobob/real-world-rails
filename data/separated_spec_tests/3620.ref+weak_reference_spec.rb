require 'spec_helper'

describe Ref::WeakReference do
  describe '#object' do
    context 'when has not garbage collected objects' do
      it 'gets the object' 

    end

    context 'when has a lot of objects' do
      # Since we can't reliably control the garbage collector, this is a brute force test.
      # It might not always fail if the garbage collector and memory allocator don't
      # cooperate, but it should fail often enough on continuous integration to
      # hilite any problems. Set the environment variable QUICK_TEST to "true" if you
      # want to make the tests run quickly.
      it 'get the correct object' 

    end
  end

  describe '#inspect' do
    context 'when GC is called' do
      it 'inspects not be nil' 

    end
  end
end

