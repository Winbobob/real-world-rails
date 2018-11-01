# frozen_string_literal: true

require 'spec_helper'

describe CustomDeviseMailer do
  let(:inviter) { create(:user2) }
  let(:recipient) { '123@abc.com' }
  let(:key) { 'invitation_instructions' }
  let(:email) { Devise.mailer.deliveries.last }

  describe 'subject_for' do
    context 'if the inviting user has a name' do
      it 'includes the inviter\'s name in the subject' 

    end

    context 'if the inviting user does not have a name' do
      it 'uses "Someone" in place of the inviter\'s name' 

    end
  end
end

