# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'rails_helper'

describe CommentsController, type: :controller do
  describe 'GET #index' do
    include_context 'signed in user'

    let(:dog) { create(:dog) }

    it 'is successful' 

  end

  describe 'GET #show' do
    include_context 'signed in user'

    let(:comment) { create(:comment) }

    it 'is successful' 

  end

  describe 'POST #create' do
    include_context 'signed in user'

    context 'a form post is made' do
      it 'should succeed' 

    end

    context 'an ajax call is made' do
      it 'should succeed' 

    end
  end

  describe 'PUT #update' do
    subject { put :update, params: { id: comment.id, comment: { content: 'Hi' } } }

    let(:comment) { create(:comment, user_id: user.id) }

    context 'user created comment being updated' do
      include_context 'signed in user'

      it 'updates the comment' 

    end

    context 'user did not create comment being updated' do
      let(:user) { create(:user) }
      let(:current_user) { create(:user) }

      before do
        sign_in_as(current_user)
      end

      it 'returns unauthorized' 

    end
  end

  describe '#find_commentable' do
    subject { controller.send(:find_commentable) }

    let(:dog) { create(:dog) }

    before do
      allow(controller).to receive(:params) { params }
    end

    context 'params contains _id param' do
      let(:params) { { dog_id: dog.id } }

      it 'returns dog' 

    end

    context 'params does not contain _id param' do
      let(:params) { { something: 1 } }

      it 'returns nil' 

    end
  end
end

