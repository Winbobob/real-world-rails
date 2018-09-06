require 'spec_helper'

describe CreateUserJobs do
  describe 'associate_ownerships' do
    it 'assigns any ownerships that match the user email' 

  end

  describe 'associate_membership_invites' do
    it 'assigns any organization invitations that match the user email, and mark user confirmed if invited' 

  end

  describe 'send_welcome_email' do
    it 'enques the email' 

  end

  describe 'send_confirmation_email' do
    it 'enques the email' 

  end

  describe 'perform_create_jobs' do
    it "sends confirmation email if user isn't confirmed" 


    it 'sends welcome email and performs confirmed jobs if user is confirmed' 

  end

  describe 'perform_confirmed_jobs' do
    it 'creates confirmed email, associates' 

  end
end

