require 'spec_helper'

describe Gitlab::ReferenceCounter do
  let(:redis) { double('redis') }
  let(:reference_counter_key) { "git-receive-pack-reference-counter:project-1" }
  let(:reference_counter) { described_class.new('project-1') }

  before do
    allow(Gitlab::Redis::SharedState).to receive(:with).and_yield(redis)
  end

  it 'increases and set the expire time of a reference count for a path' 


  it 'decreases the reference count for a path' 


  it 'warns if attempting to decrease a counter with a value of one or less, and resets the counter' 


  it 'get the reference count for a path' 

end

