require 'rails_helper'
require 'post_action_creator'

describe PostActionCreator do
  let(:user) { Fabricate(:user) }
  let(:post) { Fabricate(:post) }
  let(:like_type_id) { PostActionType.types[:like] }

  describe 'perform' do
    it 'creates a post action' 


    it 'does not create an invalid post action' 

  end

end

