# rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
require "rails_helper"

RSpec.describe "ChatChannelMemberships", type: :request do
  let(:user) { create(:user) }
  let(:second_user) { create(:user) }
  let(:chat_channel) { create(:chat_channel) }

  before do
    sign_in user
    chat_channel.add_users([user])
  end

  describe "POST /chat_channel_memberships" do
    it "creates chat channel invitation" 


    it "denies chat channel invitation to non-authorized user" 

  end

  describe "PUT /chat_channel_memberships/:id" do
    before do
      user.add_role(:super_admin)
      post "/chat_channel_memberships", params: {
        chat_channel_membership: { user_id: second_user.id, chat_channel_id: chat_channel.id },
      }
    end

    it "accepts chat channel invitation" 


    it "rejects chat channel invitation" 


    it "disallows non-logged-user" 

  end

  describe "DELETE /chat_channel_memberships/:id" do
    before do
      user.add_role(:super_admin)
      post "/chat_channel_memberships", params: {
        chat_channel_membership: { user_id: second_user.id, chat_channel_id: chat_channel.id },
      }
    end

    it "leaves chat channel" 

  end
end
# rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations

