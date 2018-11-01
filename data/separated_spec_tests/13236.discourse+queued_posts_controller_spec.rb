require 'rails_helper'
require_dependency 'queued_posts_controller'
require_dependency 'queued_post'

describe QueuedPostsController do
  context 'without authentication' do
    it 'fails' 

  end

  context 'as a regular user' do
    before { sign_in(Fabricate(:user)) }

    it 'fails' 

  end

  context 'as an admin' do
    before { sign_in(Fabricate(:moderator)) }

    it 'returns the queued posts' 

  end

  describe '#update' do
    before { sign_in(Fabricate(:moderator)) }
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

        it 'updates the topic attributes' 


        it 'removes tags if not present' 

      end

      context 'when it is a reply' do
        let(:queued_reply) { Fabricate(:queued_post) }

        it 'updates the reply attributes' 

      end
    end
  end
end

