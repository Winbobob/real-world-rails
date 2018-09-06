require 'spec_helper'


describe Reports::Activities::FilterController do

  let(:team) { FactoryGirl.create(:team) }

  let(:user) { FactoryGirl.create(:user, teams: [team]) }
  let(:team_leader) { FactoryGirl.create(:team_leader, teams: [team]) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:accountant) { FactoryGirl.create(:accountant) }

  describe 'access' do
    context 'for non-signed in users' do
      it 'redirects to login' 

    end

    context 'for signed-in users' do
      before do
        test_sign_in user
      end

      describe 'GET "index"' do
        it 'allows access' 

      end
    end

    context 'for signed-in teamleaders' do
      before do
        test_sign_in team_leader
      end

      describe 'GET "index"' do
        it 'grants access' 

      end
    end

    context 'for signed-in accountants' do
      before do
        test_sign_in accountant
      end

      describe 'GET "index"' do
        it 'grants access' 

      end
    end

    context 'for signed-in admins' do
      before do
        test_sign_in admin
      end

      describe 'GET "index"' do
        it 'grants access' 

      end
    end
  end

  describe 'activities' do
    let(:swag_ag) { FactoryGirl.create(:customer, name: 'swag ag') }
    let(:yolo_inc) { FactoryGirl.create(:customer, name: 'yolo inc') }

    let(:support) { FactoryGirl.create(:activity_type, name: 'support') }
    let(:maintenance) { FactoryGirl.create(:activity_type, name: 'maintenance') }

    let(:project) { FactoryGirl.create(:project, name: 'project x') }

    let!(:upgrade_hard_disk) { FactoryGirl.create(:activity, user: user, duration: 2.hours, activity_type: support, customer: swag_ag, project: project, date: '2010-01-01', billable: false, reviewed: true) }
    let!(:reboot_server) { FactoryGirl.create(:activity, user: user, duration: 5.minutes, activity_type: maintenance, customer: swag_ag, date: '2010-01-01', billable: true) }
    let!(:swap_ram_module) { FactoryGirl.create(:activity, user: user, duration: 30.minutes, activity_type: support, customer: yolo_inc, date: '2010-01-01', billable: true, reviewed: true) }
    let!(:exchange_power_supply) { FactoryGirl.create(:activity, user: user, duration: 15.minutes, activity_type: support, customer: yolo_inc, date: '2010-01-01', billable: true, reviewed: true, billed: true) }
    let!(:other_year) { FactoryGirl.create(:activity, user: user, duration: 60.minutes, activity_type: support, customer: yolo_inc, date: '2011-01-01', billable: true, reviewed: true, billed: true) }

    describe 'index' do
      context 'as admin' do
        before do
          test_sign_in admin
        end

        it 'shows the correct sums grouped by activity type' 


        it 'shows the correct sums grouped by customer' 


        it 'shows the correct sums grouped by project' 

      end
    end
  end
end

