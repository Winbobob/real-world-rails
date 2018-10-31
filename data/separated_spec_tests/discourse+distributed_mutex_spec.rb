require 'rails_helper'
require_dependency 'distributed_mutex'

describe DistributedMutex do
  it "allows only one mutex object to have the lock at a time" 


  it "handles auto cleanup correctly" 


  it "maintains mutex semantics" 


  context "readonly redis" do
    before do
      $redis.slaveof "127.0.0.1", "99991"
    end

    after do
      $redis.slaveof "no", "one"
    end

    it "works even if redis is in readonly" 

  end

end

