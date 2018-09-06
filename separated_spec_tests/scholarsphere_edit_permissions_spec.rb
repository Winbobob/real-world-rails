# frozen_string_literal: true

require 'feature_spec_helper'

describe 'Editing permissions on a work' do
  context 'when removing permissions from a work with files' do
    let(:user1) { create(:user, display_name: 'First User') }
    let(:user2) { create(:user, display_name: 'Second User') }
    let(:work) do
      create(:public_work, :with_required_metadata, depositor: user1.user_key,
                                                    edit_users: [user1.user_key, user2.user_key])
    end

    let(:file_set) { create(:file_set, :public, user: user1, edit_users: [user1.user_key, user2.user_key]) }

    before do
      work.members << file_set
      work.save
      sign_in_with_js(user1)
    end

    it 'copies the permissions to the file set' 

  end
end

