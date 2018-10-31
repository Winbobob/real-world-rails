require 'rails_helper'

describe Caches::DiscussionReader do
  let(:user) { create :user }
  let(:discussion_one) { create :discussion, author: user }
  let(:discussion_two) { create :discussion, author: user }
  let(:cache) { Caches::DiscussionReader.new user: user, parents: [discussion_one, discussion_two] }

  describe 'initialize' do

    it 'intializes a discussion reader cache' 

  end

  describe 'get_for' do
    it 'returns an existing discussion reader if it exists' 


    it 'returns a new discussion reader if one does not exist' 

  end
end

