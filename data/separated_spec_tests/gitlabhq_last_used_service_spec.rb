require 'spec_helper'

describe Keys::LastUsedService do
  describe '#execute', :clean_gitlab_redis_shared_state do
    it 'updates the key when it has not been used recently' 


    it 'does not update the key when it has been used recently' 


    it 'does not update the updated_at field' 

  end

  describe '#update?', :clean_gitlab_redis_shared_state do
    it 'returns true when no last used timestamp is present' 


    it 'returns true when the key needs to be updated' 


    it 'returns false when a lease has already been obtained' 


    it 'returns false when the key does not yet need to be updated' 

  end
end

