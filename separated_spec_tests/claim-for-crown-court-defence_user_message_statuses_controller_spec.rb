# == Schema Information
#
# Table name: user_message_statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message_id :integer
#  read       :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe UserMessageStatusesController, type: :controller do
  describe 'GET #index' do
    let(:external_user) { create(:external_user) }

    before do
      create(:message)
      sign_in external_user.user
      get :index
    end

    it 'assigns @user_message_statuses for the current user' 


    it 'renders the index template' 

  end

  describe 'PUT #update' do
    let(:external_user) { create(:external_user) }
    let(:message) { create(:message) }

    before do
      create(:message)
      sign_in external_user.user
      request.env['HTTP_REFERER'] = 'redirect-to-page'
      put :update, params: { id: message.user_message_statuses.first }
    end

    it 'marks the message as read' 

  end
end

