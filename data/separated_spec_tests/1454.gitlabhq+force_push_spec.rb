require 'spec_helper'

describe Gitlab::Checks::ForcePush do
  set(:project) { create(:project, :repository) }

  describe '.force_push?' do
    it 'returns false if the repo is empty' 


    it 'checks if old rev is an anchestor' 

  end
end

