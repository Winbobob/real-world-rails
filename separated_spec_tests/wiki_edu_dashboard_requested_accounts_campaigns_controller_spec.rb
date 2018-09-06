# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/importers/user_importer"

describe RequestedAccountsCampaignsController do
  describe '#request_account' do
    let(:course) { create(:course, end: Time.zone.today + 1.week) }
    let(:campaign) { create(:campaign, register_accounts: true) }

    let!(:campaigns_courses) do
      create(
        :campaigns_course,
        course_id: course.id,
        campaign_id: campaign.id
      )
    end

    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:requested_account) do
      create(
        :requested_account,
        course: course,
        username: 'username',
        email: 'email@example.com'
      )
    end

    describe '#create_accounts' do
      before do
        RequestedAccount.create(course_id: course.id, username: 'username',
                                email: 'email@example.com')
      end

      it 'does not create the accounts if user is not authorized' 


      it 'does not create the accounts if account requests are disabled' 


      it 'creates the accounts if user is authorized' 

    end

    describe '#disable_account_requests' do
      it 'sets the :register_accounts to false' 

    end

    describe '#enable_account_requests' do
      it 'sets the :register_accounts to true' 

    end
  end
end

