require 'spec_helper'

describe "Admin::AbuseReports", :js  do
  let(:user) { create(:user) }

  context 'as an admin' do
    before do
      sign_in(create(:admin))
    end

    describe 'if a user has been reported for abuse' do
      let!(:abuse_report) { create(:abuse_report, user: user) }

      describe 'in the abuse report view' do
        it 'presents information about abuse report' 

      end

      describe 'in the profile page of the user' do
        it 'shows a link to the admin view of the user' 

      end
    end

    describe 'if a many users have been reported for abuse' do
      let(:report_count) { AbuseReport.default_per_page + 3 }

      before do
        report_count.times do
          create(:abuse_report, user: create(:user))
        end
      end

      describe 'in the abuse report view' do
        it 'presents information about abuse report' 

      end
    end
  end
end

