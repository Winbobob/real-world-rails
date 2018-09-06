require 'spec_helper'

describe Gitlab::VisibilityLevel do
  describe '.level_value' do
    it 'converts "public" to integer value' 


    it 'converts string integer to integer value' 


    it 'defaults to PRIVATE when string value is not valid' 


    it 'defaults to PRIVATE when integer value is not valid' 

  end

  describe '.levels_for_user' do
    it 'returns all levels for an admin' 


    it 'returns INTERNAL and PUBLIC for internal users' 


    it 'returns PUBLIC for external users' 


    it 'returns PUBLIC when no user is given' 

  end

  describe '.allowed_levels' do
    it 'only includes the levels that arent restricted' 


    it 'returns all levels when no visibility level was set' 

  end

  describe '.closest_allowed_level' do
    it 'picks INTERNAL instead of PUBLIC if public is restricted' 


    it 'picks PRIVATE if nothing is available' 

  end
end

