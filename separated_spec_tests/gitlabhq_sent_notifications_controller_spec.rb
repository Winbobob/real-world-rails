require 'rails_helper'

describe SentNotificationsController do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:sent_notification) { create(:sent_notification, project: project, noteable: issue, recipient: user) }

  let(:issue) do
    create(:issue, project: project, author: user) do |issue|
      issue.subscriptions.create(user: user, project: project, subscribed: true)
    end
  end

  describe 'GET unsubscribe' do
    context 'when the user is not logged in' do
      context 'when the force param is passed' do
        before do
          get(:unsubscribe, id: sent_notification.reply_key, force: true)
        end

        it 'unsubscribes the user' 


        it 'sets the flash message' 


        it 'redirects to the login page' 

      end

      context 'when the force param is not passed' do
        before do
          get(:unsubscribe, id: sent_notification.reply_key)
        end

        it 'does not unsubscribe the user' 


        it 'does not set the flash message' 


        it 'redirects to the login page' 

      end
    end

    context 'when the user is logged in' do
      before do
        sign_in(user)
      end

      context 'when the ID passed does not exist' do
        before do
          get(:unsubscribe, id: sent_notification.reply_key.reverse)
        end

        it 'does not unsubscribe the user' 


        it 'does not set the flash message' 


        it 'returns a 404' 

      end

      context 'when the force param is passed' do
        before do
          get(:unsubscribe, id: sent_notification.reply_key, force: true)
        end

        it 'unsubscribes the user' 


        it 'sets the flash message' 


        it 'redirects to the issue page' 

      end

      context 'when the force param is not passed' do
        let(:merge_request) do
          create(:merge_request, source_project: project, author: user) do |merge_request|
            merge_request.subscriptions.create(user: user, project: project, subscribed: true)
          end
        end
        let(:sent_notification) { create(:sent_notification, project: project, noteable: merge_request, recipient: user) }

        before do
          get(:unsubscribe, id: sent_notification.reply_key)
        end

        it 'unsubscribes the user' 


        it 'sets the flash message' 


        it 'redirects to the merge request page' 

      end
    end
  end
end

