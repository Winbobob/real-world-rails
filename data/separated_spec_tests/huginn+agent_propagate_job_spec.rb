require 'rails_helper'

describe AgentPropagateJob do
  it "calls Agent.receive! when run" 


  context "#can_enqueue?" do
    it "is truthy when no propagation job is queued" 


    it "is falsy when a progation job is queued" 


    it "is truthy when a enqueued progation job failed" 

  end
end

