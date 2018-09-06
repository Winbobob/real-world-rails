# frozen_string_literal: true

require 'rails_helper'

describe 'feedback form' do
  let(:slide_with_feedback_link) do
    '/training/instructors/new-instructor-orientation/new-instructor-orientation-complete'
  end

  let(:feedback_link_text) { 'Submit Feedback' }

  context 'from a training module', type: :feature, js: true do
    let(:body) { 'It was great' }
    let(:user) { create(:user) }
    it 'submits successfully for a logged in user' 


    it 'submits successfully for a logged out user' 

  end

  context 'with a query param' do
    let(:body) { 'It was great' }
    let(:user) { create(:user) }
    let(:referer) { 'wikipedia.org' }
    it 'submits successfully' 

  end

  meths = ['#index', '#show']

  meths.each do |meth|
    context meth do
      let(:user) { create(:user) }
      let!(:resp) do
        FeedbackFormResponse.create(body: 'bananas',
                                    subject: 'wikipedia.org',
                                    user_id: user.id)
      end
      let(:text) { 'Feedback' }

      before do
        login_as user
        if meth == '#index'
          visit feedback_form_responses_path
        else
          visit feedback_form_response_path(resp.id)
        end
      end

      context 'non-admin' do
        context 'current user' do
          it 'denies access' 

        end
        context 'logged out' do
          it 'denies access' 

        end
      end
      context 'admin' do
        let(:user) { create(:admin) }
        it 'permits' 

      end
    end
  end
end

