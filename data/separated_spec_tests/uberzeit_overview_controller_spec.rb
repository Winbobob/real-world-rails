require 'spec_helper'

describe Reports::OverviewController do

  let(:user) { FactoryGirl.create(:user) }

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed-in users' do
    before do
      User.stub(:find) do |*args|
        if args.first.to_i == user.id
          user
        else
          User.find_by_id(args.first)
        end
      end
    end

    shared_examples_for "assigned vars" do
      it 'assigns overtime' 


      it 'assigns month_total_work' 


      it 'assigns month_percent_done' 


      describe 'absences' do
        before do
          FindDailyAbsences.stub(:new).and_return(OpenStruct.new(result_grouped_by_date: []))
        end

        it 'assigns personal_absences' 


        it 'assigns team_absences' 

      end

      it 'assigns vacation_redeemed' 


      it 'assigns vacation_remaining' 

    end


    context 'current user' do
      before do
        test_sign_in user
      end

      describe 'GET "index"' do
        it_behaves_like "assigned vars"

        it 'renders the :index template' 


        context 'with no planned work' do
          before(:each) do
            TimeSheet.any_instance.stub(:planned_working_time).and_return(0)
          end

          it 'does not raise an error' 

        end

        context 'on 1st january' do
          before { Timecop.freeze('2014-01-01'.to_date) }

          it 'does not raise an error' 

        end
      end
    end


    context 'other user' do
      let(:admin) { FactoryGirl.create(:admin) }

      before do
        test_sign_in admin
      end

      describe 'GET "index"' do
        it_behaves_like "assigned vars"
      end
    end
  end
end

