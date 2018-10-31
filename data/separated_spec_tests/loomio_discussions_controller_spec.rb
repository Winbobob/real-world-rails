require 'rails_helper'

describe DiscussionsController do
  let(:group) { create :formal_group, is_visible_to_public: true }
  let(:discussion) { create :discussion, private: false, group: group }
  let(:user) { create :user }
  before { group.add_member! user }

  describe 'show' do
    it 'displays an xml feed' 


    it 'sets metadata for public discussions' 


    it 'does not set metadata for private discussions' 

  end
end

