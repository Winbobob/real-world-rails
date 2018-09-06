require 'spec_helper'


describe Reports::Activities::DetailedController do

  let(:team) { FactoryGirl.create(:team) }

  let(:user) { FactoryGirl.create(:user, teams: [team]) }
  let(:team_leader) { FactoryGirl.create(:team_leader, teams: [team]) }
  let(:accountant) { FactoryGirl.create(:accountant) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:swag_ag) { FactoryGirl.create(:customer, name: 'swag ag') }
  let(:yolo_inc) { FactoryGirl.create(:customer, name: 'yolo inc') }

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

    context 'for signed-in teamleaders' do
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


    let(:support) { FactoryGirl.create(:activity_type, name: 'support') }
    let(:maintenance) { FactoryGirl.create(:activity_type, name: 'maintenance') }

    let(:project) { FactoryGirl.create(:project, name: 'project x') }

    before do
      FactoryGirl.create(:activity, user: user, duration: 2.hours, activity_type: support, customer: swag_ag, project: project, date: '2010-01-01', billable: false, reviewed: true)
      FactoryGirl.create(:activity, user: user, duration: 5.minutes, activity_type: maintenance, customer: swag_ag, date: '2010-01-01', billable: true)
      FactoryGirl.create(:activity, user: user, duration: 55.minutes, activity_type: maintenance, customer: swag_ag, date: '2010-01-05', billable: true, reviewed: true, billed: true)
      FactoryGirl.create(:activity, user: user, duration: 1.hour, activity_type: support, customer: swag_ag, date: '2010-01-10', billable: true, reviewed: true, billed: false)
      FactoryGirl.create(:activity, user: user, duration: 30.minutes, activity_type: support, customer: yolo_inc, date: '2010-01-01', billable: true, reviewed: true)
      FactoryGirl.create(:activity, user: user, duration: 15.minutes, activity_type: support, customer: yolo_inc, date: '2010-01-01', billable: true, reviewed: true, billed: true)
      FactoryGirl.create(:activity, user: user, duration: 60.minutes, activity_type: support, customer: yolo_inc, date: '2011-01-01', billable: true, reviewed: true, billed: true)
    end

    describe 'index' do
      context 'as admin' do
        before do
          test_sign_in admin
        end

        it 'assigns the grouped activities' 


        it 'assigns the subtotals' 


        it 'assigns the totals' 

      end
    end
  end
end

