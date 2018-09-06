require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  render_views

  let!(:topic) { create :topic }
  let!(:participant) { create :participant }

  def valid_attributes
    {
      comment_markdown: "### This is a comment"
    }
  end

  context 'participant' do
    before do
      sign_in participant
    end

    describe "POST #create" do
      ActiveJob::Base.queue_adapter = :test
      context "with valid params" do
        it "creates a new Comment" 

      end
      context "queues EveryCommentNotificationJob" do
        it "creates a new Comment" 

      end
    end

    describe 'POST #create: mentions creates notifications' do

      ActiveJob::Base.queue_adapter = :test
      let(:mentionable) { create :participant, name: 'Sean' }
      let(:valid_attributes) {
        {
          comment_markdown: "hello @Sean",
          mentions_cache: "[{\"id\":1,\"name\":\"Sean\"},{\"id\":22,\"name\":\"Hanno\"}]"
        }
      }
      it 'queues MentionsNotificationsJob' 

    end
  end

  context 'public user' do
    describe "POST #create" do
      context "with valid params" do
        it "creates a new Comment" 

      end
    end
  end

end

