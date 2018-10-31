require 'spec_helper'

describe FeedbacksController do
  describe 'index' do
    it 'renders with revised_layout' 

  end

  describe 'create' do
    let(:feedback_attrs) do
      {
        name: 'something cool',
        email: 'example@stuff.com',
        title: 'a title and things',
        body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
              tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
              quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
              consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
              cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
              proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      }
    end
    let(:user) { FactoryGirl.create(:user) }

    context 'valid feedback' do
      it 'creates a feedback message' 

    end

    context 'feedback with generated title' do
      it 'creates a feedback' 

    end

    context 'feedback with additional' do
      it 'creates a feedback message' 

    end

    context 'invalid feedback' do
      context 'no referrer' do
        it 'does not create a feedback message' 

      end
      context 'referrer set' do
        it 'does not create a feedback message' 

      end
    end
  end
end

