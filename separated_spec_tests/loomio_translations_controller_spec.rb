require 'rails_helper'

describe API::TranslationsController do

  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:discussion) { create(:discussion, author: user) }
  let(:comment) { create(:comment, discussion: discussion) }
  let(:discussion_translation) { create(:translation, translatable: discussion, language: :fr, fields: { title: "title", description: "description"}) }
  let(:comment_translation) { create(:translation, translatable: comment, language: :fr, fields: { body: "body" }) }

  before do
    sign_in user
  end

  describe 'show' do
    it 'returns a translation based on lang parameter' 


    it 'returns english by default' 

  end

  describe 'inline' do
    context 'success' do

      it 'responds with an inline translation for a discussion' 


      it 'responds with an inline translation for a comment' 


      it 'does not translate an unknown language' 


    end
  end

end

