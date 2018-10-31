require 'rails_helper'

describe Task::Comments::Invited do
  let(:task) { create(:task) }
  let(:invite_count) { 2 }
  let(:user) { create(:user, first_name: 'Generic', last_name: 'User') }

  context '#execute' do
    it 'creates a comment' 

    it 'fills the comment body with an internationalized message' 

  end
end

