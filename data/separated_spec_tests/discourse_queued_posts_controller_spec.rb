require 'rails_helper'
require_dependency 'queued_posts_controller'
require_dependency 'queued_post'

describe QueuedPostsController do
  context 'without authentication' do
    it 'fails' 

  end

  context 'as a regular user' do
    let!(:user) { log_in(:user) }
    it 'fails' 

  end

  context 'as an admin' do
    let!(:user) { log_in(:moderator) }

    it 'returns the queued posts' 

  end

  describe '#update' do
    let!(:user) { log_in(:moderator) }
    let(:qp) { Fabricate(:queued_post) }

    context 'not found' do
      it 'returns json error' 

    end

    context 'approved' do
      it 'updates the post to approved' 

    end

    context 'rejected' do
      it 'updates the post to rejected' 

    end

    context 'editing content' do
      let(:changes) do
        {
          raw: 'new raw',
          title: 'new title',
          category_id: 10,
          tags: ['new_tag']
        }
      end

      context 'when it is a topic' do
        let(:queued_topic) { Fabricate(:queued_topic) }

        before do
          put :update, params: {
            id: queued_topic.id, queued_post: changes
          }, format: :json

          expect(response).to be_success
        end

        it 'updates raw' 


        it 'updates the title' 


        it 'updates the category' 


        it 'updates the tags' 

      end

      context 'when it is a reply' do
        let(:queued_reply) { Fabricate(:queued_post) }

        before do
          put :update, params: {
            id: queued_reply.id, queued_post: changes
          }, format: :json

          expect(response).to be_success
        end

        it 'updates raw' 


        it 'does not update the title' 


        it 'does not update the category' 


        it 'does not update the tags' 

      end
    end
  end
end

