# frozen_string_literal: true

require 'rails_helper'

describe FeedbackFormResponsesController do
  describe '#new' do
    it 'renders new' 


    describe 'sets ivars' do
      describe 'subject' do
        context 'referer in query params' do
          let(:referer) { 'wikipedia.org' }
          it 'sets referer from params' 

        end
        context 'referer on request object' do
          let(:referer) { 'bananas.com' }
          # workaround for https://github.com/rspec/rspec-rails/issues/1655
          before { request.env['HTTP_REFERER'] = referer }
          it 'sets referer from request object' 

        end
      end
      describe 'feedback_form_response' do
        it 'sets ivar to a new FeedbackFormResponse' 

      end
    end
  end

  describe '#index' do
    let(:user) { create(:admin) }
    before { allow(controller).to receive(:current_user).and_return(user) }

    describe 'ivars' do
      it 'sets responses' 

    end

    describe 'template' do
      it 'renders index' 


      context 'not-signed in' do
        let(:user) { create(:user) }
        it "doesn't allow" 

      end
    end
  end

  describe '#show' do
    let!(:form) { FeedbackFormResponse.create(body: 'bananas') }
    let(:user)  { create(:admin) }
    before { allow(controller).to receive(:current_user).and_return(user) }

    describe 'ivars' do
      it 'sets responses' 

    end

    describe 'template' do
      it 'renders index' 


      context 'not-signed in' do
        let(:user) { create(:user) }
        it "doesn't allow" 

      end
    end
  end

  describe '#create' do
    let(:user) { create(:user) }
    before { allow(controller).to receive(:current_user).and_return(user) }
    context 'non-admin' do
      let(:body) { 'bananas' }
      it 'creates successfully' 

    end
  end

  describe '#confirmation' do
    describe 'rendering' do
      it 'renders template' 

    end
  end
end

