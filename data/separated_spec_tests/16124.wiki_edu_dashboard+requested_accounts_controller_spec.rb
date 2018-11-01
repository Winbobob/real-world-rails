# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/importers/user_importer"

describe RequestedAccountsController do
  before { allow(Features).to receive(:enable_account_requests?).and_return(true) }

  describe '#request_account' do
    let(:course) { create(:course, end: Time.zone.today + 1.week) }
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:username) { 'username' }
    let(:email) { 'valid@example.com' }

    describe '#request_account' do
      let(:requested_account) do
        create(
          :requested_account,
          course: course,
          username: username,
          email: email
        )
      end

      it 'returns an error if the passcode is invalid' 


      it 'returns an error if the email is invalid' 


      it 'adds new requested accounts to the course' 


      it 'updates an attribute if the request already exist' 


      it 'returns a 500 if user is not authorized create accounts now' 


      it 'renders a success message if account creation is successful' 


      it 'raises an error if account requests are not enabled' 

    end

    describe '#create_accounts' do
      before { RequestedAccount.create(course_id: course.id, username: username, email: email) }

      it 'does not create the accounts if user is not authorized' 


      it 'creates the accounts if user is authorized' 

    end

    describe '#enable_account_requests' do
      it 'sets the flag :register_accounts to true' 

    end

    describe '#destroy' do
      let!(:requested_account) do
        create(:requested_account, course_id: course.id, username: username, email: email)
      end

      it 'deletes a request account if user is authorized' 


      it 'does not delete a request account if user is not authorized' 

    end
  end
end

