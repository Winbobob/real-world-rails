require 'spec_helper'

describe Profiles::NotificationsController do
  let(:user) do
    create(:user) do |user|
      user.emails.create(email: 'original@example.com')
      user.emails.create(email: 'new@example.com')
      user.notification_email = 'original@example.com'
      user.save!
    end
  end

  describe 'GET show' do
    it 'renders' 

  end

  describe 'POST update' do
    it 'updates only permitted attributes' 


    it 'shows an error message if the params are invalid' 

  end
end

