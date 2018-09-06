require 'spec_helper'

describe ActivitiesController do
  render_views

  let(:team) { FactoryGirl.create(:team) }

  let(:user) { FactoryGirl.create(:user, teams: [team]) }
  let(:team_leader) { FactoryGirl.create(:team_leader, teams: [team]) }
  let(:admin) { FactoryGirl.create(:admin) }

  shared_examples 'correct duration handling' do
    it 'handles a float in hours' 


    it 'handles an integer in minutes' 


    it 'handles HH:MM' 

  end

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed-in users' do
    before do
      test_sign_in user
    end

    describe 'GET "index"' do
      it 'renders the :index template' 

    end

    describe 'GET "new"' do
      it 'renders the :new template' 


      it 'preselects the last activity type' 


      it 'handles the case when a user does not have an activity' 


    end

    describe 'GET "edit"' do
      context 'with an existing activitiy' do
        let!(:activity) { FactoryGirl.create(:activity, user: user) }

        it 'renders the :edit template' 

      end

      context 'without an existing activitiy' do
        it 'raises an error' 

      end
    end

    describe 'PUT "update"' do
      let!(:activity) { FactoryGirl.create(:activity, user: user) }
      let(:customer) { FactoryGirl.create :customer }
      let(:activity_type) { FactoryGirl.create :activity_type }
      let(:date) { '1993-05-01' }

      context 'with valid parameters' do
        let(:params_activity) do
          {
            customer_number: customer.number,
            activity_type_id: activity_type.id,
            date: date,
            duration: '00:20'
          }
        end

        let(:params) do
          {
            user_id: user.id,
            id: activity.id,
            activity: params_activity
          }
        end

        it 'redirects back' 


        it 'changes the attributes' 


        it_behaves_like 'correct duration handling'
      end
    end

    describe 'POST "create"' do
      let(:activity_type) { FactoryGirl.create :activity_type }
      let(:customer) { FactoryGirl.create :customer }
      let(:date) { '1993-05-01' }

      context 'with valid parameters' do
        let(:params_activity) do
          {
            customer_number: customer.number,
            activity_type_id: activity_type.id,
            date: date,
            duration: '00:20'
          }
        end

        let(:params) do
          {
            user_id: user.id,
            activity: params_activity
          }
        end

        it 'redirects back' 


        it 'creates an activity' 


        context 'for the selected user' do
          it 'creates the activity in the name of the selected user' 

        end

        it_behaves_like 'correct duration handling'
      end

      context 'with invalid parameters' do
        context 'for the selected user' do
          it 'will NOT create the activity, e.g. through some update_attribute black magic!' 

        end
      end
    end

    describe 'DELETE "destroy"' do
      context 'with an existing activitiy' do
        let(:date) { '1997-01-07' }
        let!(:activity) { FactoryGirl.create(:activity, user: user, date: date) }

        it 'deletes the activity' 


        it 'redirects back' 

      end

      context 'without an existing activitiy' do
        it 'raises an error' 

      end
    end
  end

  describe 'attribute: reviewed' do
    let(:activity_type) { FactoryGirl.create :activity_type }
    let(:activity) { FactoryGirl.create(:activity, user: user) }
    let(:customer) { FactoryGirl.create(:customer) }

    context 'as user' do
      before do
        test_sign_in user
      end

      it 'cannot update the attribute' 


      it 'cannot alter a reviewed activity' 


      it 'cannot create an activity with the attribute' 

    end

    shared_examples :can_review_activity do
      it 'can update the attribute' 


      it 'can create an activity with the attribute' 

    end

    context 'as a teamleader' do
      before do
        test_sign_in team_leader
      end

      include_examples :can_review_activity
    end

    context 'as a teamleader' do
      before do
        test_sign_in admin
      end

      include_examples :can_review_activity
    end
  end

end

