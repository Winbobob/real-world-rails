# encoding: utf-8

require 'rails_helper'
require_dependency 'avatar_lookup'

describe AvatarLookup do
  let!(:user) { Fabricate(:user) }

  describe '#[]' do
    before do
      @avatar_lookup = AvatarLookup.new([user.id, nil])
    end

    it 'returns nil if user_id does not exists' 


    it 'returns nil if user_id is nil' 


    it 'returns user if user_id exists' 

  end
end

