require "rails_helper"

RSpec.describe "ChatChannels", type: :request do
  let(:user) { create(:user) }
  let(:test_subject) { create(:user) }
  let(:chat_channel) { create(:chat_channel) }
  let(:invite_channel) { create(:chat_channel, channel_type: "invite_only") }
  let(:direct_channel) do
    create(:chat_channel, channel_type: "direct", slug: "hello/#{user.username}")
  end

  before do
    sign_in user
    chat_channel.add_users([user])
  end

  describe "GET /connect" do
    context "when logged in" do
      before do
        get "/connect"
      end

      it "has proper content" 

    end

    context "when logged in and visiting existing channel" do
      before do
        invite_channel.add_users [user]
        sign_in user
        get "/connect/#{invite_channel.slug}"
      end

      it "has proper content" 

    end
  end

  describe "get /chat_channels?state=unopened" do
    it "returns unopened channels" 

  end

  describe "get /chat_channels?state=pending" do
    it "returns pending channels" 


    it "returns no pending channels if no invites" 


    it "returns no pending channels if not pending" 

  end

  describe "GET /chat_channels/:id" do
    context "when request is valid" do
      before do
        get "/chat_channels/#{chat_channel.id}", headers: { HTTP_ACCEPT: "application/json" }
      end

      it "returns 200" 


      it "returns the channel" 

    end

    context "when request is invalid" do
      it "returns proper error message" 

    end
  end

  describe "POST /chat_channels" do
    # rubocop:disable RSpec/MultipleExpectations
    it "creates chat_channel for current user" 

    # rubocop:enable RSpec/MultipleExpectations

    it "returns errors if channel is invalid" 

  end

  describe "PUT /chat_channels/:id" do
    it "updates channel for valid user" 

    it "dissallows invalid users" 

    it "returns errors if channel is invalid" 

  end

  describe "POST /chat_channels/:id/moderate" do
    it "raises NotAuthorizedError if user is not logged in" 


    # rubocop:disable RSpec/ExampleLength
    it "raises NotAuthorizedError if user is logged in but not authorized" 

    # rubocop:enable RSpec/ExampleLength

    context "when user is logged-in and authorized" do
      before do
        user.add_role :super_admin
        sign_in user
        allow(Pusher).to receive(:trigger).and_return(true)
      end

      it "enforces chat_channel_params on ban" 


      it "enforces chat_channel_params on unban" 

    end
  end

  describe "POST /chat_channels/:id/open" do
    it "returns success" 


    it "marks chat_channel_membership as opened" 

  end
end

