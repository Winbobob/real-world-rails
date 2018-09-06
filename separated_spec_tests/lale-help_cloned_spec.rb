require 'rails_helper'

describe Task::Comments::Cloned do
  let(:task) { create(:task) }
  let(:cloned_task) { create(:task, name: 'Original Task') }
  let(:user) { create(:user, first_name: 'Generic', last_name: 'User') }

  context '#execute' do
    it 'creates a comment' 

    it 'fills the comment body with an internationalized message' 

  end
end

